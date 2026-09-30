# pre-commit

pre-commit runs a checklist of automatic checks each time you make a Git commit. A check can catch a stray password, fix trailing spaces, or format a file before it's saved into your project's history. If a check fails, the commit stops so you can fix the problem first. It works with Git and pairs well with gitleaks and prettier: pre-commit runs them for you on every commit. Run `pre-commit run --all-files` to try the checks on every file in a project.

_Last verified: September 2026 with pre-commit 4.6.2 on macOS 27.0 (`pre-commit --version`)._ If a command below fails, check `pre-commit --help` first: flags change between versions.

pre-commit works one project at a time. Installing the tool does nothing until you add a `.pre-commit-config.yaml` file to a project and run `pre-commit install` there. Some checks fix files for you, and that changes your files. Those steps are marked **Careful** below.

## Contents

- [Official links](#official-links)
- [Before you start](#before-you-start)
- [Daily and weekly](#daily-and-weekly)
- [Common commands](#common-commands)
  - [Setting up a project](#setting-up-a-project)
  - [Running checks](#running-checks)
  - [Keeping checks up to date](#keeping-checks-up-to-date)
  - [Removing and cleaning up](#removing-and-cleaning-up)
- [When things go wrong](#when-things-go-wrong)
- [Using pre-commit with Claude Code](#using-pre-commit-with-claude-code)
- [Related](#related)

## Official links

- [pre-commit website](https://pre-commit.com): how it works, with a quick start
- [Supported hooks](https://pre-commit.com/hooks.html): a searchable list of ready-made checks
- [pre-commit on GitHub](https://github.com/pre-commit/pre-commit): the source and issue tracker

## Before you start

This kit installs pre-commit through the [`Brewfile`](../Brewfile). To check it's ready:

```sh
pre-commit --version            # Confirm it's installed and show the version
```

- Words in angle brackets, like `<hook-id>`, are blanks to fill in. Replace the whole thing, brackets included: `pre-commit run <hook-id>` becomes `pre-commit run trailing-whitespace`.
- A comment that starts with **Careful** marks a command that changes or deletes things in a way that's hard to undo. Read the note under its block before you run it.
- A **hook** is one check. The **config file** `.pre-commit-config.yaml` lists which hooks a project uses. It sits in the project's top folder and is saved in Git, so everyone on the project runs the same checks.
- The first run in a project downloads each hook and can take a minute. After that it's fast.

## Daily and weekly

```sh
pre-commit install              # Turn on the checks for this project, once
pre-commit run                  # Run the checks on files you've staged
pre-commit run --all-files      # Run the checks on every file in the project
pre-commit run <hook-id>        # Run one check on staged files
pre-commit autoupdate           # Update the hooks in the config to their latest versions
pre-commit --version            # Show the installed version
```

After `pre-commit install`, the checks run by themselves on every `git commit` in that project. You only run `pre-commit run` by hand to test, or to check files you haven't staged.

## Common commands

### Setting up a project

```sh
pre-commit sample-config        # Print a starter config to copy from
pre-commit sample-config > .pre-commit-config.yaml # Careful: replaces any config file already there
pre-commit validate-config      # Check the config file for mistakes
pre-commit install --install-hooks # Turn on the checks and download them now
pre-commit install -f           # Careful: overwrites any hook script Git already has
```

The starter config has four common checks: trailing whitespace, end-of-file fixing, YAML syntax, and large files. Before you overwrite a config, run `ls -a` to see whether one exists. In a Git project you can restore the last saved version with `git restore .pre-commit-config.yaml`.

### Running checks

```sh
pre-commit run --files <file>   # Run the checks on named files only
pre-commit run --all-files --show-diff-on-failure # Run everything, and show what a hook changed
pre-commit run --all-files --fail-fast # Stop at the first check that fails
pre-commit run <hook-id> --all-files # Run one check on every file
pre-commit run --verbose        # Show each hook's output, even when it passes
```

Some hooks fix files as they check them. A fixed file shows as **Failed** with `files were modified by this hook`. The fix is applied to your working copy but not staged, so run `git add <file>` and commit again. Use `git diff` to review what changed.

### Keeping checks up to date

```sh
pre-commit autoupdate --repo <url> # Update only one hook source
pre-commit autoupdate --freeze  # Pin versions to exact commit IDs
pre-commit migrate-config       # Careful: rewrites an old config file to the new format
```

`autoupdate` edits `.pre-commit-config.yaml`. Run `git diff .pre-commit-config.yaml` afterward, then `pre-commit run --all-files` to confirm the new versions still pass.

### Removing and cleaning up

```sh
pre-commit uninstall            # Turn off the checks for this project
pre-commit gc                   # Delete downloaded hooks no project uses
pre-commit clean                # Delete all downloaded hooks, they download again as needed
```

`uninstall` removes the Git hook but leaves your config file alone. Run `pre-commit install` to turn it back on.

## When things go wrong

| What you see | What it means | What to do |
| --- | --- | --- |
| `zsh: command not found: pre-commit` | pre-commit isn't installed, or Terminal was open before it was | Run `./setup.sh` from the kit folder, or `brew install pre-commit`, then open a new Terminal window |
| `InvalidConfigError: .pre-commit-config.yaml is not a file` | The project has no config file, so there's nothing to run | Create one with `pre-commit sample-config > .pre-commit-config.yaml`, or move to the right folder |
| `Trim Trailing Whitespace......Failed` with `files were modified by this hook` | A hook fixed the file and stopped the commit so you can review the change | Run `git diff` to read the fix, then `git add <file>` and commit again |
| `[WARNING] Stashed changes conflicted with hook auto-fixes... Rolling back fixes...` | A hook's fix clashed with changes you hadn't staged, so it undid its fix and kept your work | Stage or commit your other changes first, then run `pre-commit run --all-files` again |
| `==> File bad.yaml` followed by `while parsing a flow node` | The YAML file has a syntax error, often a missing bracket or bad indentation | Fix the line shown, then run `pre-commit validate-config` again |
| The checks don't run when you commit | `pre-commit install` hasn't been run in this project, or the project was freshly cloned | Run `pre-commit install` in the project folder. Each clone needs it once |

## Using pre-commit with Claude Code

Claude can run the checks, read what failed, and suggest fixes. That saves time when a hook prints a long or cryptic message.

```text
Run `pre-commit run --all-files` in this project. Explain each failure in plain language, and tell me which fixes you would make. Don't edit any files or commit anything yet.
```

Before you accept a fix, read `git diff` yourself. Hooks that edit files can touch many lines, and you want to confirm they changed formatting and nothing else. Don't paste hook output into a chat if it shows a password or key. Use gitleaks to check for secrets first.

## Related

- [CLI reference index](README.md): all the command references in this kit
- [GitHub Desktop guide](../docs/github-desktop/README.md): make commits from an app with a window
