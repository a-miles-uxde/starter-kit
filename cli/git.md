# git

Git is a distributed version control system. It records snapshots of your files as commits, lets you branch off to try changes safely, and syncs work with remote repositories such as GitHub.

## Contents

- [Daily and weekly](#daily-and-weekly)
- [Common commands](#common-commands)
  - [Setup and config](#setup-and-config)
  - [Starting a repository](#starting-a-repository)
  - [Staging and committing](#staging-and-committing)
  - [Branches](#branches)
  - [Syncing with remotes](#syncing-with-remotes)
  - [History and inspection](#history-and-inspection)
  - [Undoing changes](#undoing-changes)
  - [Stashing](#stashing)
  - [Tags](#tags)

## Daily and weekly

```sh
git status                      # Show changed, staged, and untracked files
git pull                        # Fetch and merge remote changes
git switch -c feature/name      # Create and switch to a new branch
git add -p                      # Stage changes interactively, hunk by hunk
git commit -m "Message"         # Commit staged changes with a message
git push                        # Upload local commits to the remote
git log --oneline -10           # Show the last ten commits compactly
git diff                        # Show unstaged changes
git switch main                 # Return to the main branch
git branch -d feature/name      # Delete a merged local branch
```

## Common commands

### Setup and config

```sh
git config --global user.name "Name"     # Set your commit author name
git config --global user.email "a@b.c"   # Set your commit author email
git config --global --list               # Show all global settings
git config --global --edit               # Open global config in your editor
```

### Starting a repository

```sh
git init                        # Turn the current folder into a repo
git clone <url>                 # Copy a remote repository locally
git clone <url> <folder>        # Clone into a specific folder name
```

### Staging and committing

```sh
git add <file>                  # Stage a specific file
git add .                       # Stage everything in the current folder
git restore --staged <file>     # Unstage a file, keeping its changes
git commit                      # Commit, writing the message in your editor
git commit -am "Message"        # Stage tracked files and commit together
git commit --amend              # Rewrite the most recent commit
git rm <file>                   # Delete a file and stage the removal
git mv <old> <new>              # Rename a file and stage the rename
```

### Branches

```sh
git branch                      # List local branches
git branch -a                   # List local and remote branches
git switch <branch>             # Switch to an existing branch
git switch -c <branch>          # Create a branch and switch to it
git branch -m <new-name>        # Rename the current branch
git branch -D <branch>          # Force delete a branch, even unmerged
git merge <branch>              # Merge a branch into the current one
git rebase main                 # Replay current branch commits onto main
git cherry-pick <commit>        # Apply one specific commit here
```

### Syncing with remotes

```sh
git remote -v                   # List remotes and their URLs
git remote add origin <url>     # Connect the repo to a remote
git fetch                       # Download remote changes without merging
git fetch --prune               # Fetch and drop deleted remote branches
git pull --rebase               # Pull, rebasing local commits on top
git push -u origin <branch>     # Push and track a new branch
git push --force-with-lease     # Safely overwrite remote after a rebase
git push origin --delete <b>    # Delete a branch on the remote
```

### History and inspection

```sh
git log                         # Show full commit history
git log --graph --oneline --all # Draw a branch graph of all history
git log -p <file>               # Show every change made to a file
git show <commit>               # Show a commit's details and diff
git diff --staged               # Show changes staged for the next commit
git diff main...<branch>        # Show what a branch adds to main
git blame <file>                # Show who last changed each line
git reflog                      # Show where HEAD has been, for recovery
```

### Undoing changes

```sh
git restore <file>              # Discard unstaged changes to a file
git revert <commit>             # Add a commit that undoes another
git reset --soft HEAD~1         # Undo last commit, keep changes staged
git reset HEAD~1                # Undo last commit, keep changes unstaged
git reset --hard HEAD~1         # Undo last commit and discard changes
git clean -n                    # Preview which untracked files would be deleted
git clean -fd                   # Delete untracked files and folders
```

### Stashing

```sh
git stash                       # Shelve uncommitted changes temporarily
git stash -u                    # Stash, including untracked files
git stash list                  # List saved stashes
git stash pop                   # Reapply the latest stash and remove it
git stash drop                  # Delete the latest stash
```

### Tags

```sh
git tag                         # List tags
git tag -a v1.0 -m "Message"    # Create an annotated release tag
git push --tags                 # Push all local tags to the remote
git tag -d v1.0                 # Delete a local tag
```
