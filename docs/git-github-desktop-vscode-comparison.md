# Git in GitHub Desktop, the terminal, and VS Code for UX designers

A side-by-side guide to everyday Git tasks in the three places this kit gives you: the GitHub Desktop app, the terminal, and the Source Control view in VS Code. It's for designers who are getting started with Git, GitHub, and Claude Code. You don't need to be a developer. All three tools work on the same project folder and the same history, so you can start a task in one and finish it in another. Use this guide to find the button behind a command you saw in a tutorial, the command behind a button you already use, and the few tasks only the terminal can do.

Shortcuts below are for macOS. On Windows, swap `⌘` for `Ctrl`.

_Last verified: September 30, 2026 with GitHub Desktop 3.6.6, VS Code 1.139.1, and git 2.55.0 on macOS 27._

## Contents

- [Before you start](#before-you-start)
- [Official links](#official-links)
- [Why know all three](#why-know-all-three)
- [Key ideas in plain language](#key-ideas-in-plain-language)
- [Where Git lives in each tool](#where-git-lives-in-each-tool)
  - [Shortcuts worth learning first](#shortcuts-worth-learning-first)
- [Side-by-side reference](#side-by-side-reference)
  - [Get a project](#get-a-project)
  - [See what changed](#see-what-changed)
  - [Stage and unstage](#stage-and-unstage)
  - [Commit](#commit)
  - [Branches](#branches)
  - [Sync with GitHub](#sync-with-github)
  - [Merge](#merge)
  - [Stash](#stash)
  - [Discard and undo](#discard-and-undo)
  - [History](#history)
- [When only the terminal will do](#when-only-the-terminal-will-do)
  - [Not in either app](#not-in-either-app)
  - [Missing from one app](#missing-from-one-app)
- [The same loop in each tool](#the-same-loop-in-each-tool)
  - [1. Get up to date](#1-get-up-to-date)
  - [2. Make a branch](#2-make-a-branch)
  - [3. Review your changes](#3-review-your-changes)
  - [4. Commit](#4-commit)
  - [5. Push or publish](#5-push-or-publish)
  - [6. Check the result on GitHub](#6-check-the-result-on-github)
- [Reviewing AI output](#reviewing-ai-output)
- [Protecting data](#protecting-data)
- [When things go wrong](#when-things-go-wrong)
- [Using these tools with Claude Code](#using-these-tools-with-claude-code)
- [A typical session](#a-typical-session)
- [Tips and gotchas](#tips-and-gotchas)
- [Sources](#sources)
- [Next steps](#next-steps)

## Before you start

| You need | Why | How to get it |
| --- | --- | --- |
| GitHub Desktop, VS Code, and git | The three tools this guide compares. | Installed by this kit. See the [main README](../README.md). |
| A GitHub account, signed in to GitHub Desktop and VS Code | To clone, push, and publish. | See first-time setup in the [GitHub Desktop guide](github-desktop/README.md#first-time-setup) and the [VS Code guide](vs-code/README.md#first-time-setup). |
| A practice repository | Somewhere safe to try each action. A small, private repo of your own is ideal. | Create one with **File → New Repository…** in GitHub Desktop, or ask a teammate. |

**Time:** about 15 minutes to read. After that, keep it open as a reference.

**By the end you'll have:** a map of where each everyday Git action lives in each tool, and one small change taken from a branch to GitHub in the tool of your choice.

## Official links

- [GitHub Desktop documentation](https://docs.github.com/en/desktop): GitHub's full documentation for the app
- [Source Control in VS Code](https://code.visualstudio.com/docs/sourcecontrol/overview): the overview of Git in VS Code, with links to each topic
- [Git reference](https://git-scm.com/docs): the manual page for every git command
- [GitHub Desktop keyboard shortcuts](https://docs.github.com/en/desktop/overview/github-desktop-keyboard-shortcuts): every shortcut for macOS and Windows

The [Sources](#sources) section at the end lists the specific pages behind each table.

## Why know all three

- **Tutorials and teammates speak in commands.** A Slack message that says "run `git pull`" is easier to follow when you know it's the **Pull origin** button.
- **Each tool shows something the others don't.** GitHub Desktop has the clearest diff and one-click undo. VS Code shows a history graph, file history, and who changed each line. The terminal can do everything.
- **Claude Code works in the terminal.** When Claude runs a git command, you can recognize it and check the result in whichever app you prefer.
- **They never compete.** All three read and write the same hidden `.git` folder inside your project, so nothing you do in one is invisible to the others.

## Key ideas in plain language

| Term | Think of it as |
| --- | --- |
| **Repository** ("repo") | A project folder whose history is tracked, like a Figma file with its version history attached. |
| **Working folder** | The files as they are on your Mac right now, including edits you haven't saved into history yet. |
| **Stage** | Choosing which changes go into the next commit, like picking which frames go into a handoff. GitHub Desktop does this with checkboxes. VS Code and the terminal have a separate "staged" list. |
| **Commit** | A named snapshot of your staged changes, like saving a version with a note. |
| **Branch** | A parallel line of work, like duplicating a Figma page to explore without touching the original. |
| **Switch** (or **checkout**) | Move to another branch. `git checkout` is the older command. `git switch` is the newer, clearer one. VS Code still says **Checkout to...**. |
| **Remote** and **origin** | The copy of the repo on GitHub. `origin` is its usual name. |
| **Fetch** | Check GitHub for new commits without changing your files. |
| **Pull** | Download new commits from GitHub and merge them into your branch. |
| **Push** | Upload your commits to GitHub. |
| **Publish** | The first push of a new branch, which creates it on GitHub. |
| **Sync** | A pull followed by a push. VS Code has one button for it. |
| **Merge** | Combine another branch's commits into the branch you're on. |
| **Stash** | A shelf for unfinished changes, so you can switch branches with a clean folder. |
| **Diff** | A before-and-after view of what changed: removed lines in red, added lines in green. |
| **Command Palette** | VS Code's search box for every command (`⇧⌘P`). Git commands start with `Git:`. |

## Where Git lives in each tool

Open all three side by side to follow along. In VS Code, open the terminal panel with `` ⌃` ``. In GitHub Desktop, **Repository → Open in Terminal** (`` ⌃` ``) opens your terminal app in the project folder. The menu item names whichever terminal app you picked in **GitHub Desktop → Settings… → Integrations**.

| Part | GitHub Desktop | VS Code | Terminal |
| --- | --- | --- | --- |
| The Git view | The main window | The **Source Control** view: branch-shaped icon in the Activity Bar (`⌃⇧G`) | Any terminal window, inside the project folder |
| Current branch | **Current Branch**, top center | Branch name at the left end of the Status Bar | First line of `git status` |
| Changed files | **Changes** tab, left sidebar | **Changes** and **Staged Changes** lists | `git status` |
| Sync controls | One button, top right, that changes between **Fetch origin**, **Pull origin**, **Push origin**, and **Publish branch** | **Sync Changes** or **Publish Branch** button in the Source Control view, and the sync item in the Status Bar showing incoming (↓) and outgoing (↑) commit counts | `git fetch`, `git pull`, `git push` |
| Extra actions | **Repository** and **Branch** menus in the menu bar | **More Actions...** (the **...** button) at the top of the Source Control view, and `Git:` commands in the Command Palette | Type the command |
| History | **History** tab, left sidebar | **Source Control Graph** in the Source Control view, and the **Timeline** view in Explorer for one file | `git log` |

### Shortcuts worth learning first

The terminal has no shortcuts for Git, so this table covers the two apps. "None" means there's no default shortcut. Use the button, the menu, or the Command Palette instead.

| Action                               | GitHub Desktop | VS Code  |
| ------------------------------------ | -------------- | -------- |
| Show changed files                   | `⌘1`           | `⌃⇧G`    |
| Show history                         | `⌘2`           | None     |
| Commit (with the message box active) | `⌘Enter`       | `⌘Enter` |
| New branch                           | `⇧⌘N`          | None     |
| Fetch                                | `⇧⌘T`          | None     |
| Pull                                 | `⇧⌘P`          | None     |
| Push                                 | `⌘P`           | None     |
| Stash                                | `⇧⌘S`          | None     |
| Merge into current branch            | `⇧⌘M`          | None     |
| Open the Command Palette             | Not applicable | `⇧⌘P`    |

The same keys do different things in each app. `⇧⌘P` pulls in GitHub Desktop but opens the Command Palette in VS Code, and `⌘P` pushes in GitHub Desktop but opens Quick Open (jump to a file) in VS Code.

## Side-by-side reference

Each table puts the terminal command first, then where the same action lives in each app. Words in angle brackets, like `<branch>`, are blanks to fill in: replace the whole thing, brackets included. For more commands and what they do, see the [git quick reference](../cli/git.md).

### Get a project

| Task | Terminal | GitHub Desktop | VS Code |
| --- | --- | --- | --- |
| Copy a repo from GitHub (clone) | `git clone <url>` | **File → Clone Repository…** (`⇧⌘O`). Pick a repo on the **GitHub.com** tab or paste a link on the **URL** tab, set **Local Path**, then click **Clone**. | **Clone Repository** button in the Source Control view (shown when no folder is open), or **Git: Clone** in the Command Palette |
| Start tracking a folder | `git init` | **File → New Repository…** (`⌘N`), or **File → Add Local Repository…** (`⌘O`), which offers to create a repo if the folder isn't one | **Initialize Repository** button in the Source Control view |
| Put a new repo on GitHub | `git remote add origin <url>`, then `git push -u origin main` | **Publish repository** in the top bar | **Publish to GitHub** in the Command Palette |

When you publish from GitHub Desktop, **Keep this code private** is checked by default. Leave it checked unless the work is meant to be public.

### See what changed

| Task | Terminal | GitHub Desktop | VS Code |
| --- | --- | --- | --- |
| List changed files | `git status` | **Changes** tab (`⌘1`) | **Changes** and **Staged Changes** lists in the Source Control view. The letter beside each file shows its state: `M` modified, `U` untracked (new), `D` deleted. |
| See changed lines | `git diff` | Click a file in the **Changes** tab. The diff opens on the right. | Click a file in the Source Control view. The diff opens in the editor. To switch layouts, choose **More Actions... → Diff View** in the diff editor, then **Inline** or **Side by Side**. |
| See what's staged | `git diff --staged` | Not separate: the checked files and lines are what will be committed | Click a file under **Staged Changes** |

### Stage and unstage

Staging picks what goes into the next commit. GitHub Desktop hides this step behind checkboxes: everything checked is staged when you click commit.

| Task | Terminal | GitHub Desktop | VS Code |
| --- | --- | --- | --- |
| Stage one file | `git add <file>` | Leave its checkbox checked | Hover over the file and click **+** (**Stage Changes**), or drag it to **Staged Changes** |
| Stage everything | `git add .` | Check the checkbox at the top of the file list | Hover over the **Changes** header and click **+** (**Stage All Changes**) |
| Stage only some lines | `git add -p` (asks about each change) | In the diff, click lines in the line-number gutter. Lines highlighted in blue are included. | In the diff, select lines and click **Stage** in the gutter, or run **Git: Stage Selected Ranges** (`⌘K` then `⌥⌘S`) |
| Unstage one file | `git restore --staged <file>` | Uncheck its checkbox | Hover over the file under **Staged Changes** and click **−** (**Unstage Changes**) |
| Unstage everything | `git restore --staged .` | Uncheck the checkbox at the top of the list | **More Actions... → Changes → Unstage All Changes** |

Unstaging never deletes your edits. The changes move back to the unstaged list.

### Commit

| Task | Terminal | GitHub Desktop | VS Code |
| --- | --- | --- | --- |
| Commit staged changes | `git commit -m "Shorten onboarding headline"` | Type a summary in **Summary (required)** (and an optional **Description**) below the file list, then click the commit button (`⌘Enter`). It names the branch, for example **Commit 2 files to update-onboarding-copy**. | Type in the message box at the top of the Source Control view, then click **Commit** (`⌘Enter`) |
| Commit every edited file | `git commit -am "<message>"` (files git already tracks only) | The default: every file starts checked | **More Actions... → Commit → Commit All**. Or click **Commit** with nothing staged, and VS Code asks whether to stage all your changes and commit them directly. |
| Commit and push in one step | Two commands: `git commit`, then `git push` | Not available. Commit, then click **Push origin**. | The arrow beside **Commit** opens a menu with **Commit & Push** and **Commit & Sync** |
| Fix the last commit (amend) | `git commit --amend` | **History** tab, right-click the latest commit, then **Amend Commit…**. Click **Begin Amend**, edit, and click **Amend last commit**. | The arrow beside **Commit**, then **Commit (Amend)** |

Amend only commits you haven't pushed. Amending a pushed commit means a force push, which can confuse teammates who already have the old version.

### Branches

| Task | Terminal | GitHub Desktop | VS Code |
| --- | --- | --- | --- |
| Create a branch and move to it | `git switch -c <branch>` | **Current Branch → New Branch**, or **Branch → New Branch…** (`⇧⌘N`). Name it, then click **Create Branch**. | Click the branch name in the Status Bar, then **Create new branch...**. Or run **Git: Create Branch...** |
| Switch to another branch | `git switch <branch>` (older form: `git checkout <branch>`) | Click **Current Branch**, then the branch. If you have unfinished changes, choose **Leave my changes on** _current-branch_ or **Bring my changes to** _new-branch_, then click **Switch Branch**. | Click the branch name in the Status Bar and pick a branch, or run **Git: Checkout to...** |
| List branches | `git branch` (add `-a` to include GitHub's) | **View → Show Branches List** (`⌘B`) | Click the branch name in the Status Bar |
| Rename the current branch | `git branch -m <new-name>` | **Branch → Rename…** (`⇧⌘R`) | **Git: Rename Branch...**, or **More Actions... → Branch → Rename Branch...** |
| Delete a branch | `git branch -d <branch>` | Switch to the branch, then **Branch → Delete…** (`⇧⌘D`) | **Git: Delete Branch...**, or **More Actions... → Branch → Delete Branch...** |
| Delete a branch on GitHub | `git push origin --delete <branch>` | In the **Delete Branch** dialog, check **Yes, delete this branch on the remote** | **Git: Delete Remote Branch...** |

### Sync with GitHub

| Task | Terminal | GitHub Desktop | VS Code |
| --- | --- | --- | --- |
| Check for new commits (fetch) | `git fetch` | **Fetch origin** in the top bar, or **Repository → Fetch** (`⇧⌘T`) | **More Actions... → Pull, Push → Fetch**, or **Git: Fetch** |
| Download and merge new commits (pull) | `git pull` | **Pull origin** in the top bar (it appears after a fetch finds new commits), or **Repository → Pull** (`⇧⌘P`) | **More Actions... → Pull, Push → Pull**, or **Git: Pull** |
| Upload your commits (push) | `git push` | **Push origin** in the top bar, or **Repository → Push** (`⌘P`) | **More Actions... → Pull, Push → Push**, or **Git: Push** |
| Publish a new branch | `git push -u origin <branch>`. This kit sets git up so plain `git push` also works. | **Publish branch** in the top bar | **Publish Branch** button in the Source Control view, or **Git: Publish Branch...** |
| Pull, then push (sync) | `git pull`, then `git push` | Not one action. The top-bar button moves from **Pull origin** to **Push origin** as you go. | **Sync Changes** button in the Source Control view, or click the sync item in the Status Bar |

VS Code doesn't check GitHub for new commits in the background unless you turn on the `git.autofetch` setting, which is off by default in the editor window. Fetch before you start work so you aren't building on an old version.

### Merge

| Task | Terminal | GitHub Desktop | VS Code |
| --- | --- | --- | --- |
| Merge another branch into yours | `git merge <branch>` | **Branch → Merge into Current Branch…** (`⇧⌘M`), or **Current Branch → Choose a branch to merge into** _your-branch_. Pick the branch, then click **Merge into** _your-branch_. | **Git: Merge...**, or **More Actions... → Branch → Merge...** |
| Bring the latest `main` into your branch | `git fetch`, then `git merge origin/main` | **Branch → Update from main** (`⇧⌘U`) | Fetch, then **Git: Merge...** and pick `origin/main` |
| Resolve a conflict | Edit the marked sections, then `git add <file>` and `git commit` | Lists conflicted files and offers to open each in your editor. Fix them, then finish the merge in the dialog. | Conflicted files appear under **Merge Changes**. Use **Accept Current Change**, **Accept Incoming Change**, or **Accept Both Changes** above each conflict, or **Resolve in Merge Editor**, then **Complete Merge**. |
| Cancel a merge that hit conflicts | `git merge --abort` | The abort button in the conflicts dialog | **Git: Abort Merge** |

A conflict means two people changed the same lines. It isn't a failure. If you're unsure which version to keep, stop and ask a teammate or Claude before you finish the merge.

### Stash

| Task | Terminal | GitHub Desktop | VS Code |
| --- | --- | --- | --- |
| Shelve unfinished changes | `git stash` (add `-u` to include new files) | **Branch → Stash All Changes** (`⇧⌘S`), or right-click the changed-files header, then **Stash All Changes**. Switching branches and choosing **Leave my changes on** _branch_ stashes too. | **Git: Stash**, or **Git: Stash (Include Untracked)** to include new files. Also under **More Actions... → Stash**. |
| See what's shelved | `git stash list` | **Stashed Changes** in the **Changes** tab, or **View → Show Stashed Changes** (`⌃H`) | **Git: View Stash...** |
| Bring changes back | `git stash pop` | Click **Stashed Changes**, then **Restore** | **Git: Pop Latest Stash**, or **Git: Pop Stash...** to choose one |
| Delete a stash | `git stash drop` | Click **Stashed Changes**, then **Discard** | **Git: Drop Stash...** |

GitHub Desktop holds only one stash at a time. If a stash already exists, the menu item reads **Stash All Changes…** and asks before it replaces the old stash. The terminal and VS Code can hold many.

### Discard and undo

| Task | Terminal | GitHub Desktop | VS Code |
| --- | --- | --- | --- |
| Throw away edits to one file | `git restore <file>` (no undo) | Right-click the file, then **Discard Changes…**. The discarded version goes to the Trash. | Hover over the file and click **Discard Changes**, or right-click it. Edits to tracked files don't go to the Trash. |
| Throw away all edits | `git restore .`, plus `git clean -fd` for new files (no undo) | **Branch → Discard All Changes…** (`⇧⌘⌫`) | **More Actions... → Changes → Discard All Changes** |
| Undo your last commit (not pushed yet) | `git reset --soft HEAD~1` | **Undo** at the bottom of the **Changes** tab, or right-click the commit in **History**, then **Undo Commit…** | **Git: Undo Last Commit**, or **More Actions... → Commit → Undo Last Commit** |
| Undo several commits (not pushed yet) | `git reset <commit>` | Right-click a commit in **History**, then **Reset to Commit…** | Terminal only |
| Undo a commit you already pushed | `git revert <commit>` | Right-click the commit in **History**, then **Revert Changes in Commit** | Terminal only (or use GitHub Desktop) |

Undo and reset keep your changes: they come back as uncommitted edits you can fix and commit again. Revert adds a new commit that reverses an old one, which is the safe choice for work already on GitHub.

The biggest difference between the tools is what happens on discard. GitHub Desktop saves discarded changes to the Trash. The terminal and VS Code throw away edits to tracked files for good, so check the diff before you discard.

### History

| Task | Terminal | GitHub Desktop | VS Code |
| --- | --- | --- | --- |
| List past commits | `git log --oneline` | **History** tab (`⌘2`) | **Source Control Graph** in the Source Control view |
| See what one commit changed | `git show <commit>` | Click the commit in **History**, then a file | Click the commit in the graph to list its files, or right-click it, then **Open Changes** |
| See all branches as a graph | `git log --graph --oneline --all` | Not available | **Source Control Graph** |
| See one file's history | `git log -p <file>` | Not available | Open the file, then expand **Timeline** in the Explorer view (`⇧⌘E`) |
| See who last changed each line | `git blame <file>` | Not available | **Git: Toggle Git Blame Editor Decoration** or **Git: Toggle Git Blame Status Bar Item** |
| Compare your branch with another | `git diff main...<branch>` | **Branch → Compare to Branch** (`⇧⌘B`) | Right-click a commit in the graph, then **Compare with...** |

`<commit>` is a commit ID, the short code such as `25a6f4d` that `git log --oneline` prints at the start of each line. GitHub Desktop shows it as the commit's SHA, and **Copy SHA** is in each commit's right-click menu.

## When only the terminal will do

### Not in either app

These tasks have no button or menu item in GitHub Desktop or VS Code. They're rare, and several are risky, so read the [git quick reference](../cli/git.md) before you run them.

| Task | Command | Why you'd need it |
| --- | --- | --- |
| Find a commit that seems lost | `git reflog` | Lists everywhere your branch has pointed recently, so you can rescue work after a bad reset or a deleted branch. |
| Preview which new files a clean-up would delete | `git clean -n` | Shows what `git clean -fd` would remove before you run it. The apps' discard actions don't preview. |
| Remove the last commit and its changes completely | `git reset --hard HEAD~1` | Careful: the uncommitted changes are gone. Both apps' undo actions keep your changes instead. |
| Force push without overwriting a teammate's work | `git push --force-with-lease` | Careful: replaces the branch on GitHub. GitHub Desktop offers **Force push origin** only after an amend or rebase, and VS Code hides **Push (Force)** unless you turn on the `git.allowForcePush` setting. Ask a teammate before you use any of them. |

### Missing from one app

| Task | Where it's missing | Use instead |
| --- | --- | --- |
| Undo a pushed commit (revert) | VS Code | `git revert <commit>`, or **Revert Changes in Commit** in GitHub Desktop |
| Undo several unpushed commits (reset) | VS Code | `git reset <commit>`, or **Reset to Commit…** in GitHub Desktop |
| Set your name and email for commits | VS Code | `git config set --global user.name "<name>"`, or **GitHub Desktop → Settings… → Git** |
| Keep more than one stash | GitHub Desktop | `git stash`, or the **Git: Stash** commands in VS Code |
| See a branch graph, one file's history, or who changed a line | GitHub Desktop | `git log --graph`, `git log -p <file>`, `git blame`, or the VS Code views above |
| Pull and push in one action | GitHub Desktop | **Sync Changes** in VS Code, or `git pull` then `git push` |
| Commit and push in one action | GitHub Desktop | **Commit & Push** in VS Code |
| Add a second remote | GitHub Desktop manages one remote, under **Repository → Repository Settings… → Remote** | `git remote add <name> <url>`, or **Git: Add Remote...** in VS Code |

## The same loop in each tool

This loop takes one change, such as new copy for a checkout error state, from a fresh start to GitHub. Pick one tool per step, or mix them: the result is the same.

### 1. Get up to date

- **Terminal:** `git switch main`, then `git pull`.
- **GitHub Desktop:** switch to `main` with **Current Branch**, click **Fetch origin**, then **Pull origin** if it appears.
- **VS Code:** switch to `main` from the Status Bar, then click the sync item in the Status Bar.

**Check:** `git status` says your branch is up to date, GitHub Desktop's top-right button reads **Fetch origin**, or VS Code's Status Bar shows no incoming or outgoing counts.

### 2. Make a branch

- **Terminal:** `git switch -c checkout-error-copy`.
- **GitHub Desktop:** **Branch → New Branch…** (`⇧⌘N`), name it `checkout-error-copy`, then **Create Branch**.
- **VS Code:** click the branch name in the Status Bar, then **Create new branch...**, and name it.

**Check:** every tool now shows `checkout-error-copy` as the current branch, because they all read the same folder.

### 3. Review your changes

Edit your files, or ask Claude Code to. Then read every change before you save it into history.

- **Terminal:** `git status`, then `git diff`.
- **GitHub Desktop:** click each file in the **Changes** tab.
- **VS Code:** click each file in the Source Control view.

**Check:** every changed file is one you expected, and you can explain every highlighted line. Discard anything you don't want (see [Discard and undo](#discard-and-undo)).

### 4. Commit

- **Terminal:** `git add .`, then `git commit -m "Rewrite card-declined error copy"`.
- **GitHub Desktop:** leave the files you want checked, type a summary in **Summary (required)**, then click the commit button.
- **VS Code:** stage with **+**, type a message, then click **Commit**.

**Check:** the list of changed files is empty (or holds only what you left out on purpose), and the commit is at the top of `git log --oneline`, the **History** tab, or the **Source Control Graph**.

### 5. Push or publish

- **Terminal:** `git push`.
- **GitHub Desktop:** click **Publish branch**.
- **VS Code:** click **Publish Branch**.

**Check:** GitHub Desktop's button returns to **Fetch origin**, or VS Code's Status Bar shows no outgoing count.

### 6. Check the result on GitHub

1. Open the repo on github.com. In GitHub Desktop, **Repository → View on GitHub** (`⇧⌘G`) takes you there.
2. Open a pull request for your branch. In GitHub Desktop, **Branch → Create Pull Request** (`⌘R`) opens it for you.
3. Read the **Files changed** tab as a reviewer would.

**Check:** the pull request lists only your commit and only the files you meant to change.

## Reviewing AI output

Claude Code can run any of the terminal commands in this guide for you. You own what it saves and shares.

- **Read the diff, not the summary.** Claude's reply describes what it meant to do. The diff in any of the three tools shows what it did.
- **Check which commands it ran.** If Claude says it committed, pushed, reset, or discarded something, look for the result in GitHub Desktop's **History** tab or VS Code's **Source Control Graph**.
- **Watch for confident mistakes.** A fluent explanation of a git command can still be wrong. Compare it with the tables above or the [git reference](https://git-scm.com/docs) before you run anything marked Careful.
- **Review AI commit messages.** If Claude or a sparkle button drafts a message, edit it so it describes what the diff actually shows.

## Protecting data

- **Check visibility before you publish.** Publishing a repo or branch sends it to GitHub, where anyone with access can read every commit. Keep **Keep this code private** checked in GitHub Desktop unless the work is meant to be public.
- **Keep people out of the repo.** Don't commit interview recordings, transcripts with participant names, emails, or other personal data. Replace names with IDs such as `P1`, `P2` first. A pushed file stays in history even after you delete it.
- **Keep confidential work out.** Unreleased strategy, client material, and anything under NDA stays out of repos and AI prompts unless your organization's policy allows it.
- **Don't commit secrets.** API keys, tokens, and `.env` files never go in a repo. This kit includes [gitleaks](../cli/gitleaks.md) to help catch them.
- **Follow your organization's AI policy.** When it and this guide disagree, the policy wins.

## When things go wrong

| Situation | What to do |
| --- | --- |
| You pressed `⌘P` or `⇧⌘P` expecting one app and got the other's action | In VS Code, press `Esc` to close Quick Open or the Command Palette. In GitHub Desktop, the push or pull already ran. Check the **History** tab to see what happened. |
| You discarded changes by mistake | In GitHub Desktop, look in the Trash for a dated file. In VS Code, try `⌘Z` in the open file, or check Time Machine. After `git restore`, git can't bring them back. |
| You committed on `main` by accident and haven't pushed | Undo the commit (see [Discard and undo](#discard-and-undo)), create a branch, then commit there. |
| A tool says you have conflicts | Stop. Read the conflicted files, then ask a teammate or Claude before you finish or abort the merge. |
| The apps show different branches or files | Refresh. GitHub Desktop updates when you switch back to it. In VS Code, run **Git: Refresh** from the Command Palette. |
| A commit seems to have vanished | Don't make more changes. Ask a teammate to help you run `git reflog` to find it. |

## Using these tools with Claude Code

Claude Code, GitHub Desktop, and VS Code all work on the same files on disk. When Claude edits files or runs a git command, both apps pick up the result.

1. **Create a branch or commit first**, in any tool, so any experiment can be undone.
2. Start Claude Code in the project (run `claude` in a terminal, or use the Claude panel in VS Code) and describe one change at a time.
3. Review the changes in GitHub Desktop's **Changes** tab or VS Code's Source Control view. See [Reviewing AI output](#reviewing-ai-output).
4. Commit and push yourself, so you stay in control of what gets saved and shared.

If a tutorial or Claude gives you a command you don't recognize, ask Claude to translate it before you run it:

```text
Explain what `git pull --rebase` does in plain language, and tell me where I'd find the same action in GitHub Desktop and in VS Code's Source Control view. If there's no button for it, say so. Don't run anything.
```

- **Give it:** the exact command, and which tools you use.
- **A good response:** a one- or two-sentence explanation, the menu path or button in each app, and a note if the command is risky.
- **How to check it:** find the button or menu item in the tables above or in the app itself. If Claude names a button you can't find, trust the app.

## A typical session

1. Open GitHub Desktop or VS Code and pick your project.
2. Fetch and pull so `main` is current.
3. Create a branch named for the work.
4. Make your edits, with Claude Code if you like.
5. Review the diff in whichever app you prefer, then commit.
6. Publish the branch, then open a pull request.
7. If a teammate asks you to run a command, find it in the [Side-by-side reference](#side-by-side-reference) first so you know what it will do.

## Tips and gotchas

- **Discard works differently in each tool.** Only GitHub Desktop sends discarded changes to the Trash. In VS Code and the terminal, discarded edits to tracked files are gone.
- **Shortcuts clash between the apps.** `⌘P` and `⇧⌘P` push and pull in GitHub Desktop, but open Quick Open and the Command Palette in VS Code.
- **GitHub Desktop has no staging list.** Checkboxes do the same job. If a teammate says "stage it," they mean "leave it checked."
- **`checkout` and `switch` mean the same thing here.** Older tutorials and VS Code's **Checkout to...** use the old word for moving to a branch.
- **Fetch before you start.** VS Code doesn't fetch in the background by default, and GitHub Desktop's **Pull origin** only appears once it knows about new commits.
- **Refresh when a tool looks out of date.** They share one folder, but a window that's been in the background may need a moment or a refresh to catch up.
- **Command Palette names are searchable.** In VS Code, type `Git:` and part of a word, such as `Git: stash`, to find the command.

## Sources

Every label, menu path, and shortcut in this guide was checked against these pages and against the installed apps on September 30, 2026. Anything that couldn't be confirmed was left out. If a label on your screen differs, the app has probably changed since then: trust the app, and check the page again.

**GitHub Desktop**

- [Keyboard shortcuts](https://docs.github.com/en/desktop/overview/github-desktop-keyboard-shortcuts)
- [Cloning and forking repositories from GitHub Desktop](https://docs.github.com/en/desktop/adding-and-cloning-repositories/cloning-and-forking-repositories-from-github-desktop)
- [Committing and reviewing changes](https://docs.github.com/en/desktop/making-changes-in-a-branch/committing-and-reviewing-changes-to-your-project-in-github-desktop)
- [Managing branches](https://docs.github.com/en/desktop/making-changes-in-a-branch/managing-branches-in-github-desktop)
- [Stashing changes](https://docs.github.com/en/desktop/making-changes-in-a-branch/stashing-changes-in-github-desktop)
- [Viewing the branch history](https://docs.github.com/en/desktop/making-changes-in-a-branch/viewing-the-branch-history-in-github-desktop)
- [Pushing changes to GitHub](https://docs.github.com/en/desktop/making-changes-in-a-branch/pushing-changes-to-github-from-github-desktop)
- [Syncing your branch](https://docs.github.com/en/desktop/working-with-your-remote-repository-on-github-or-github-enterprise/syncing-your-branch-in-github-desktop)
- [Undoing a commit](https://docs.github.com/en/desktop/managing-commits/undoing-a-commit-in-github-desktop), [Reverting a commit](https://docs.github.com/en/desktop/managing-commits/reverting-a-commit-in-github-desktop), [Amending a commit](https://docs.github.com/en/desktop/managing-commits/amending-a-commit-in-github-desktop), and [Resetting to a commit](https://docs.github.com/en/desktop/managing-commits/resetting-to-a-commit-in-github-desktop)

**VS Code**

- [Source Control overview](https://code.visualstudio.com/docs/sourcecontrol/overview)
- [Source Control quickstart](https://code.visualstudio.com/docs/sourcecontrol/quickstart)
- [Repositories and remotes](https://code.visualstudio.com/docs/sourcecontrol/repos-remotes)
- [Staging, commits, and undo](https://code.visualstudio.com/docs/sourcecontrol/staging-commits)
- [Branches, stashes, and worktrees](https://code.visualstudio.com/docs/sourcecontrol/branches-worktrees)
- [History and blame](https://code.visualstudio.com/docs/sourcecontrol/history)
- [Merge conflicts](https://code.visualstudio.com/docs/sourcecontrol/merge-conflicts)
- [Default keyboard shortcuts](https://code.visualstudio.com/docs/reference/default-keybindings)

**Git**

- [Git reference](https://git-scm.com/docs): manual pages for `git switch`, `git restore`, `git stash`, and every other command above

## Next steps

- [GitHub Desktop guide](github-desktop/README.md): a full tour of the app and its save-and-share loop
- [VS Code guide](vs-code/README.md): the Source Control view in depth, plus Claude Code in the same window
- [git quick reference](../cli/git.md): more terminal commands, with notes on the risky ones
- [gh quick reference](../cli/gh.md): open and review pull requests from the terminal
