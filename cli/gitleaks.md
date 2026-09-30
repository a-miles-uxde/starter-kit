# gitleaks

Gitleaks scans files for secrets such as API keys, passwords, and access tokens, so you can catch them before they reach a shared place like GitHub. It's worth running before you commit a prototype that talks to a real service, or before you push a folder of exported design files and notes. In this kit it works alongside git: gitleaks can scan a folder, a repo's full history, or only the changes you're about to commit. Run `gitleaks --help` to list its commands. When it finds something, it exits with code 1, which is what lets it block a commit from a git hook.

*Last verified: September 2026 with gitleaks 8.30.1 (`gitleaks --version`) on macOS 27.*

If a command below fails, check `gitleaks --help` first: flags change between versions. Gitleaks only reads files. None of its scans change or delete your work, but the reports and hook in [Saving reports](#saving-reports) and [Blocking commits with a hook](#blocking-commits-with-a-hook) write files, so read the notes there first.

## Contents

- [Official links](#official-links)
- [Before you start](#before-you-start)
- [Daily and weekly](#daily-and-weekly)
- [Common commands](#common-commands)
  - [Scanning git repositories](#scanning-git-repositories)
  - [Scanning files and folders](#scanning-files-and-folders)
  - [Saving reports](#saving-reports)
  - [Handling false positives](#handling-false-positives)
  - [Blocking commits with a hook](#blocking-commits-with-a-hook)
- [When things go wrong](#when-things-go-wrong)
- [Using gitleaks with Claude Code](#using-gitleaks-with-claude-code)
- [Related](#related)

## Official links

- [Gitleaks website](https://gitleaks.io): project overview and links to the source and community
- [Gitleaks on GitHub](https://github.com/gitleaks/gitleaks): the README is the main documentation, covering commands, config files, ignoring findings, and hooks
- [Gitleaks releases](https://github.com/gitleaks/gitleaks/releases): changelog for each version

## Before you start

This kit installs gitleaks through the [`Brewfile`](../Brewfile). To check it's ready:

```sh
gitleaks --version              # Confirm it's installed and show the version
```

- Words in angle brackets, like `<file>`, are blanks to fill in. Replace the whole thing, brackets included: `gitleaks dir <path>` becomes `gitleaks dir ~/Documents/prototype`.
- A comment that starts with **Careful** marks a command that changes or deletes things in a way that's hard to undo. Read the note under its block before you run it.

Gitleaks prints what it finds to the terminal, including the secret itself. Add `--redact` when other people can see your screen, or when you plan to paste the output anywhere.

## Daily and weekly

Run these from inside the project folder. The `-v` flag prints each finding: the file, line, rule that matched, and a fingerprint you can use to ignore it later.

```sh
gitleaks git --staged -v        # Scan staged changes before you commit
gitleaks git --pre-commit -v    # Scan edits you haven't staged yet
gitleaks dir . -v               # Scan current files, ignoring git history
gitleaks git -v                 # Scan every commit in the repo's history
gitleaks git -v --redact        # Scan history, hiding secret values on screen
```

`--staged` only sees changes you've added with `git add`. `--pre-commit` only sees changes you haven't staged. Run both if you're unsure. If you commit with GitHub Desktop, run both too: ticking a file's checkbox in Desktop doesn't add it to git's staging area, so `--staged` alone can miss changes you're about to commit.

## Common commands

### Scanning git repositories

`gitleaks git` reads commits, so it finds secrets that were committed and later deleted. A secret that was ever pushed counts as leaked, even if a later commit removed it.

```sh
gitleaks git                    # Scan all commits, showing only a summary
gitleaks git <path>             # Scan a repo at another path
gitleaks git --log-opts="-10"   # Scan only the last ten commits
gitleaks git --log-opts="main..HEAD"  # Scan commits on this branch not yet on main
```

### Scanning files and folders

`gitleaks dir` scans files as they are now. It works on any folder, including ones that aren't git repos, such as a downloads folder of handoff files.

```sh
gitleaks dir <path>             # Scan a folder or a single file
gitleaks dir . --max-target-megabytes 5  # Skip files larger than 5 MB
pbpaste | gitleaks stdin        # Scan text you've copied to the clipboard
```

The `stdin` scan is useful before you paste a config snippet or log into a chat, a ticket, or an AI tool.

### Saving reports

```sh
gitleaks git --redact -r report.json  # Save findings as JSON, secrets hidden
gitleaks git -f sarif -r out.sarif  # Save a SARIF report for GitHub code scanning
gitleaks git -f csv -r report.csv  # Save a spreadsheet-friendly CSV report
gitleaks git --no-banner        # Hide the startup banner
gitleaks git --exit-code 0      # Report findings without failing a script
```

Without `--redact`, a report contains every secret in plain text. `-r` also replaces any existing file with the same name. Keep reports out of the repo, and delete them once you've dealt with the findings.

### Handling false positives

Some findings aren't real secrets, such as a placeholder key in a design system's sample code. The fingerprint appears in the `-v` output and looks like `config.txt:github-pat:2` for a folder scan, or starts with the commit ID for a history scan.

```sh
gitleaks git -r baseline.json   # Record current findings as a baseline
gitleaks git -b baseline.json   # Report only findings not in the baseline
echo "<fingerprint>" >> .gitleaksignore  # Ignore one finding by its fingerprint
gitleaks git -c <config-file>   # Use a custom rules config file
gitleaks git --enable-rule <id>  # Run only the rule with this ID, like github-pat
```

- You only need `-c` for a config file somewhere else. A file named `.gitleaks.toml` at the top of the folder you scan is used automatically.
- To ignore a single line in a file, add the comment `gitleaks:allow` to the end of that line, for example `# gitleaks:allow`.
- A baseline must be saved without `--redact`, or it won't match, so it holds real secrets. Keep `baseline.json` out of the repo.
- Only ignore a finding once you're sure it isn't a real secret. If in doubt, ask an engineer.

### Blocking commits with a hook

A git hook is a small script git runs at a set moment. This one runs gitleaks before every commit in the current repo and stops the commit if it finds a secret. It only affects your copy of the repo, not your teammates'.

```sh
ls .git/hooks/pre-commit        # Check whether a pre-commit hook already exists
printf '#!/bin/sh\ngitleaks git --staged --no-banner\n' > .git/hooks/pre-commit  # Careful: replaces any existing hook
chmod +x .git/hooks/pre-commit  # Let git run the hook
git commit --no-verify          # Careful: skips the secret check for one commit
```

- Run the `ls` line first. If it prints a file name instead of `No such file or directory`, a hook already exists: ask whoever set it up before you replace it.
- To remove the hook, delete `.git/hooks/pre-commit`.
- Only use `--no-verify` when you've checked the finding is a false positive. Prefer adding it to `.gitleaksignore` instead.

## When things go wrong

| What you see | What it means | What to do |
| --- | --- | --- |
| `WRN leaks found: 2` | Gitleaks found possible secrets. | Rerun with `-v` to see each one. If it's real, remove it from the file and rotate the key (ask the service owner to issue a new one). If it's already pushed, treat it as leaked and tell an engineer. |
| `ERR [git] fatal: not a git repository` | You ran `gitleaks git` outside a repo. It still ends with `no leaks found`, but nothing was scanned. | `cd` into the project folder, or use `gitleaks dir <path>` instead. |
| `FTL stat <path>: no such file or directory` | The path you gave doesn't exist. | Check the spelling, or drag the folder into the terminal to paste its path. |
| `FTL unable to load gitleaks config` | The file after `-c` doesn't exist or has errors. | Check the path, or drop `-c` to use the built-in rules. |
| A commit you expected to work is blocked | The pre-commit hook found a secret in your staged changes. | Run `gitleaks git --staged -v` to see it. Remove it, or ignore it if it's a false positive, then commit again. |
| You replaced an existing hook | The `printf` line overwrote `.git/hooks/pre-commit`. There's no undo. | Ask whoever set up the old hook to restore it, or recreate it from the project's setup docs. |

## Using gitleaks with Claude Code

Claude can run a scan and explain each finding in plain language, which helps when you're not sure whether something is a real key.

```text
In this repo, run `gitleaks git --staged -v --redact` and `gitleaks git --pre-commit -v --redact`. For each finding, tell me the file and line, what kind of secret the rule looks for, and whether it looks like a real credential or a placeholder. Don't change or delete any files, and don't add anything to .gitleaksignore.
```

Before you act on the result, open each file and line yourself and confirm what's there, then rerun the scan after any fix. Keep `--redact` in the prompt so secret values don't end up in the conversation, and don't paste real keys, reports, or baselines into any AI tool.

## Related

- [CLI reference index](README.md): all the command references in this kit
- [GitHub Desktop guide](../docs/github-desktop/README.md): committing without the terminal; run `gitleaks git --staged -v` and `gitleaks git --pre-commit -v` before you commit there
- [VS Code guide](../docs/vs-code/README.md): editing files and committing from the editor, where these scans help keep secrets out
