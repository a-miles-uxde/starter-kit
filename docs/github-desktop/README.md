# GitHub Desktop for UX designers

A guide to the GitHub Desktop interface for designers who are getting started with Git, GitHub, and Claude Code. You don't need to be a developer. GitHub Desktop is a visual app for saving versions of your work, trying ideas on separate branches, and sharing changes with your team, without typing Git commands.

Shortcuts below are for macOS. On Windows, swap `⌘` for `Ctrl`.

## Contents

- [Official links](#official-links)
- [Why GitHub Desktop](#why-github-desktop)
- [Key ideas in plain language](#key-ideas-in-plain-language)
- [First-time setup](#first-time-setup)
- [Tour of the interface](#tour-of-the-interface)
  - [Shortcuts worth learning first](#shortcuts-worth-learning-first)
- [Getting a project](#getting-a-project)
- [A basic save-and-share loop](#a-basic-save-and-share-loop)
  - [1. Make a branch](#1-make-a-branch)
  - [2. Make changes](#2-make-changes)
  - [3. Review and commit](#3-review-and-commit)
  - [4. Push](#4-push)
  - [5. Open a pull request](#5-open-a-pull-request)
  - [6. Stay up to date](#6-stay-up-to-date)
- [Undoing things](#undoing-things)
- [Using GitHub Desktop with Claude Code](#using-github-desktop-with-claude-code)
- [A typical session](#a-typical-session)
- [Tips and gotchas](#tips-and-gotchas)

## Official links

- [GitHub Desktop website](https://desktop.github.com/): downloads and overview
- [GitHub Desktop documentation](https://docs.github.com/en/desktop): the full documentation
- [Claude Code overview](https://code.claude.com/docs/en/overview): Anthropic's introduction to Claude Code

## Why GitHub Desktop

- **You can see your work.** Every changed file and every changed line is shown side by side before you save anything.
- **Nothing is typed.** Branching, committing, pushing, and pulling are buttons and menu items.
- **It pairs well with Claude Code.** Claude edits files on disk, and GitHub Desktop shows exactly what it changed, so you can review it like a design diff.
- **It is hard to lose work.** Commits are snapshots you can return to, and discarded changes go to the Trash.

This kit installs GitHub Desktop for you. See the [main README](../../README.md). For the same workflow in the terminal, see the [git quick reference](../../cli/git.md). For VS Code, see the [VS Code guide](../vs-code/README.md).

## Key ideas in plain language

| Term | Think of it as |
| --- | --- |
| **Repository** ("repo") | A project folder whose history is tracked. |
| **Commit** | A named snapshot of your changes, like saving a version with a note. |
| **Branch** | A parallel copy of the project where you can try something without touching the main version. |
| **Push** | Upload your commits to GitHub. |
| **Pull** | Download other people's commits from GitHub. |
| **Fetch** | Check GitHub for new commits without applying them. |
| **Pull request** ("PR") | A request to merge your branch into the main one, with a place for review and comments. |
| **Clone** | Download a repo from GitHub to your computer for the first time. |
| **Origin** | The copy of the repo that lives on GitHub. |

## First-time setup

1. Open GitHub Desktop.
2. Choose **Sign in to GitHub.com** and finish signing in through your browser.
3. Confirm your name and email. These are attached to every commit you make.
4. To change either later, open **GitHub Desktop → Settings** (`⌘,`). Accounts are under **Accounts**, and the name and email are under **Git**.
5. Under **Integrations**, pick your external editor (for example Visual Studio Code) so **Open in Visual Studio Code** works from the Repository menu.

## Tour of the interface

| Part | Where | What it's for |
| --- | --- | --- |
| **Current Repository** | Top left | Switch between projects, or add a new one. |
| **Current Branch** | Top center | Shows which branch you are on. Click it to switch branches or create a new one. |
| **Fetch / Pull / Push button** | Top right | Changes by context: **Fetch origin**, **Pull origin**, or **Push origin**. The label tells you what GitHub Desktop thinks is next. |
| **Changes tab** | Left sidebar | Every file you have edited, with a checkbox beside each. |
| **History tab** | Left sidebar | Past commits on this branch. Click one to see what it changed. |
| **Diff view** | Right, large | The selected file with added lines in green and removed lines in red. |
| **Commit box** | Bottom left | A summary, an optional description, and the **Commit** button. |
| **Menu bar** | Top of screen | Repository, Branch, and View menus hold actions the buttons don't cover. |

Right-click a file in the Changes list for extra actions, such as **Discard changes**, **Show in Finder**, and **Open in Visual Studio Code**.

### Shortcuts worth learning first

| Shortcut | Action |
| --- | --- |
| `⌘1` / `⌘2` | Show Changes / show History |
| `⇧⌘O` | Clone a repository |
| `⇧⌘N` | New branch |
| `⌘P` | Push (or pull, depending on the button) |
| `⇧⌘T` | Fetch |
| `⌘R` | Create a pull request |
| `⇧⌘F` | Show the repo in Finder |
| `⇧⌘A` | Open the repo in your external editor |
| `⌃`` ` | Open the repo in Terminal |

If a shortcut doesn't respond, find the action in the menu bar. The shortcut is listed beside it.

## Getting a project

- **Clone from GitHub.** **File → Clone Repository** (`⇧⌘O`), pick the repo from your list or paste its URL, choose a local folder, and click **Clone**.
- **Add a folder you already have.** **File → Add Local Repository** (`⌘O`). If the folder isn't tracked yet, GitHub Desktop offers to create a repository there.
- **Start a new one.** **File → New Repository** (`⌘N`). Give it a name and location, then **Publish repository** in the top bar to put it on GitHub.

Publishing defaults can make a repo public. Check the **Keep this code private** box if the work isn't meant to be seen.

## A basic save-and-share loop

### 1. Make a branch

Before you start a piece of work, branch off so `main` stays clean.

1. Click **Current Branch**, then **New Branch** (or `⇧⌘N`).
2. Name it for the work, for example `update-onboarding-copy`. Use lowercase words joined by hyphens.
3. Leave it based on `main` and click **Create Branch**.

### 2. Make changes

Edit files in Figma exports, Markdown, code, or whatever the project holds, using any app. You can also ask Claude Code to do it (see [below](#using-github-desktop-with-claude-code)). GitHub Desktop notices on its own and lists the changed files in the **Changes** tab.

### 3. Review and commit

1. Click each file in the Changes list and read the diff.
2. Uncheck any file or line that doesn't belong in this snapshot. Click the line-number gutter in the diff to include or exclude single lines.
3. Write a **Summary** in the commit box: a short sentence that says what changed and why, such as `Shorten onboarding headline`.
4. Add a **Description** if it helps a reviewer.
5. Click **Commit to** *your-branch*.

Small, focused commits are easier to review and easier to undo.

### 4. Push

Click **Push origin** in the top bar. This uploads your branch to GitHub. The first push of a new branch reads **Publish branch**.

### 5. Open a pull request

1. Click **Create Pull Request** (or `⌘R`). Your browser opens GitHub with the branch selected.
2. Add a title and description, and attach screenshots if the change is visual.
3. Click **Create pull request** on GitHub and ask a teammate to review.

### 6. Stay up to date

- Click **Fetch origin** to check for new commits. If the button changes to **Pull origin**, click it to download them.
- To bring the latest `main` into your branch, choose **Branch → Update from main**. If GitHub Desktop reports a conflict, see [Tips and gotchas](#tips-and-gotchas).
- After your pull request is merged on GitHub, switch to `main`, pull, and delete the finished branch with **Branch → Delete**.

## Undoing things

| Situation | What to do |
| --- | --- |
| Edited a file and want the old version back | Right-click the file in Changes → **Discard changes**. The file goes to the Trash, so you can still recover it. |
| Committed too soon and haven't pushed | **Edit → Undo** (`⌘Z`) right after the commit. Your changes return to the Changes tab. |
| Want to undo a commit you already pushed | History tab → right-click the commit → **Revert Changes in Commit**. This adds a new commit that reverses it. |
| Need to switch branches with unfinished work | Switch anyway and choose **Stash my changes** in the prompt, or **Bring my changes to…** to carry them along. Stashed work can be restored from the Changes tab. |
| Committed to the wrong branch | Stop, and ask Claude or a teammate before pushing. It is fixable, but the steps depend on your situation. |

## Using GitHub Desktop with Claude Code

Claude Code works in a project folder and edits files there. GitHub Desktop watches the same folder. The two tools don't need to be connected, because the files on disk are the shared ground.

1. Open the repo in GitHub Desktop and **create a branch first**, so any experiment stays off `main`.
2. Open a terminal in the project with **Repository → Open in Terminal** (or `⌃`` ` ), or use [VS Code](../vs-code/README.md) with the Claude panel.
3. Start Claude Code by running `claude`, then describe what you want.
4. Switch back to GitHub Desktop. The **Changes** tab lists every file Claude touched, and the diff shows each edit.
5. Review the diff, uncheck anything unwanted, and commit. Claude can also run Git commands on request, but committing yourself keeps you in control of what gets saved.

Helpful habits:

- **Commit before a big request.** A clean starting point lets you discard everything Claude did if the result isn't what you wanted.
- **Ask for small steps.** One change per request makes diffs short and commits meaningful.
- **Read the diff.** The summary Claude gives you describes intent. The diff shows what happened.
- **Let Claude draft the message.** Ask `suggest a commit message for my changes`, then paste it into the Summary field.
- **Use Claude to explain.** If a diff confuses you, ask `what does this change do, in plain language?`

## A typical session

1. Open GitHub Desktop and pick your repo from **Current Repository**.
2. Click **Fetch origin**. If it becomes **Pull origin**, click it.
3. Click **Current Branch → New Branch** and name the work.
4. Make your edits, with Claude Code if you like.
5. Review the diffs in **Changes**, then write a summary and **Commit**.
6. Click **Push origin**, then **Create Pull Request**.
7. Respond to review comments. Repeat steps 4–6 on the same branch, and the PR updates itself.
8. When the PR is merged, switch to `main`, pull, and delete the branch.

## Tips and gotchas

- **Don't commit secrets.** API keys, tokens, and `.env` files should never be committed. The kit includes [gitleaks](../../cli/gitleaks.md) to help catch them. A pushed secret must be treated as leaked, even if you delete it later.
- **Check the branch name before you commit.** The commit button says which branch it commits to. Committing to `main` by accident is the most common beginner mistake.
- **Large design files are a poor fit.** Git tracks text well and binary files badly. Large exports bloat the repo. Ask your team where design files belong.
- **Merge conflicts aren't a failure.** They mean two people changed the same lines. GitHub Desktop lists the conflicted files and offers **Open in Visual Studio Code**. Fix the marked sections, save, and commit. Claude can walk you through it.
- **Ignored files stay hidden.** Files matched by `.gitignore` don't show in Changes on purpose.
- **Fetch often.** It's free, and it tells you early when teammates have pushed.
- **History is a safety net.** If you're unsure about something, commit it on a branch first. You can always go back.
- **The app and the terminal agree.** Anything you do in GitHub Desktop is visible to `git` commands and Claude Code, and the other way around.
