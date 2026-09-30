# tree

Tree prints a folder's contents as an indented outline, so you can see how files and subfolders fit together at a glance. It's handy for checking a project's layout before you ask Claude to change it, pasting a folder structure into a handoff doc or chat, and seeing where disk space is going. It works alongside Git: `tree --gitignore` shows the same files Git cares about. Run `tree` with no arguments to list the current folder.

*Last verified: September 2026 with tree 2.3.2 on macOS 27.0 (`tree --version`).* If a command below fails, check `tree --help` first: flags change between versions.

tree only reads folders, so it's safe to run anywhere. The one exception is `-o`, which writes its output to a file and replaces any file with the same name. It's marked **Careful** below.

## Contents

- [Official links](#official-links)
- [Before you start](#before-you-start)
- [Daily and weekly](#daily-and-weekly)
- [Common commands](#common-commands)
  - [Limiting what is shown](#limiting-what-is-shown)
  - [Filtering and ignoring](#filtering-and-ignoring)
  - [File details and sizes](#file-details-and-sizes)
  - [Sorting](#sorting)
  - [Output formats](#output-formats)
- [When things go wrong](#when-things-go-wrong)
- [Using tree with Claude Code](#using-tree-with-claude-code)
- [Related](#related)

## Official links

- [tree home page](https://oldmanprogrammer.net/source.php?dir=projects/tree): source, current release, and the README
- [tree changelog](https://oldmanprogrammer.net/projects/tree/CHANGES): what changed in each version, useful when a flag behaves differently
- [tree on GitHub](https://github.com/Old-Man-Programmer/tree): the project's public repository and issue tracker

For the full manual, run `man tree` in Terminal (press `q` to leave it).

## Before you start

This kit installs tree through the [`Brewfile`](../Brewfile). To check it's ready:

```sh
tree --version                  # Confirm it's installed and show the version
```

- Words in angle brackets, like `<path>`, are blanks to fill in. Replace the whole thing, brackets included: `tree <path>` becomes `tree ~/Documents`.
- A comment that starts with **Careful** marks a command that changes or deletes things in a way that's hard to undo. Read the note under its block before you run it.

## Daily and weekly

```sh
tree -L 2                       # Show only two levels deep
tree -d                         # Show folders only
tree -a -I .git                 # Include hidden files, but skip .git
tree --gitignore                # Hide anything ignored by .gitignore
tree <path>                     # Show a folder at another path
tree -h --du                    # Show sizes, with each folder's full total
```

`--du` only adds up what tree opens. Combined with `-L` or `-d`, each folder shows its own small size instead of its contents, so leave those flags off when you want real totals. For a quick size per top-level item, the built-in `du -sh *` is faster.

## Common commands

### Limiting what is shown

```sh
tree -L 2 -d                    # Show the top two levels of folders only
tree --filelimit 50             # Skip opening folders with more than 50 entries
tree --prune                    # Hide empty folders
tree --noreport                 # Hide the file and folder count at the end
```

### Filtering and ignoring

Patterns use wildcards: `*` matches any run of characters. Put patterns in quotes so the shell doesn't expand them first.

```sh
tree -P "*.md"                  # List only files matching a pattern
tree -P "*.md" --prune          # Match a pattern and hide folders left empty
tree -I node_modules            # Skip files or folders matching a pattern
tree -I "node_modules|dist"     # Skip several patterns at once, separated by |
tree --ignore-case -P "*.jpg"   # Match patterns regardless of case
```

### File details and sizes

```sh
tree -h                         # Show human-readable file sizes
tree -D                         # Show the last modified date
tree -p                         # Show file permissions
tree -f                         # Print the full path on each line
tree -F                         # Add / after folders and symbols after other types
tree -Q                         # Wrap names in double quotes
```

### Sorting

```sh
tree -t                         # Sort by last modified time
tree -r                         # Reverse the sort order
tree --dirsfirst                # List folders before files
tree --sort=size                # Sort by size (also name, mtime, version)
tree -U                         # Leave unsorted, in the order on disk
```

### Output formats

```sh
tree --charset=ascii            # Use plain ASCII lines instead of box characters
tree -o structure.txt           # Careful: writes to a file, replacing any with that name
tree -C                         # Force color output, even when piped
tree -i -f                      # List full paths flat, with no indentation lines
tree -J                         # Output as JSON
tree -X                         # Output as XML
tree -H . -o tree.html          # Careful: writes an HTML page, replacing tree.html
```

`-o` overwrites an existing file with that name without asking, and there's no undo. Run `ls` first to check the name is free, or pick a new one such as `structure-2026-09.txt`. If the file is in a Git project, you can restore the last committed version with `git restore <file>`.

## When things go wrong

| What you see | What it means | What to do |
| --- | --- | --- |
| `zsh: command not found: tree` | tree isn't installed, or Terminal was open before it was | Run `./setup.sh` from the kit folder, or `brew install tree`, then open a new Terminal window |
| `<path>  [error opening dir]` | The folder doesn't exist at that path, or there's a typo | Check the spelling. Drag the folder from Finder into Terminal to paste its exact path |
| `tree: Missing argument to -L option.` | `-L` needs a number after it | Add the depth: `tree -L 2` |
| Output scrolls for a long time | The folder is large, such as your home folder or `node_modules` | Press `Ctrl-C` to stop, then add `-L 2` or `-I node_modules` |
| Lines like `â”œâ”€â”€ a.md` instead of `├── a.md` after pasting | The app you pasted into read tree's box-drawing characters in the wrong text encoding | Rerun with `--charset=ascii` for plain `\|--` lines, and paste again |
| A file you needed was replaced by `-o` | `-o` overwrote it without asking | Restore it from Git with `git restore <file>`, or from Time Machine if it wasn't committed |

## Using tree with Claude Code

Claude can run tree to get its bearings in a project, then explain the layout or suggest where new files belong.

```text
Run `tree -L 3 --gitignore` in this project. Explain in plain language what each top-level folder is for, and tell me where a new onboarding screen's copy and images should go. Don't create or move any files.
```

Before you act on the result, run the same `tree` command yourself and check that every folder Claude describes is really there. Its explanation is a best guess from names, so open a file or two to confirm. If a folder holds research notes or client material, use `-I` to leave it out before you paste the output anywhere outside your team.

## Related

- [CLI reference index](README.md): all the command references in this kit
