# Terminal basics (macOS)

Terminal is the Mac app where you type commands instead of clicking. It runs a shell, a program that reads what you type and runs it; on a new Mac that shell is zsh. These are the everyday built-in commands underneath the other tools in this kit, such as git, gh, gitleaks, herdr, and tree: moving between folders, creating and deleting files, looking inside them, and (now and then) doing something that needs admin rights. macOS ships the BSD versions of these commands, so some flags differ from the Linux versions in online tutorials; the notes below say where. Open Terminal from **Applications → Utilities → Terminal**, or press `⌘Space` and type `Terminal`.

_Last verified: September 2026 with zsh 5.9 and the built-in commands on macOS 27.0 (`zsh --version`, `sw_vers`)._ Most of these commands don't accept `--help` on a Mac, so if one fails, check `man <command>` first: flags differ between macOS and Linux.

A safety note before you start: `rm`, `cp`, and `mv` never use the Trash and don't ask before replacing a file, and `sudo` runs a command with admin rights and no confirmation. Each is marked **Careful** below, with a safer choice next to it.

## Contents

- [Official links](#official-links)
- [Before you start](#before-you-start)
- [Daily and weekly](#daily-and-weekly)
- [Common commands](#common-commands)
  - [Moving around](#moving-around)
  - [Creating, copying, and moving](#creating-copying-and-moving)
  - [Deleting](#deleting)
  - [Opening files and apps](#opening-files-and-apps)
  - [Viewing files](#viewing-files)
  - [Searching](#searching)
  - [Disk space and system info](#disk-space-and-system-info)
  - [Running apps and processes](#running-apps-and-processes)
  - [Permissions and admin access](#permissions-and-admin-access)
  - [Shell environment](#shell-environment)
- [When things go wrong](#when-things-go-wrong)
- [Using Terminal with Claude Code](#using-terminal-with-claude-code)
- [Related](#related)

## Official links

- [Terminal User Guide](https://support.apple.com/guide/terminal/welcome/mac): Apple's guide to the Terminal app, windows, profiles, and running commands
- [Use zsh as the default shell on Mac](https://support.apple.com/en-us/102360): Apple's note on why macOS uses zsh and how to check or change your shell
- [zsh documentation](https://zsh.sourceforge.io/Doc/): the full shell manual, for aliases, history, and startup files

Every command on this page also has a built-in manual. Run `man <command>`, such as `man ls`, and press `q` to leave it.

## Before you start

Terminal, zsh, and every command on this page come with macOS. The kit doesn't install them, and you don't need Homebrew for them. To check your setup:

```sh
echo $SHELL                     # Show your shell; /bin/zsh on a new Mac
zsh --version                   # Show the zsh version
```

- Words in angle brackets, like `<folder>`, are blanks to fill in. Replace the whole thing, brackets included: `cd <folder>` becomes `cd ~/Documents`.
- A comment that starts with **Careful** marks a command that changes or deletes things in a way that's hard to undo. Read the note under its block before you run it.
- `~` means your home folder, `.` means the folder you're in, and `..` means the folder above it.
- Press `Tab` to complete a file or folder name, `↑` to bring back your last command, and `Ctrl-C` to stop a command that's still running.
- Drag a file or folder from Finder into the Terminal window to paste its full path.

## Daily and weekly

```sh
pwd                             # Show the folder you're in
ls                              # List what's in the current folder
ls -la                          # List everything, hidden files too, with details
cd <folder>                     # Move into a folder
cd ..                           # Move up one folder
cd ~                            # Jump to your home folder
mkdir <name>                    # Create a new folder
touch <file>                    # Create an empty file, or update its date
open .                          # Open the current folder in Finder
clear                           # Clear the Terminal screen
```

## Common commands

### Moving around

```sh
cd ../..                        # Move up two folders
cd ~/Documents                  # Jump to a folder inside your home folder
cd "Client Work"                # Move into a folder whose name has spaces
cd -                            # Jump back to the folder you were in before
ls <folder>                     # List another folder without moving into it
ls -l                           # List with details: permissions, size, date
ls -lh                          # List details with readable sizes, like 4.0K
ls -lt                          # List newest first, by last modified date
```

Folder names with spaces need quotes, or the shell reads each word as a separate name. Typing the first few letters and pressing `Tab` adds the quoting for you.

### Creating, copying, and moving

```sh
mkdir -p research/2026-09/raw   # Create nested folders in one go
cp <file> <dest>                # Careful: copies, replacing a same-named file
cp -i <file> <dest>             # Copy, but ask before replacing anything
cp -R <folder> <dest>           # Copy a folder and everything in it
mv <file> <dest>                # Careful: moves or renames, replacing a same-named file
mv -i <file> <dest>             # Move or rename, but ask before replacing anything
mv -n <file> <dest>             # Move or rename, never replacing anything
```

`cp` and `mv` replace a file with the same name at the destination without asking, and there's no undo. Use `-i` to get a `y`/`n` prompt first, or `-n` to skip anything that already exists. Linux tutorials often copy folders with `cp -r`. On a Mac the manual documents `cp -R`; `-r` also works, but `-R` is the one to learn.

### Deleting

```sh
trash <file>                    # Move a file or folder to the Trash
rm <file>                       # Careful: deletes a file, skips the Trash, no undo
rm -i <file>                    # Delete, but ask to confirm each file first
rm -r <folder>                  # Careful: deletes a folder and all it holds, no undo
rmdir <folder>                  # Delete a folder, only if it's empty
```

`rm` doesn't use the Trash: deleted files are gone. Before you run it, run `ls` with the same path to preview exactly what it matches, and add `-i` to confirm each file. When you might want the file back, use `trash` instead (built in since macOS 15) and empty the Trash later.

### Opening files and apps

```sh
open <file>                     # Open a file in its default app
open -a Preview <file>          # Open a file in a specific app
open -a "Visual Studio Code" .  # Open the current folder in VS Code
open -R <file>                  # Show a file, selected, in Finder
open https://github.com         # Open a web address in your default browser
```

### Viewing files

```sh
cat <file>                      # Print a whole file to the screen
less <file>                     # Scroll through a file (q to quit)
head <file>                     # Show the first 10 lines of a file
head -n 20 <file>               # Show the first 20 lines
tail <file>                     # Show the last 10 lines of a file
tail -f <file>                  # Keep showing new lines as they're added
man <command>                   # Read a command's manual (q to quit)
```

In `less` and `man`, press `Space` to go down a page, type `/` and a word to search, and press `q` to quit. `tail -f` keeps running until you press `Ctrl-C`.

### Searching

```sh
grep "<text>" <file>            # Find lines containing text in a file
grep -i "<text>" <file>         # Find lines, ignoring upper and lower case
grep -rn "<text>" <folder>      # Search every file in a folder, with line numbers
grep -rl "<text>" <folder>      # List only the files that contain the text
find . -name "*.png"            # Find files by name, starting here
find . -iname "*.png"           # Find files by name, ignoring case
```

For example, `grep -rn "Payment failed" .` finds every place that error message appears in the current project. The `*` in `"*.png"` matches any name; keep the quotes so the shell passes it to `find` unchanged.

### Disk space and system info

```sh
df -h                           # Show free space on your drives
du -sh <folder>                 # Show a folder's total size
du -sh *                        # Show the size of each item here
sw_vers                         # Show your macOS version
whoami                          # Show your username
which <command>                 # Show where a command's program lives
```

### Running apps and processes

A process is a running program. Each has a process ID (PID), the number in the second column of `ps aux`.

```sh
ps aux                          # List every running process
pgrep -l <name>                 # Find a process's ID by name
top                             # Show live CPU and memory use (q to quit)
top -o mem                      # Sort the live view by memory use
kill <pid>                      # Careful: asks one process to quit, unsaved work may be lost
killall <name>                  # Careful: quits every process with that name
```

Quit apps the usual way first. If one is frozen, **Force Quit** (`⌥⌘Esc`) is the gentler choice. `kill` and `killall` send a quit signal that many apps obey without asking to save. Names with spaces need quotes: `killall "Google Chrome"`.

### Permissions and admin access

These are lower frequency but higher stakes: they change who can read, change, or run a file, sometimes system-wide. Run `ls -l <file>` to see a file's current permissions, such as `-rw-r--r--`.

```sh
chmod +x <file>                 # Careful: lets a file run as a program, like a script
chmod 644 <file>                # Careful: sets owner read-write, everyone else read-only
chown <user> <file>             # Careful: changes who owns a file (usually needs sudo)
sudo <command>                  # Careful: runs one command as admin, with no confirmations
sudo -v                         # Refresh your admin sign-in for a few more minutes
sudo -k                         # Forget your admin sign-in, so sudo asks again
```

`sudo` asks for your Mac login password, then runs the command as an admin (root). It can change or delete system files with no confirmation prompt, so read a command fully before you run it with `sudo`, especially one you copied from a website or chat. If a command fails with "permission denied," that's often macOS protecting something on purpose. Find out why before you reach for `sudo`, and don't use it as a reflex fix.

### Shell environment

```sh
echo $PATH                      # Show the folders the shell searches for commands
export <name>=<value>           # Set an environment variable for this window
alias gs="git status"           # Create a shortcut command for this window
open -e ~/.zshrc                # Open your shell settings file in TextEdit
source ~/.zshrc                 # Reload your shell settings after editing them
history                         # Show recently run commands
!!                              # Run the last command again
```

Variables and aliases you type only last until you close the window. To keep them, add the same line to `~/.zshrc`, the file zsh reads each time a window opens, then run `source ~/.zshrc`. Tools such as Homebrew add their setup there too. A typo in `~/.zshrc` can cause errors in every new window, so make a copy first with `cp ~/.zshrc ~/.zshrc.bak`. If `~/.zshrc` doesn't exist yet, create it with `touch ~/.zshrc`.

## When things go wrong

| What you see | What it means | What to do |
| --- | --- | --- |
| `zsh: command not found: <name>` | A typo, or the tool isn't installed, or Terminal was open before it was installed | Check the spelling, then open a new Terminal window. For kit tools, run `./setup.sh` from the kit folder |
| `cd: no such file or directory: <folder>` | The folder isn't where you said, or its name has spaces | Run `pwd` and `ls` to see where you are. Put quotes around names with spaces, or drag the folder into Terminal |
| `zsh: permission denied: ./<file>` or `Permission denied` | The file isn't allowed to run, or the location is protected | For your own script, run `chmod +x <file>`. For system folders, stop and find out why before you use `sudo` |
| A file is gone or replaced after `rm`, `cp`, or `mv` | These don't use the Trash and don't ask before replacing | In a Git project, run `git restore <file>` to bring back the last saved version. Otherwise restore it from Time Machine. Next time, use `trash`, or add `-i` |
| An app quit after `kill` or `killall`, or a file's permissions or owner look wrong | The app got a quit signal; `chmod` or `chown` changed access | Reopen the app and check its autosaved or recent documents. For your own files, `chmod 644 <file>` resets typical permissions and `sudo chown $(whoami) <file>` makes you the owner again |
| Terminal seems stuck, with no prompt | A command is still running, or you're inside `less`, `man`, or `top` | Press `q` to leave a viewer. Press `Ctrl-C` to stop anything else |

## Using Terminal with Claude Code

Claude is good at explaining a command before you run it, which helps most when you've copied one from a website, a README, or a teammate.

```text
I want to run this command in Terminal on my Mac: <paste the command>. Before I run it, explain in plain language what each part does, which files or settings it could change, and whether it can be undone. Tell me if any flag works differently on macOS than on Linux. Don't run it.
```

Before you run the command, check Claude's explanation against `man <command>`, and take extra care with anything that uses `rm`, `sudo`, `chmod`, or pipes a download into `sh`. Claude can be confidently wrong about flags. Don't paste the output of `env` or `export`, which can include passwords and API keys, and don't paste file listings that show research participants' names or client projects.

## Related

- [CLI reference index](README.md): all the command references in this kit
- [VS Code guide](../docs/vs-code/README.md): the same shell in VS Code's built-in terminal panel
- [GitHub Desktop guide](../docs/github-desktop/README.md): **Repository → Open in Terminal** opens a project here
- [Kit README](../README.md): what the starter kit installs and how to set it up
