# VS Code for UX designers

A guide to the Visual Studio Code interface for designers who are getting started with Git, GitHub, and Claude Code. You don't need to be a developer. VS Code is a workspace where you can open a project, see what changed, save versions of your work, and ask Claude for help, all in one window. By the end you can open a project, make a change with Claude's help, review it, and share it on GitHub.

Shortcuts below are for macOS. On Windows and Linux, swap `⌘` for `Ctrl`.

_Last verified: September 2026 with VS Code 1.139.1 and the Claude Code extension 2.1.286 on macOS 27._

## Contents

- [Before you start](#before-you-start)
- [Official links](#official-links)
- [Why VS Code](#why-vs-code)
- [Key ideas in plain language](#key-ideas-in-plain-language)
- [First-time setup](#first-time-setup)
- [Tour of the interface](#tour-of-the-interface)
  - [Shortcuts worth learning first](#shortcuts-worth-learning-first)
- [Opening a project](#opening-a-project)
- [Git in VS Code](#git-in-vs-code)
  - [The Source Control view](#the-source-control-view)
- [A basic save-and-share loop](#a-basic-save-and-share-loop)
  - [1. Create a branch](#1-create-a-branch)
  - [2. Make changes](#2-make-changes)
  - [3. Review the changes](#3-review-the-changes)
  - [4. Stage and commit](#4-stage-and-commit)
  - [5. Publish or sync](#5-publish-or-sync)
  - [6. Open a pull request](#6-open-a-pull-request)
- [GitHub in VS Code](#github-in-vs-code)
- [Claude Code in VS Code](#claude-code-in-vs-code)
  - [Install the extension](#install-the-extension)
  - [Open Claude](#open-claude)
  - [Give Claude context](#give-claude-context)
  - [Review before you accept](#review-before-you-accept)
  - [Claude shortcuts](#claude-shortcuts)
- [Reviewing AI output](#reviewing-ai-output)
- [Protecting data](#protecting-data)
- [Accessibility check](#accessibility-check)
- [When things go wrong](#when-things-go-wrong)
- [A typical session](#a-typical-session)
- [Tips and gotchas](#tips-and-gotchas)
- [Next steps](#next-steps)

## Before you start

| You need | Why | How to get it |
| --- | --- | --- |
| VS Code 1.94.0 or later | The editor this guide tours. The Claude Code extension needs 1.94.0 or later. | Installed by this kit. See the [main README](../../README.md). |
| A GitHub account | To publish branches and open pull requests. | [github.com](https://github.com/) |
| A paid Claude plan (Pro, Max, Team, or Enterprise) or a Claude Console account | To use the Claude Code extension. | See [Claude Code in VS Code](https://code.claude.com/docs/en/vs-code) for current requirements, or ask your team lead. |
| A project folder that uses Git | Something to practice on. A copy of a small docs or prototype repo is ideal. | Clone one from GitHub, or ask a teammate which repo to use. |

**Time:** about 30 minutes the first time, including setup.

**By the end you'll have:** a branch with a small change, made with Claude's help, reviewed by you, and published to GitHub, ready for a pull request.

## Official links

- [Visual Studio Code website](https://code.visualstudio.com/): downloads and overview
- [VS Code documentation](https://code.visualstudio.com/docs): the documentation landing page
- [VS Code user interface](https://code.visualstudio.com/docs/getstarted/userinterface): the top-level page on the UI
- [Claude Code in VS Code](https://code.claude.com/docs/en/vs-code): Anthropic's page on the VS Code integration

## Why VS Code

- **One window for everything.** Files, a terminal, version control, and Claude sit side by side.
- **Git is built in.** You can do most everyday Git work by clicking instead of typing commands.
- **Claude Code has a native panel.** You get a chat, visual diffs of proposed changes, and plan review without leaving the editor.
- **Anything you can't find is searchable.** The Command Palette lists every action by name.

This kit installs VS Code for you. See the [main README](../../README.md).

## Key ideas in plain language

| Term | Think of it as |
| --- | --- |
| **Repository** ("repo") | A project folder whose history is tracked, like a Figma file with its full version history attached. |
| **Git** | The tool on your Mac that records that history. |
| **GitHub** | The website where a repo lives online, so teammates can see, review, and build on it. |
| **Commit** | A named snapshot of your changes, like saving a version in Figma with a note. |
| **Branch** | A parallel copy of the project for trying an idea, like duplicating a Figma page to explore without touching the original. |
| **`main`** | The branch everyone treats as the real, current version. |
| **Diff** | A side-by-side comparison of old and new, like a before-and-after in a design review. |
| **Stage** | Choosing which changed files go into the next commit, like picking frames to include in a handoff. |
| **Publish, push, and sync** | Sending your commits to GitHub (and, for sync, pulling down other people's commits too). |
| **Pull request** (PR) | A request to merge your branch into `main`, with a place for review and comments, like sharing a file for critique before it ships. |
| **Command Palette** | A search box for every command in VS Code. |
| **Extension** | An add-on that gives VS Code new abilities, like a Figma plugin. |
| **Claude Code** | Anthropic's AI assistant that can read your project, explain it, and edit files. |
| **Permission mode** | How much Claude may do without asking you first, from "ask before every edit" to "plan only." |
| **Checkpoint** | A save point Claude keeps for its own edits, so you can rewind them from the chat. |

## First-time setup

1. Open VS Code from your Applications folder.
2. Check the version with **Code → About Visual Studio Code**. **Check:** it says 1.94.0 or later. If it's older, choose **Code → Check for Updates…**.
3. Sign in to GitHub: click the **Accounts** icon near the bottom of the Activity Bar and choose to sign in with GitHub. Finish in your browser. **Check:** the **Accounts** menu shows your GitHub username.
4. Install the Claude Code extension. See [Install the extension](#install-the-extension).

You can also sign in to GitHub later. VS Code prompts you the first time you clone or publish.

## Tour of the interface

Open VS Code alongside this table to follow along.

| Part | Where | What it's for |
| --- | --- | --- |
| **Editor** | Center | Where files open. You can split it into columns or rows to view files side by side. |
| **Activity Bar** | Far left edge | Icons that switch the Side Bar between views: Explorer, Search, Source Control, Extensions. |
| **Primary Side Bar** | Next to the Activity Bar | The content of the selected view, such as your file tree in Explorer. |
| **Secondary Side Bar** | Right side | Holds extra views. Drag a view here to keep it open next to the Primary Side Bar. |
| **Panel** | Below the editor | Terminal, Problems, and Output. |
| **Status Bar** | Bottom edge | The current Git branch, sync status, and errors or warnings for the open file. |
| **Command Palette** | Pops up on demand | Search for any command by name. |

### Shortcuts worth learning first

| Action                              | Shortcut |
| ----------------------------------- | -------- |
| Command Palette (run any command)   | `⇧⌘P`    |
| Quick Open (jump to a file by name) | `⌘P`     |
| Show or hide the Side Bar           | `⌘B`     |
| Open the Source Control view        | `⌃⇧G`    |
| Show or hide the terminal panel     | `` ⌃` `` |
| Split the editor                    | `⌘\`     |
| Open Extensions view                | `⇧⌘X`    |
| Open Settings                       | `⌘,`     |
| Preview a Markdown file             | `⇧⌘V`    |

If you forget a shortcut, open the Command Palette and type what you want to do. The shortcut is listed beside each command.

## Opening a project

1. Choose **File → Open Folder…** and pick your project folder. In Git terms, a project is a _repository_ (repo).
2. Or, to copy a project from GitHub, open the Command Palette and run **Git: Clone**, then paste the repo URL.
3. If VS Code asks whether you trust the authors of the folder, choose **Yes, I trust the authors** only for projects you made or got from someone you know. Otherwise choose **No, I don't trust the authors**. VS Code then opens the folder in _Restricted Mode_, which turns off the terminal, extensions (including Claude Code), and other features that could run code.

**Check:** the Explorer (top icon in the Activity Bar) shows the project's files, and the Status Bar shows a branch name such as `main`.

## Git in VS Code

Git records snapshots of your work, called _commits_, so you can see what changed, go back, and work on ideas without disturbing the main version. For command-line equivalents, see the [git quick reference](../../cli/git.md).

### The Source Control view

Click the branch-shaped icon in the Activity Bar, or press `⌃⇧G`. It shows:

- **Changes**: files you've edited since the last commit. Click one to see a side-by-side diff, with old on the left and new on the right.
- **Staged Changes**: files you've marked for the next commit.
- **Message box**: where you describe the commit.
- **Commit button**: saves the snapshot. Its dropdown also offers **Commit & Push**.
- **Branch name** in the Status Bar: click it to switch or create branches.

Letters beside a file tell you its state: `M` modified, `U` untracked (new), `D` deleted.

## A basic save-and-share loop

This loop takes one change from idea to a pull request. Use it for every change, whether you make it or Claude does.

### 1. Create a branch

Click the branch name in the Status Bar and choose **Create new branch…**. Give it a short name such as `checkout-button-states`. Branches keep experiments away from `main`.

**Check:** the Status Bar shows your new branch name.

### 2. Make changes

Edit your files, or ask Claude to (see [Claude Code in VS Code](#claude-code-in-vs-code)). Save each file (`⌘S`).

**Check:** the files you changed appear under **Changes** in Source Control, with an `M` or `U` beside them.

### 3. Review the changes

Click each file in Source Control. The diff shows exactly what changed, whoever made the change. If Claude made the edits, also work through [Reviewing AI output](#reviewing-ai-output).

**Check:** you can explain every highlighted line. Discard anything you don't want to keep (see [When things go wrong](#when-things-go-wrong)).

### 4. Stage and commit

1. Stage files by clicking the **+** next to them.
2. Write a message that says what and why, such as "Update button states in checkout flow".
3. Click **Commit**.

**Check:** the **Changes** list is empty, or holds only files you chose to leave out.

### 5. Publish or sync

The first time, click **Publish Branch** to send the branch to GitHub. After that, click **Sync Changes**.

**Check:** the sync icon in the Status Bar shows no arrows with numbers, which means nothing is waiting to go up or come down.

### 6. Open a pull request

Open the repo on github.com. GitHub usually shows a banner offering to compare your recently pushed branch and open a pull request. Describe the change and ask a teammate to review it.

**Check:** the pull request page lists your commits and the files you expected, and nothing else.

## GitHub in VS Code

Git tracks changes on your machine. GitHub is where the repo lives online, so others can see, review, and build on your work.

- **Sign in:** run **Git: Clone** or **Publish Branch** and VS Code prompts you to sign in to GitHub in the browser. Or use the **Accounts** icon near the bottom of the Activity Bar.
- **Terminal option:** this kit also installs the GitHub CLI. Run `gh auth login` once in the terminal panel (`` ⌃` ``). See the [gh quick reference](../../cli/gh.md).
- **Pull requests:** after publishing a branch, open a pull request on github.com so teammates can review it. The optional _GitHub Pull Requests_ extension, searchable in the Extensions view, lets you review them inside VS Code.
- **GitHub Desktop** is also installed by this kit if you prefer a separate app for Git. It works on the same repos. See the [GitHub Desktop guide](../github-desktop/README.md).

## Claude Code in VS Code

Claude Code is an AI assistant that can read your project, explain it, and edit files. The VS Code extension gives it a graphical panel instead of a command line. Claude drafts and explains. You decide what stays.

### Install the extension

Requirements: VS Code 1.94.0 or later, and a paid Claude subscription (Pro, Max, Team, or Enterprise) or a Claude Console account.

1. Open the Extensions view (`⇧⌘X`).
2. Search for **Claude Code** and click **Install**.
3. If it doesn't appear, run **Developer: Reload Window** from the Command Palette.
4. Sign in with your Anthropic account when prompted.

**Check:** a Spark icon appears in the Activity Bar. For a guided tour, run **Claude Code: Open Walkthrough** from the Command Palette.

### Open Claude

- Click the **Spark icon** in the top-right of the editor. It only shows while a file is open.
- Or click the Spark icon in the **Activity Bar** to see your sessions list.
- Or open the Command Palette and type "Claude Code".

### Give Claude context

- **Select text** in a file. Claude sees your selection automatically.
- **Press `⌥K`** to add an @-mention of the file and selected lines to your prompt, such as `@checkout.css#5-10`.
- **Type `@`** and a file or folder name to point Claude at it. Partial names work. Add a trailing slash for folders, such as `@components/`.

Good prompts say what you want and where: "Explain what `@tokens.json` controls," or "Make the spacing in `@card.css` consistent with an 8px scale." A fuller brief gets a better result, the same as with a colleague:

```text
In @card.css, make all padding and margin values fit an 8px spacing scale (8, 16, 24, 32). Don't change colors, fonts, or layout. List each value you changed, with the old and new value, so I can check them.
```

- **Give it:** the file, the scale or rule to follow, and what's off limits.
- **A good response:** a short plan or a set of edits, plus a list of old and new values you can compare against the diff.

### Review before you accept

- **Permission modes:** the mode indicator at the bottom of the prompt box shows how much Claude can do on its own. Click it to switch. In recent versions, new conversations start in **Auto**, where Claude edits most files without asking. **Manual** asks before each file edit. Mode names and defaults change between versions, so check [permission modes](https://code.claude.com/docs/en/permission-modes) if yours look different.
- **Plan mode:** Claude describes what it will do and waits for your approval. The plan opens as a document where you can leave inline comments. Switch modes with the indicator at the bottom of the prompt box, or type `/plan`. Start here when you're unsure.
- **Diffs:** in **Manual** mode, proposed edits appear as side-by-side diffs that you can accept or reject, one change at a time with **Accept this change** and **Reject this change**, or as a whole file.
- **Then use Git.** After Claude makes changes, open Source Control and review them like any other edit. Commit what you keep. Git is your undo button.

### Claude shortcuts

| Action                                         | Shortcut |
| ---------------------------------------------- | -------- |
| Toggle focus between editor and Claude         | `⌘Esc`   |
| Open a new conversation as an editor tab       | `⇧⌘Esc`  |
| Insert @-mention of current file and selection | `⌥K`     |
| Reopen the last closed Claude tab              | `⇧⌘T`    |

If `⌘Esc` does nothing, see [When things go wrong](#when-things-go-wrong).

## Reviewing AI output

You own anything you keep. Before you commit, share, or build on Claude's work:

- **Read the diff, not the summary.** Claude's reply describes what it meant to do. The diff in Source Control shows what it did. In **Auto** mode, that diff is the only place you see every edit.
- **Check the scope.** Every changed file should be one you expected. If Claude touched files you didn't ask about, find out why before you keep them.
- **Compare with the source.** If Claude summarized research notes or a spec, every quote should appear in the original and every count should match.
- **Look for what's missing.** Models flatten outliers and minority voices into averages. Check that edge cases, error states, and less common user needs survived.
- **Watch for confident mistakes.** A fluent answer can still be wrong. Verify names, numbers, token values, and claims about how the product works.
- **Preview UI changes.** If the change affects what people see, open it in the browser or prototype and run the [Accessibility check](#accessibility-check).

## Protecting data

- **Keep people out of prompts.** Don't put participant names, emails, recordings, or other personal data in files you share with Claude or mention with `@`. Replace them with IDs such as `P1`, `P2` first.
- **Remember what Claude can read.** Claude can open any file in the folder you have open, not only the ones you mention. Keep sensitive material out of the project folder.
- **Keep confidential work out.** Unreleased strategy, client material, and anything under NDA stays out unless your organization's AI policy allows it. Anthropic explains how it handles your data in [Data and privacy](https://code.claude.com/docs/en/data-usage).
- **Don't commit secrets.** API keys, tokens, and `.env` files never go in a repo. This kit includes [gitleaks](../../cli/gitleaks.md) to help catch them.
- **Check visibility.** Publishing a branch sends it to GitHub. Anyone who can see the repo can see your commits, so check whether the repo is public or private before you publish.
- **Follow your organization's AI policy.** When it and this guide disagree, the policy wins.

## Accessibility check

When your change affects what people see or hear (copy, colors, spacing, components), check before you share it:

- [ ] Text and interactive elements meet contrast requirements (WCAG 2.2 AA: 4.5:1 for body text).
- [ ] Every meaningful image has alt text, and decorative images are marked as decorative.
- [ ] You can reach and use every control with the keyboard alone.
- [ ] A screen reader (VoiceOver on macOS: `⌘F5`) announces labels, states, and errors in a sensible order.
- [ ] Copy is plain, and error messages say what happened and how to fix it.

## When things go wrong

| Situation | What to do |
| --- | --- |
| You edited a file and want the old version back | In Source Control, hover over the file and click **Discard Changes**. This throws away every uncommitted edit to that file, so be sure first. |
| Claude changed more than you asked | Hover over a message in the Claude panel, click the rewind button, and choose **Rewind code to here**. Or discard the unwanted files in Source Control. |
| You committed too soon, and haven't published yet | Run **Git: Undo Last Commit** from the Command Palette. Your changes come back, ready to edit and commit again. |
| The Spark icon is missing | Open a file (the editor icon only shows then), check that VS Code is 1.94.0 or later, and run **Developer: Reload Window**. If the folder is in Restricted Mode, run **Manage Workspace Trust** from the Command Palette. |
| `⌘Esc` does nothing | macOS may be using it for Game Overlay. Open **System Settings → Keyboard → Keyboard Shortcuts → Game Controllers** and clear **Game Overlay**. |
| Sync fails, or VS Code mentions a conflict | Stop, and ask Claude to explain the message, or ask a teammate, before you push, force anything, or delete a branch. |

## A typical session

1. Open your project folder.
2. Click **Sync Changes** to get up to date, then create a branch from the Status Bar.
3. Open Claude, select a few lines, press `⌥K`, and ask for a change. Start in plan mode if you're unsure.
4. Review the plan and diffs.
5. Open Source Control, read the changes, stage, write a message, and commit.
6. Click **Publish Branch** or **Sync Changes**.
7. Open a pull request on GitHub.

## Tips and gotchas

- **Commit before a big request.** A commit right before you ask Claude for a large change gives you a clean point to return to.
- **Commit often.** Small commits are easy to review and easy to undo.
- **Don't commit secrets.** Keep passwords, API keys, and tokens out of files in the repo. This kit installs [gitleaks](../../cli/gitleaks.md) to help catch them.
- **Claude can be wrong.** Read the diff before you commit, the same as you would a colleague's work.
- **Stuck in a strange state?** Open the Command Palette and search for the **Git:** commands, or ask Claude what a message means.
- **Explore later.** The [VS Code docs](https://code.visualstudio.com/docs) have sections on Source Control, the Terminal, and the Editor for when you want more depth.

## Next steps

- [GitHub Desktop guide](../github-desktop/README.md): the same Git loop in a separate app, with a clear view of history
- [git quick reference](../../cli/git.md): the same tasks as terminal commands
- [CLI reference](../../cli/README.md): the other terminal tools this kit installs, including [herdr](../../cli/herdr.md) for running several Claude Code sessions at once
- [Claude Code in VS Code](https://code.claude.com/docs/en/vs-code): every extension feature and setting, in depth
