# git

Git is version control: it saves named snapshots of a project (commits), lets you branch off to try an idea without touching the main version, and syncs your work with GitHub. Think of a commit as a named version in a file's history, and a branch as duplicating a Figma page to explore. In this kit, git does the saving and syncing under GitHub Desktop, VS Code, `gh`, and Claude Code, so the terminal commands below work on the same repositories those apps show. Run `git` with no arguments to list the most common commands.

_Last verified: September 2026 with git 2.55.0 (`git --version`) on macOS 27._ If a command below fails, check `git <command> -h` first: flags change between versions.

## Contents

- [Official links](#official-links)
- [Before you start](#before-you-start)
- [Daily and weekly](#daily-and-weekly)
- [Common commands](#common-commands)
  - [Staging and committing](#staging-and-committing)
  - [Branches](#branches)
  - [Syncing with GitHub](#syncing-with-github)
  - [Looking at history](#looking-at-history)
  - [Undoing changes](#undoing-changes)
  - [Setting work aside](#setting-work-aside)
  - [Starting or copying a project](#starting-or-copying-a-project)
  - [Tags](#tags)
  - [Settings](#settings)
- [When things go wrong](#when-things-go-wrong)
- [Using git with Claude Code](#using-git-with-claude-code)
- [Related](#related)

## Official links

- [Git website](https://git-scm.com): downloads, news, and links to everything below
- [Git reference](https://git-scm.com/docs): the manual page for every command, grouped by task
- [Git cheat sheet](https://git-scm.com/cheat-sheet): a one-page visual summary of common commands
- [Pro Git book](https://git-scm.com/book/en/v2): the free official book, from first commit to advanced topics

## Before you start

This kit installs git through the [`Brewfile`](../Brewfile). To check it's ready:

```sh
git --version                   # Confirm it's installed and show the version
```

macOS also ships its own copy of git (it prints `Apple Git` in the version, and it can trail Homebrew's by a release or two). If you see that, the kit's copy isn't first on your path yet: open a new terminal window and check again.

The kit's setup script also sets your git name and email, makes `main` the default branch name, sets VS Code as the editor git opens for messages, and makes `git push` publish a new branch on its first push. You can see these with the commands in [Settings](#settings).

- Words in angle brackets, like `<file>`, are blanks to fill in. Replace the whole thing, brackets included: `git add <file>` becomes `git add onboarding-copy.md`.
- A comment that starts with **Careful** marks a command that changes or deletes things in a way that's hard to undo. Read the note under its block before you run it.
- Run every command from inside the project folder. `cd ~/Documents/<project>` takes you there.

## Daily and weekly

```sh
git status                      # Show changed, staged, and new files
git pull                        # Download and merge teammates' changes
git switch -c <branch>          # Create a new branch and move to it
git diff                        # Show changes you haven't staged yet
git add .                       # Stage everything in the current folder
git commit -m "Fix checkout error copy"  # Save staged changes as a named commit
git push                        # Upload your commits to GitHub
git log --oneline -10           # Show the last ten commits, one per line
git switch main                 # Return to the main branch
git branch -d <branch>          # Delete a branch that has been merged
```

"Staging" means choosing which changes go into the next commit, like picking which frames to include in a share link. `git branch -d` refuses to delete a branch whose work isn't merged yet, so it's safe to try.

## Common commands

### Staging and committing

```sh
git add <file>                  # Stage one file
git add -p                      # Stage changes piece by piece, with a prompt
git restore --staged <file>     # Unstage a file, keeping its changes
git commit                      # Commit, writing the message in VS Code
git commit -am "Update empty state copy"  # Stage edited files and commit in one step
git commit --amend              # Careful: replaces the most recent commit
git rm <file>                   # Delete a file and stage the removal
git mv <old> <new>              # Rename a file and stage the rename
```

`git commit -am` only picks up files git already tracks. Brand new files still need `git add` first.

`git commit --amend` swaps your last commit for a new one with the staged changes and an updated message. Use it only on a commit you haven't pushed. If you amend by mistake, `git reflog` shows the commit as it was before (see [When things go wrong](#when-things-go-wrong)).

### Branches

To move to any existing branch, use `git switch` with its name, the same way as `git switch main` above.

```sh
git branch                      # List your local branches
git branch -a                   # List local and GitHub branches
git branch -m <new-name>        # Rename the current branch
git merge <branch>              # Merge another branch into this one
git merge --abort               # Cancel a merge that hit conflicts
git cherry-pick <commit>        # Copy one commit onto this branch
git rebase main                 # Careful: rewrites this branch's commits onto main
git branch -D <branch>          # Careful: deletes a branch, even if unmerged
```

`<commit>` is a commit ID: the short code, like `bec2384`, that `git log --oneline` prints at the start of each line.

`git rebase main` gives your commits new IDs. Don't rebase a branch someone else is working on. If a rebase stops with conflicts, `git rebase --abort` puts everything back as it was. To recover a branch deleted with `-D`, git prints its last commit ID when it deletes it: run `git branch <branch> <commit>` with that ID to bring it back.

### Syncing with GitHub

A "remote" is the copy of the repository on GitHub. It's usually named `origin`.

```sh
git remote -v                   # List remotes and their URLs
git remote add origin <url>     # Connect this folder to a GitHub repo
git fetch                       # Download changes without merging them
git fetch --prune               # Also forget branches deleted on GitHub
git pull --rebase               # Pull, placing your commits on top
git push -u origin <branch>     # Publish a branch and track it
git push --force-with-lease     # Careful: overwrites the branch on GitHub
git push origin --delete <branch>  # Careful: deletes a branch on GitHub
```

This kit's setup makes plain `git push` publish a new branch, so you only need `git push -u origin <branch>` on a machine set up another way.

`git push --force-with-lease` replaces the GitHub copy of your branch with yours, usually after a rebase or amend. It refuses if someone else pushed in the meantime, but it still discards any commits on GitHub that you've removed locally. Add `--dry-run` to either Careful push to see what would happen first.

### Looking at history

```sh
git log                         # Show full commit history
git log --graph --oneline --all  # Draw a graph of every branch
git log -p <file>               # Show every change made to one file
git show <commit>               # Show one commit's message and changes
git diff --staged               # Show changes staged for the next commit
git diff main...<branch>        # Show what a branch adds to main
git blame <file>                # Show who last changed each line
git reflog                      # Show everywhere you've been, for recovery
```

Git opens long output in a pager. Press `space` to scroll, `q` to quit.

### Undoing changes

```sh
git revert <commit>             # Add a new commit that undoes an old one
git reset --soft HEAD~1         # Undo the last commit, keep changes staged
git reset HEAD~1                # Undo the last commit, keep changes unstaged
git clean -n                    # Preview which new files would be deleted
git restore <file>              # Careful: discards unsaved edits to a file, no undo
git reset --hard HEAD~1         # Careful: removes the last commit and its changes
git clean -fd                   # Careful: deletes new, uncommitted files, no undo
```

`HEAD~1` means "one commit before the current one." `git revert` is the safe choice for work already on GitHub, because it adds history instead of removing it. Use the `git reset` lines only on commits you haven't pushed.

Before any Careful line here, run `git status` and `git diff` to see what you'd lose, and always run `git clean -n` before `git clean -fd`. Changes you never committed can't be recovered after `git restore`, `git reset --hard`, or `git clean -fd`. A commit removed by `git reset --hard` can be recovered through `git reflog`.

### Setting work aside

"Stashing" shelves unfinished changes so you can switch branches with a clean folder, then bring them back later.

```sh
git stash                       # Shelve uncommitted changes
git stash -u                    # Shelve changes, including new files
git stash list                  # List shelved changes
git stash pop                   # Bring back the latest stash and remove it
git stash drop                  # Careful: deletes the latest stash
```

When you drop a stash, git prints its ID, like `Dropped refs/stash@{0} (7a8ddf3…)`. Run `git stash apply <id>` with that ID soon after to bring it back.

### Starting or copying a project

```sh
git clone <url>                 # Copy a GitHub repo to this computer
git clone <url> <folder>        # Copy it into a folder with another name
git init                        # Turn the current folder into a repo
```

### Tags

A tag is a permanent label on one commit, such as the version you handed off.

```sh
git tag                         # List tags
git tag -a v1.0 -m "Handoff for sprint 12"  # Label the current commit
git push --tags                 # Upload your tags to GitHub
git tag -d v1.0                 # Delete a tag on this computer only
```

### Settings

```sh
git config list --global        # Show all your git settings
git config set --global user.name "Sam Rivera"  # Set the name on your commits
git config set --global user.email "sam@example.com"  # Set the email on your commits
git config edit --global        # Open your settings file in VS Code
```

Use the email tied to your GitHub account, or GitHub won't link your commits to you.

These are the newer forms of `git config`, added in git 2.46. Older tutorials write the same commands as `git config --global --list`, `git config --global user.name "Sam Rivera"`, and `git config --global --edit`. Those still work, but git's manual marks them as deprecated.

## When things go wrong

| What you see | What it means | What to do |
| --- | --- | --- |
| `fatal: not a git repository (or any of the parent directories): .git` | You're in a folder that isn't a git project. | `cd` into the project folder, then try again. |
| `! [rejected]        main -> main (fetch first)` | GitHub has commits you don't have yet. | Run `git pull`, then `git push` again. |
| `error: Your local changes to the following files would be overwritten by checkout:` | You have unsaved edits that would be lost by switching branches. | Commit them, or run `git stash`, switch, then `git stash pop` when you're back. |
| `CONFLICT (content): Merge conflict in <file>` | You and someone else changed the same lines. | Open the file in VS Code, pick the right version of each marked section, then `git add <file>` and `git commit`. To back out instead, run `git merge --abort`. |
| `error: the branch '<branch>' is not fully merged` | `git branch -d` protected work that isn't merged yet. | Merge it first. Use `git branch -D <branch>` only if you're sure you don't need it. |
| A commit or branch is gone after `--amend`, `rebase`, `reset --hard`, or `branch -D` | The commit still exists, but nothing points to it. | Run `git reflog`, find the ID from before the change, then `git branch rescue <commit>` to get it back on a new branch. |
| A branch is gone or wrong on GitHub after a Careful `push` | The GitHub copy was deleted or overwritten. | If your local branch is still right, `git push -u origin <branch>` puts it back. Otherwise ask whoever last pushed it to push again. |
| A stash is gone after `git stash drop` | The stash was deleted but its ID was printed. | Run `git stash apply <id>` with the ID from the `Dropped` line. |

Uncommitted edits discarded by `git restore`, `git reset --hard`, or `git clean -fd` can't be recovered by git. Check your editor's undo history or Time Machine.

## Using git with Claude Code

Claude Code can read your changes and write a first draft of a commit message, which helps when a session touched many files.

```text
Run `git status` and `git diff` in this project. Summarize what changed in plain language, grouped by file, and flag anything that looks unintended (stray files, debug text, personal data). Then suggest a one-line commit message under 60 characters. Don't stage, commit, or push anything.
```

Before you commit, read `git diff` yourself and compare it with Claude's summary: the summary describes intent, the diff shows what actually changed. Rewrite the message in your own words if it's off. Don't let Claude run a Careful command without reading what it will do first, and never commit participant names, research recordings, API keys, or client material. If you're unsure, scan with gitleaks before you push.

## Related

- [CLI reference index](README.md): all the command references in this kit
- [GitHub Desktop guide](../docs/github-desktop/README.md): the same save-and-share loop, with buttons instead of commands
- [VS Code guide](../docs/vs-code/README.md#git-in-vs-code): git in the Source Control view, next to your files
