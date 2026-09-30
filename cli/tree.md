# tree

Tree prints a folder's contents as an indented tree, so you can see how files and subfolders fit together at a glance. It's handy for checking a project's layout, sharing a structure in docs or chat, and seeing where disk space is going. Run `tree` with no arguments to list the current folder.

## Contents

- [Daily and weekly](#daily-and-weekly)
- [Common commands](#common-commands)
  - [Limiting what is shown](#limiting-what-is-shown)
  - [Filtering and ignoring](#filtering-and-ignoring)
  - [File details and sizes](#file-details-and-sizes)
  - [Sorting](#sorting)
  - [Output formats](#output-formats)

## Daily and weekly

```sh
tree                            # Show the current folder as a tree
tree -L 2                       # Show only two levels deep
tree -a -I .git                 # Include hidden files, but skip .git
tree --gitignore                # Hide anything ignored by .gitignore
tree -d                         # Show folders only
tree --version                  # Show the installed version
```

## Common commands

### Limiting what is shown

```sh
tree <path>                     # Show a folder at another path
tree -L 3                       # Descend at most three levels
tree -d                         # List directories only
tree -a                         # Include hidden files and folders
tree --filelimit 50             # Don't open folders with more than 50 entries
tree --prune                    # Hide empty folders
tree --noreport                 # Hide the file and folder count at the end
```

### Filtering and ignoring

```sh
tree -P "*.md"                  # List only files matching a pattern
tree -P "*.md" --prune          # Same, without empty folders
tree -I node_modules            # Skip files or folders matching a pattern
tree -I "node_modules|dist"     # Skip several patterns at once, separated by |
tree --gitignore                # Respect .gitignore files
tree --ignore-case -P "*.jpg"   # Match patterns regardless of case
```

### File details and sizes

```sh
tree -h                         # Show human-readable file sizes
tree -h --du                    # Include folder sizes, totaled from their contents
tree -D                         # Show the last modified date
tree -p                         # Show file permissions
tree -f                         # Print the full path on each line
tree -F                         # Mark folders with / and executables with *
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
tree -o structure.txt           # Write the tree to a file
tree -C                         # Force color output, even when piped
tree -i -f                      # Flat list of full paths, no indentation lines
tree -J                         # Output as JSON
tree -X                         # Output as XML
tree -H . -o tree.html          # Output as an HTML page
tree --charset=ascii            # Use plain ASCII lines instead of box characters
```
