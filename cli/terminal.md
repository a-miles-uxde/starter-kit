# Terminal basics (macOS)

The Terminal app runs a shell — on a new Mac that's zsh — where you type commands instead of clicking. It's how you drive `git`, `gh`, `gitleaks`, and `herdr` from the other guides in this folder. These are the everyday commands underneath all of that: moving around folders, creating and removing files, looking at what's there, and (occasionally) doing something that needs admin rights.

macOS ships the BSD versions of these tools, so flags occasionally differ from what you'll see in a Linux tutorial — noted below where it matters.

## Contents

- [Daily and weekly](#daily-and-weekly)
- [Common commands](#common-commands)
  - [Moving around](#moving-around)
  - [Files and folders](#files-and-folders)
  - [Viewing and searching](#viewing-and-searching)
  - [Processes and system info](#processes-and-system-info)
  - [Permissions and admin access](#permissions-and-admin-access)
  - [Shell environment](#shell-environment)

## Daily and weekly

```sh
pwd                              # Print the folder you're currently in
ls                                # List what's in the current folder
ls -la                            # List everything, including hidden files, with details
cd <folder>                       # Move into a folder
cd ..                             # Move up one folder
cd ~                              # Jump to your home folder
mkdir <name>                      # Create a new folder
touch <file>                      # Create an empty file (or update its timestamp)
open .                            # Open the current folder in Finder
clear                             # Clear the terminal screen
```

## Common commands

### Moving around

```sh
pwd                              # Print the folder you're currently in
cd <folder>                       # Move into a folder (relative or absolute path)
cd ..                             # Move up one folder
cd ../..                          # Move up two folders
cd ~                              # Jump to your home folder
cd ~/Documents                    # Jump to a folder under home
cd -                              # Jump back to the previous folder
ls                                # List files and folders here
ls -l                              # List with details: permissions, size, date
ls -la                             # Same, including hidden (dotfile) entries
ls -lh                             # Same, with human-readable file sizes
```

### Files and folders

```sh
mkdir <name>                      # Create a folder
mkdir -p a/b/c                    # Create nested folders in one go
touch <file>                      # Create an empty file, or bump its modified date
cp <file> <dest>                  # Copy a file
cp -r <folder> <dest>             # Copy a folder and its contents
mv <file> <dest>                  # Move or rename a file or folder
rm <file>                         # Delete a file (no Trash, no undo)
rm -r <folder>                    # Delete a folder and its contents
rmdir <folder>                    # Delete a folder, but only if it's empty
open <file>                       # Open a file in its default app
open -a "App Name" <file>         # Open a file in a specific app
open -R <file>                    # Reveal a file in Finder
```

`rm` does not use the Trash — deleted files are gone. Double-check the path before running it, especially with `-r`.

### Viewing and searching

```sh
cat <file>                        # Print a whole file to the screen
less <file>                       # Scroll through a file (q to quit)
head <file>                       # Show the first 10 lines of a file
tail <file>                       # Show the last 10 lines of a file
tail -f <file>                    # Keep watching a file as new lines are added
grep "text" <file>                # Find lines matching text in a file
grep -r "text" <folder>           # Find lines matching text in every file in a folder
find . -name "*.png"              # Find files by name, starting here
man <command>                     # Show a command's manual (q to quit)
```

### Processes and system info

```sh
ps aux                            # List running processes
top                                # Show live CPU and memory usage (q to quit)
kill <pid>                        # Ask a process to quit, by its process ID
killall <name>                    # Ask all processes with a given name to quit
df -h                              # Show disk space usage, human-readable
du -sh <folder>                   # Show a folder's total size
which <command>                   # Show which installed program a command runs
whoami                             # Show your current username
```

### Permissions and admin access

These are lower-frequency but higher-stakes — they change who can do what, sometimes system-wide.

```sh
ls -l <file>                      # Show a file's permissions (e.g. -rw-r--r--)
chmod +x <file>                   # Make a file executable, e.g. a script
chmod 644 <file>                  # Set exact permission bits (owner rw, others r)
chown <user> <file>               # Change who owns a file
sudo <command>                    # Run one command with admin (root) privileges
sudo -v                           # Refresh your cached sudo authorization
```

`sudo` asks for your Mac login password, then runs the command as an admin — it can modify or delete system files with no confirmation prompt, so read a command fully before running it with `sudo`, especially one you copied from somewhere. If a command fails with "permission denied" and you're sure it should work, `sudo` is often why it's being blocked — but reach for it deliberately, not as a reflex fix.

### Shell environment

```sh
echo $PATH                        # Show the folders the shell searches for commands
echo $SHELL                       # Show your current shell
export VAR=value                  # Set an environment variable for this session
alias gs="git status"             # Create a shortcut command
source ~/.zshrc                   # Reload your shell config after editing it
history                            # Show recently run commands
!!                                  # Re-run the last command
```

Your shell's startup config lives at `~/.zshrc` — it's where aliases, environment variables, and tool setup (like Homebrew's) usually get added.
