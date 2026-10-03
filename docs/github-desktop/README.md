# GitHub Desktop for UX designers

A guide to the GitHub Desktop interface for designers who are getting started with Git, GitHub, and Claude Code. You don't need to be a developer. GitHub Desktop is a visual app for saving versions of your work, trying ideas on separate branches, and sharing changes with your team, without typing Git commands. By the end, you can take a change from first edit to a reviewed pull request, and check anything Claude Code changed before you keep it.

Shortcuts below are for macOS. On Windows, swap `⌘` for `Ctrl`.

_Last verified: September 2026 with GitHub Desktop 3.6.6 on macOS 27._

## Contents

- [Before you start](#before-you-start)
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
- [Reviewing AI output](#reviewing-ai-output)
- [Protecting data](#protecting-data)
- [Accessibility check](#accessibility-check)
- [Undoing things](#undoing-things)
- [Using GitHub Desktop with Claude Code](#using-github-desktop-with-claude-code)
- [A typical session](#a-typical-session)
- [Tips and gotchas](#tips-and-gotchas)
- [Next steps](#next-steps)

## Before you start

| You need | Why | How to get it |
| --- | --- | --- |
| GitHub Desktop | The app this guide tours. | Installed by this kit. See the [main README](../../README.md). |
| A GitHub account | To sign in, push your work, and open pull requests. | [github.com](https://github.com/) |
| A repository to practice on | Somewhere safe to try the loop. A personal, private repo is ideal. | Create one in [Getting a project](#getting-a-project), or ask a teammate for access to a team repo. |
| Claude Code (optional) | Only for [Using GitHub Desktop with Claude Code](#using-github-desktop-with-claude-code). It needs a Claude plan or account that includes Claude Code. | See the [Claude Code overview](https://code.claude.com/docs/en/overview) for current requirements. |

**Time:** about 20 minutes the first time.

**By the end you'll have:** a branch with a small change, committed, pushed to GitHub, and open as a pull request for a teammate to review.

## Official links

- [GitHub Desktop website](https://desktop.github.com/): downloads and overview
- [GitHub Desktop documentation](https://docs.github.com/en/desktop): the full documentation
- [GitHub Desktop keyboard shortcuts](https://docs.github.com/en/desktop/overview/github-desktop-keyboard-shortcuts): the complete shortcut list for macOS and Windows
- [Claude Code overview](https://code.claude.com/docs/en/overview): Anthropic's introduction to Claude Code

## Why GitHub Desktop

- **You can see your work.** Every changed file and every changed line is shown side by side before you save anything.
- **Nothing is typed.** Branching, committing, pushing, and pulling are buttons and menu items.
- **It pairs well with Claude Code.** Claude edits files on disk, and GitHub Desktop shows exactly what it changed, so you can review it like a design diff.
- **It is hard to lose work.** Commits are snapshots you can return to, and discarded changes go to the Trash.

This kit installs GitHub Desktop for you. See the [main README](../../README.md).

## Key ideas in plain language

| Term | Think of it as |
| --- | --- |
| **Repository** ("repo") | A project folder whose history is tracked. |
| **Commit** | A named snapshot of your changes, like saving a version with a note. |
| **Branch** | A parallel copy of the project where you can try something without touching the main version, like duplicating a Figma page to explore. |
| **`main`** | The main branch: the agreed, shared version of the project. |
| **Diff** | A side-by-side view of what changed in a file: added lines in green, removed lines in red. |
| **Push** | Upload your commits to GitHub. |
| **Pull** | Download other people's commits from GitHub. |
| **Fetch** | Check GitHub for new commits without applying them. |
| **Pull request** ("PR") | A request to merge your branch into the main one, with a place for review and comments. |
| **Clone** | Download a repo from GitHub to your computer for the first time. |
| **Origin** | The copy of the repo that lives on GitHub. |
| **Stash** | A shelf where you park unfinished changes without committing them. |
| **Merge conflict** | Two people changed the same lines, and Git needs you to pick which version to keep. |

## First-time setup

1. Open GitHub Desktop.
2. Choose **Sign in to GitHub.com** and finish signing in through your browser.
3. Confirm your name and email. These are attached to every commit you make.
4. To change either later, open **GitHub Desktop → Settings…** (`⌘,`). Accounts are under **Accounts**, and the name and email are under **Git**.
5. Under **Integrations**, pick your external editor (for example Visual Studio Code) so **Open in Visual Studio Code** works from the Repository menu.

**Check:** **GitHub Desktop → Settings… → Accounts** shows your GitHub username.

## Tour of the interface

Open GitHub Desktop alongside this table to follow along.

| Part | Where | What it's for |
| --- | --- | --- |
| **Current Repository** | Top left | Switch between projects, or add a new one. |
| **Current Branch** | Top center | Shows which branch you are on. Click it to switch branches or create a new one. |
| **Fetch / Pull / Push button** | Top right | Changes by context: **Fetch origin**, **Pull origin**, or **Push origin**. The label tells you what GitHub Desktop thinks is next. |
| **Changes tab** | Left sidebar | Every file you have edited, with a checkbox beside each. |
| **History tab** | Left sidebar | Past commits on this branch. Click one to see what it changed. |
| **Diff view** | Right, large | The selected file with added lines in green and removed lines in red. |
| **Commit box** | Bottom left | A summary, an optional description, and the commit button, which names the branch it commits to. |
| **Menu bar** | Top of screen | Repository, Branch, and View menus hold actions the buttons don't cover. |

Right-click a file in the Changes list for extra actions, such as **Discard Changes…**, **Reveal in Finder**, and **Open in Visual Studio Code**.

### Shortcuts worth learning first

| Action                                                        | Shortcut    |
| ------------------------------------------------------------- | ----------- |
| Show Changes / show History                                   | `⌘1` / `⌘2` |
| New branch                                                    | `⇧⌘N`       |
| Fetch                                                         | `⇧⌘T`       |
| Push                                                          | `⌘P`        |
| Pull                                                          | `⇧⌘P`       |
| Create a pull request (or view it on GitHub, once one exists) | `⌘R`        |
| Clone a repository                                            | `⇧⌘O`       |
| Show the repo in Finder                                       | `⇧⌘F`       |
| Open the repo in your external editor                         | `⇧⌘A`       |
| Open the repo in Terminal                                     | `` ⌃` ``    |

If a shortcut doesn't respond, find the action in the menu bar. The shortcut is listed beside it.

## Getting a project

- **Clone from GitHub.** **File → Clone Repository…** (`⇧⌘O`), pick the repo from your list or paste its URL, choose a local folder, and click **Clone**.
- **Add a folder you already have.** **File → Add Local Repository…** (`⌘O`). If the folder isn't tracked yet, GitHub Desktop offers to create a repository there.
- **Start a new one.** **File → New Repository…** (`⌘N`). Give it a name and location, then **Publish repository** in the top bar to put it on GitHub.

When you publish, **Keep this code private** is checked by default. Leave it checked unless the work is meant to be public. Unchecking it makes the repo visible to anyone.

**Check:** the repo's name appears under **Current Repository**.

## A basic save-and-share loop

This loop takes one piece of work, such as new onboarding copy, from first edit to a pull request your team can review. Use it for every change, large or small.

### 1. Make a branch

Before you start a piece of work, branch off so `main` stays clean.

1. Click **Current Branch**, then **New Branch** (or `⇧⌘N`).
2. Name it for the work, for example `update-onboarding-copy`. Use lowercase words joined by hyphens.
3. Leave it based on `main` and click **Create Branch**.

**Check:** **Current Branch** shows your new branch name.

### 2. Make changes

Edit files in Figma exports, Markdown, code, or whatever the project holds, using any app. You can also ask Claude Code to do it (see [Using GitHub Desktop with Claude Code](#using-github-desktop-with-claude-code)). GitHub Desktop notices on its own and lists the changed files in the **Changes** tab.

**Check:** every file you edited appears in the **Changes** tab, and nothing you didn't expect.

### 3. Review and commit

1. Click each file in the Changes list and read the diff.
2. Uncheck any file or line that doesn't belong in this snapshot. Click the line-number gutter in the diff to include or exclude single lines.
3. Write a summary in the **Summary (required)** field: a short sentence that says what changed and why, such as `Shorten onboarding headline`.
4. Add a **Description** if it helps a reviewer.
5. Click the commit button. It names the number of files and the branch, for example **Commit 2 files to update-onboarding-copy**.

Small, focused commits are easier to review and easier to undo. If Claude Code or any other AI tool made the changes, work through [Reviewing AI output](#reviewing-ai-output) before you commit.

**Check:** the **Changes** tab is empty (or holds only what you left out on purpose), and your commit is at the top of the **History** tab.

### 4. Push

Click **Push origin** in the top bar. This uploads your branch to GitHub. The first push of a new branch reads **Publish branch**.

**Check:** the top-right button returns to **Fetch origin**.

### 5. Open a pull request

1. Click **Create Pull Request** (or `⌘R`). Your browser opens GitHub with the branch selected.
2. Add a title and description, and attach screenshots if the change is visual.
3. If the change touches UI, copy, or visuals, run the [Accessibility check](#accessibility-check) and note the result in the description.
4. Click **Create Pull Request** on GitHub and ask a teammate to review.

**Check:** the pull request page on GitHub lists your commits under **Commits** and your changes under **Files changed**.

### 6. Stay up to date

- Click **Fetch origin** to check for new commits. If the button changes to **Pull origin**, click it to download them.
- To bring the latest `main` into your branch, choose **Branch → Update from main** (`⇧⌘U`). If GitHub Desktop reports a conflict, see [Tips and gotchas](#tips-and-gotchas).
- After your pull request is merged on GitHub, switch to `main`, pull, and delete the finished branch with **Branch → Delete…** (`⇧⌘D`).

**Check:** on `main`, the top-right button reads **Fetch origin**, and your finished branch no longer appears in the **Current Branch** list.

## Reviewing AI output

You own anything you keep. GitHub Desktop is where you check what Claude Code (or any AI tool) actually did before it becomes part of the project:

- **Read the diff, not the summary.** The summary Claude gives you describes what it meant to do. The diff in the **Changes** tab shows what it did.
- **Check the file list first.** Every file in **Changes** should be one you expected Claude to touch. An unexpected file is a reason to stop and ask why.
- **Compare with the source.** If Claude rewrote copy from a brief or synthesized research notes, check that quotes, names, and numbers match the original.
- **Look for what's missing.** Models flatten outliers and minority voices into averages. Check that edge cases, error states, and less common views survived.
- **Watch for confident mistakes.** A fluent change can still be wrong. Verify claims about the product, links, and anything that looks like a fact.
- **Review AI commit messages too.** If you let Claude, or GitHub Copilot in GitHub Desktop, draft a commit message, edit it so it describes what the diff actually shows.

## Protecting data

- **Check visibility before you publish.** Keep **Keep this code private** checked unless the work is meant to be public. On an existing repo, check its visibility on GitHub before you push anything sensitive.
- **Keep people out of the repo.** Don't commit interview recordings, transcripts with participant names, emails, or other personal data. Replace names with IDs such as `P1`, `P2` first. A pushed file stays in history even after you delete it.
- **Keep people out of prompts.** The same goes for Claude Code: don't paste personal data into a prompt or point Claude at files that hold it.
- **Keep confidential work out.** Unreleased strategy, client material, and anything under NDA stays out of repos and prompts unless your organization's policy allows it.
- **Don't commit secrets.** API keys, tokens, and `.env` files never go in a repo. The kit includes [gitleaks](../../cli/gitleaks.md) to help catch them. A pushed secret must be treated as leaked, even if you delete it later.
- **Follow your organization's AI policy.** When it and this guide disagree, the policy wins.

## Accessibility check

When your branch changes what people see or hear, check it before you open the pull request:

- [ ] Text and interactive elements meet contrast requirements (Web Content Accessibility Guidelines, WCAG 2.2 AA: 4.5:1 for body text).
- [ ] Every meaningful image has alt text, and decorative images are marked as decorative.
- [ ] You can reach and use every control with the keyboard alone.
- [ ] A screen reader (VoiceOver on macOS: `⌘F5`) announces labels, states, and errors in a sensible order.
- [ ] Copy is plain, and error messages say what happened and how to fix it.

## Undoing things

| Situation | What to do |
| --- | --- |
| Edited a file and want the old version back | Right-click the file in Changes → **Discard Changes…**. The discarded changes go to the Trash, so you can still recover them until the Trash is emptied. |
| Claude changed more than you asked | Uncheck the files or lines you don't want and commit the rest, or right-click them → **Discard Changes…**. If you committed before the request, you can discard everything and start again. |
| Committed too soon and haven't pushed | Click **Undo** at the bottom of the **Changes** tab, next to the last commit. Your changes return to the Changes tab. |
| Want to undo a commit you already pushed | History tab → right-click the commit → **Revert Changes in Commit**. This adds a new commit that reverses it. |
| Need to switch branches with unfinished work | Switch anyway and choose **Leave my changes on** _current-branch_ to stash them, or **Bring my changes to** _new-branch_ to carry them along. To restore stashed work, go back to that branch, click **Stashed Changes** in the Changes tab, then **Restore**. |
| Committed to the wrong branch | Stop, and ask Claude or a teammate before pushing. It is fixable, but the steps depend on your situation. |

## Using GitHub Desktop with Claude Code

Claude Code works in a project folder and edits files there. GitHub Desktop watches the same folder. The two tools don't need to be connected, because the files on disk are the shared ground.

1. Open the repo in GitHub Desktop and **create a branch first**, so any experiment stays off `main`. Commit any work in progress so you have a clean starting point.
2. Open a terminal in the project with **Repository → Open in Terminal** (`` ⌃` ``), or use [VS Code](../vs-code/README.md) with the Claude panel. The menu item names whichever shell app is set under **GitHub Desktop → Settings… → Integrations**.
3. Start Claude Code by running `claude`, then describe what you want. Ask for one change at a time, for example:

   ```text
   Rewrite the headline and body text in onboarding/welcome.md to be under 12 words each. Keep the tone friendly and don't change any other files.
   ```

4. Switch back to GitHub Desktop. The **Changes** tab lists every file Claude touched, and the diff shows each edit.
5. Review the diff using [Reviewing AI output](#reviewing-ai-output), uncheck anything unwanted, and commit. Claude can also run Git commands on request, but committing yourself keeps you in control of what gets saved.

Helpful habits:

- **Commit before a big request.** A clean starting point lets you discard everything Claude did if the result isn't what you wanted.
- **Ask for small steps.** One change per request makes diffs short and commits meaningful.
- **Read the diff.** The summary Claude gives you describes intent. The diff shows what happened.
- **Let Claude draft the message.** Ask the prompt below, check it against the diff, then paste it into the **Summary (required)** field.

  ```text
  suggest a commit message for my changes
  ```

- **Use Claude to explain.** If a diff confuses you, ask:

  ```text
  what does this change do, in plain language?
  ```

## A typical session

1. Open GitHub Desktop and pick your repo from **Current Repository**.
2. Click **Fetch origin**. If it becomes **Pull origin**, click it.
3. Click **Current Branch → New Branch** and name the work.
4. Make your edits, with Claude Code if you like.
5. Review the diffs in **Changes**, then write a summary and click the commit button.
6. Click **Push origin**, then **Create Pull Request**.
7. Respond to review comments. Repeat steps 4 to 6 on the same branch, and the PR updates itself.
8. When the PR is merged, switch to `main`, pull, and delete the branch.

## Tips and gotchas

- **Check the branch name before you commit.** The commit button says which branch it commits to. Committing to `main` by accident is the most common beginner mistake.
- **Large design files are a poor fit.** Git tracks text well and binary files badly. Large exports bloat the repo. Ask your team where design files belong.
- **Merge conflicts aren't a failure.** They mean two people changed the same lines. GitHub Desktop lists the conflicted files and offers **Open in Visual Studio Code**. Fix the marked sections, save, and commit. Claude can walk you through it.
- **Ignored files stay hidden.** Files matched by `.gitignore` don't show in Changes on purpose.
- **Fetch often.** It's free, and it tells you early when teammates have pushed.
- **History is a safety net.** If you're unsure about something, commit it on a branch first. You can always go back.
- **The app and the terminal agree.** Anything you do in GitHub Desktop is visible to `git` commands and Claude Code, and the other way around.

## Next steps

- [VS Code guide](../vs-code/README.md): edit files and run Claude Code in the same window, with Git built in
- [Git in three places](../git-github-desktop-vscode-comparison.md): each GitHub Desktop action next to its terminal command and VS Code equivalent
- [git quick reference](../../cli/git.md): the same save-and-share loop in the terminal
- [gh quick reference](../../cli/gh.md): open and review pull requests from the terminal
- [Command-line references](../../cli/README.md): every terminal tool in the kit, including [gitleaks](../../cli/gitleaks.md) for catching secrets
