# prettier

Prettier is a code formatter. It rewrites a file's spacing, indentation, quotes, and line breaks to one consistent style, so nobody has to fix them by hand. It handles CSS, HTML, JSON, YAML, Markdown, JavaScript, and more. For designers, it's handy for tidying design tokens in JSON, cleaning up the Markdown in a guide, and making Claude's edits to a file easy to review in a diff. Run `prettier <file>` to print the formatted version without changing the file.

_Last verified: September 2026 with prettier 3.9.9 on macOS 27.0 (`prettier --version`)._ If a command below fails, check `prettier --help` first: flags change between versions.

Prettier only reads files unless you pass `--write`, which rewrites them in place. That flag is marked **Careful** below.

## Contents

- [Official links](#official-links)
- [Before you start](#before-you-start)
- [Daily and weekly](#daily-and-weekly)
- [Common commands](#common-commands)
  - [Choosing files](#choosing-files)
  - [Changing the style](#changing-the-style)
  - [Config and ignore files](#config-and-ignore-files)
  - [Formatting piped text](#formatting-piped-text)
- [When things go wrong](#when-things-go-wrong)
- [Using prettier with Claude Code](#using-prettier-with-claude-code)
- [Related](#related)

## Official links

- [Prettier website](https://prettier.io): overview and the playground, where you can try options in a browser
- [Prettier documentation](https://prettier.io/docs/): the CLI, options, and configuration files
- [Prettier rationale](https://prettier.io/docs/rationale): why it formats code the way it does

## Before you start

This kit installs prettier through the [`Brewfile`](../Brewfile). To check it's ready:

```sh
prettier --version              # Confirm it's installed and show the version
```

- Words in angle brackets, like `<file>`, are blanks to fill in. Replace the whole thing, brackets included: `prettier --check <file>` becomes `prettier --check README.md`.
- A comment that starts with **Careful** marks a command that changes or deletes things in a way that's hard to undo. Read the note under its block before you run it.
- Prettier skips anything listed in `.gitignore` and `.prettierignore`, and it skips `node_modules`.

## Daily and weekly

```sh
prettier --check .              # List files that aren't formatted, change nothing
prettier --check <file>         # Check one file
prettier --write <file>         # Careful: rewrites the file in place
prettier --write "docs/**/*.md" # Careful: rewrites every Markdown file under docs
prettier <file>                 # Print the formatted version, change nothing
prettier -l .                   # Print only the names of unformatted files
```

`--write` changes files without asking. In a Git project, run `git status` first so you start from a clean state, then `git diff` afterward to review what changed. To undo, use `git restore <file>` for a file you hadn't changed before, or `git restore .` for everything. Files that aren't in Git have no undo, so run `--check` first and keep a copy.

## Common commands

### Choosing files

Put patterns in quotes so Prettier expands them itself, which works the same in every shell.

```sh
prettier --check "**/*.json"    # Check every JSON file, in all subfolders
prettier --check "src/**/*.{css,html}" # Check several file types at once
prettier --check . --ignore-unknown # Skip file types Prettier can't format
prettier --check "*.foo" --no-error-on-unmatched-pattern # Don't fail when nothing matches
prettier --file-info <file>     # Show whether a file is ignored and which parser it uses
```

### Changing the style

Prettier's defaults suit most projects. Options given on the command line override a config file.

```sh
prettier --tab-width 4 <file>   # Indent with four spaces instead of two
prettier --use-tabs <file>      # Indent with tabs
prettier --single-quote <file>  # Use single quotes instead of double
prettier --print-width 100 <file> # Wrap lines at 100 characters
prettier --prose-wrap always <file> # Re-wrap Markdown paragraphs to the print width
prettier --no-config <file>     # Ignore any config file and use the defaults
```

### Config and ignore files

Put a `.prettierrc` file in the project root to set options once for everyone. Put patterns in a `.prettierignore` file, written like `.gitignore`, to skip files you don't want formatted.

```sh
prettier --find-config-path <file> # Print which config file applies to a file
prettier --config <path> <file> # Use a specific config file
prettier --ignore-path <path> . # Read ignore patterns from another file
prettier --cache --write .      # Careful: rewrites files, but skips ones unchanged since last run
```

### Formatting piped text

```sh
pbpaste | prettier --parser json # Format JSON from the clipboard and print it
prettier --stdin-filepath a.md < <file> # Format piped text, using the named file's rules
```

## When things go wrong

| What you see | What it means | What to do |
| --- | --- | --- |
| `zsh: command not found: prettier` | prettier isn't installed, or Terminal was open before it was | Run `./setup.sh` from the kit folder, or `brew install prettier`, then open a new Terminal window |
| `[warn] Code style issues found in 2 files. Run Prettier with --write to fix.` | `--check` found files that don't match the style. Nothing was changed | Run `prettier --write` on those files, then review with `git diff` |
| `[error] No files matching the pattern were found: "nope.md".` | The path or pattern matches nothing, often a typo or an ignored folder | Check the spelling and the current folder with `pwd` and `ls` |
| `[error] bad.json: SyntaxError: Unexpected token (2:1)` | The file has a syntax error, so Prettier can't format it | Fix the error at the line shown, such as a missing bracket or comma, then run it again |
| `[error] Can not find configure file for "a.yaml".` | No `.prettierrc` applies to that file. Prettier is using its defaults | Nothing to fix. Create a `.prettierrc` only if you want different options |
| A `--write` changed more than you expected | Prettier reformatted every line that didn't match its style | Review with `git diff`, then `git restore <file>` to undo. Format a few files at a time |

## Using prettier with Claude Code

Claude can run prettier after it edits files, so its changes match the project's style and the diff shows only real changes.

```text
Run `prettier --check .` in this project and list the files that aren't formatted. Don't change anything yet. Then tell me which ones you'd format and why.
```

Before you let Claude run `--write`, run `git status` so you start from a clean state. Afterward, read `git diff` yourself: a formatter can touch many lines, and you want to confirm it changed spacing and nothing else. If a file holds interview notes or client material, don't paste the output anywhere outside your team.

## Related

- [CLI reference index](README.md): all the command references in this kit
