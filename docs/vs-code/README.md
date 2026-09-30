# VS Code for UX designers

A guide to the Visual Studio Code interface for designers who are getting started with Git, GitHub, and Claude Code. You don't need to be a developer. VS Code is a workspace where you can open a project, see what changed, save versions of your work, and ask Claude for help, all in one window.

Shortcuts below are for macOS. On Windows and Linux, swap `⌘` for `Ctrl`.

## Contents

- [Official links](#official-links)
- [Why VS Code](#why-vs-code)
- [Tour of the interface](#tour-of-the-interface)
  - [Shortcuts worth learning first](#shortcuts-worth-learning-first)
- [Opening a project](#opening-a-project)
- [Git in VS Code](#git-in-vs-code)
  - [The Source Control view](#the-source-control-view)
  - [A basic save-and-share loop](#a-basic-save-and-share-loop)
- [GitHub in VS Code](#github-in-vs-code)
- [Claude Code in VS Code](#claude-code-in-vs-code)
  - [Install the extension](#install-the-extension)
  - [Open Claude](#open-claude)
  - [Give Claude context](#give-claude-context)
  - [Review before you accept](#review-before-you-accept)
  - [Claude shortcuts](#claude-shortcuts)
- [A typical session](#a-typical-session)
- [Tips and gotchas](#tips-and-gotchas)

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

| Action | Shortcut |
| --- | --- |
| Command Palette (run any command) | `⇧⌘P` |
| Quick Open (jump to a file by name) | `⌘P` |
| Show or hide the Side Bar | `⌘B` |
| Split the editor | `⌘\` |
| Open Extensions view | `⇧⌘X` |
| Open Settings | `⌘,` |

If you forget a shortcut, open the Command Palette and type what you want to do.

## Opening a project

1. Choose **File > Open Folder…** and pick your project folder. In Git terms, a project is a *repository* (repo).
2. Or, to copy a project from GitHub, open the Command Palette and run **Git: Clone**, then paste the repo URL.
3. If VS Code asks whether you trust the authors of the folder, choose **Yes** only for projects you made or got from someone you know.

The Explorer (top icon in the Activity Bar) now shows the project's files.

## Git in VS Code

Git records snapshots of your work, called *commits*, so you can see what changed, go back, and work on ideas without disturbing the main version. For command-line equivalents, see the [git quick reference](../../cli/git.md).

### The Source Control view

Click the branch-shaped icon in the Activity Bar, or press `⌃⇧G`. It shows:

- **Changes**: files you've edited since the last commit. Click one to see a side-by-side diff, with old on the left and new on the right.
- **Staged Changes**: files you've marked for the next commit.
- **Message box**: where you describe the commit.
- **Commit button**: saves the snapshot. Its dropdown also offers **Commit & Push**.
- **Branch name** in the Status Bar: click it to switch or create branches.

Letters beside a file tell you its state: `M` modified, `U` untracked (new), `D` deleted.

### A basic save-and-share loop

1. **Create a branch** before you start. Click the branch name in the Status Bar and choose **Create new branch…**. Branches keep experiments away from `main`.
2. **Make changes** in your files.
3. **Review** each file in Source Control. The diff shows exactly what you changed.
4. **Stage** files by clicking the **+** next to them.
5. **Write a message** that says what and why, such as "Update button states in checkout flow".
6. **Commit**.
7. **Publish or sync.** The first time, click **Publish Branch** to send it to GitHub. After that, click **Sync Changes**.

## GitHub in VS Code

Git tracks changes on your machine. GitHub is where the repo lives online, so others can see, review, and build on your work.

- **Sign in:** run **Git: Clone** or **Publish Branch** and VS Code prompts you to sign in to GitHub in the browser. Or use the **Accounts** icon near the bottom of the Activity Bar.
- **Terminal option:** this kit also installs the GitHub CLI. Run `gh auth login` once in the terminal panel (`` ⌃` ``). See the [gh quick reference](../../cli/gh.md).
- **Pull requests:** after publishing a branch, open a pull request on github.com so teammates can review it. The optional *GitHub Pull Requests* extension, searchable in the Extensions view, lets you review them inside VS Code.
- **GitHub Desktop** is also installed by this kit if you prefer a separate app for Git. It works on the same repos.

## Claude Code in VS Code

Claude Code is an AI assistant that can read your project, explain it, and edit files. The VS Code extension gives it a graphical panel instead of a command line.

### Install the extension

Requirements: VS Code 1.94.0 or later, and a paid Claude subscription (Pro, Max, Team, or Enterprise) or a Claude Console account.

1. Open the Extensions view (`⇧⌘X`).
2. Search for **Claude Code** and click **Install**.
3. If it doesn't appear, run **Developer: Reload Window** from the Command Palette.
4. Sign in with your Anthropic account when prompted.

### Open Claude

- Click the **Spark icon** in the top-right of the editor. It only shows while a file is open.
- Or click the Spark icon in the **Activity Bar** to see your sessions list.
- Or open the Command Palette and type "Claude Code".

### Give Claude context

- **Select text** in a file. Claude sees your selection automatically.
- **Press `⌥K`** to add an @-mention of the file and selected lines to your prompt, such as `@checkout.css#5-10`.
- **Type `@`** and a file or folder name to point Claude at it. Partial names work.

Good prompts say what you want and where: "Explain what `@tokens.json` controls," or "Make the spacing in `@card.css` consistent with an 8px scale."

### Review before you accept

- **Plan mode:** Claude describes what it will do and waits for your approval. The plan opens as a document where you can leave inline comments. Switch modes with the indicator at the bottom of the prompt box, or type `/plan`.
- **Diffs:** proposed edits appear as side-by-side diffs that you can accept or reject.
- **Then use Git.** After Claude makes changes, open Source Control and review them like any other edit. Commit what you keep. Git is your undo button.

### Claude shortcuts

| Action | Shortcut |
| --- | --- |
| Toggle focus between editor and Claude | `⌘Esc` |
| Open a new conversation as an editor tab | `⇧⌘Esc` |
| Insert @-mention of current file and selection | `⌥K` |
| Reopen the last closed Claude tab | `⇧⌘T` |

## A typical session

1. Open your project folder.
2. Create a branch from the Status Bar.
3. Open Claude, select a few lines, press `⌥K`, and ask for a change. Start in plan mode if you're unsure.
4. Review the plan and diffs.
5. Open Source Control, read the changes, stage, write a message, and commit.
6. Click **Publish Branch** or **Sync Changes**.
7. Open a pull request on GitHub.

## Tips and gotchas

- **Commit often.** Small commits are easy to review and easy to undo.
- **Don't commit secrets.** Keep passwords, API keys, and tokens out of files in the repo. This kit installs [gitleaks](../../cli/gitleaks.md) to help catch them.
- **Claude can be wrong.** Read the diff before you commit, the same as you would a colleague's work.
- **Stuck in a strange state?** Open the Command Palette and search for the **Git:** commands, or ask Claude what a message means.
- **Explore later.** The [VS Code docs](https://code.visualstudio.com/docs) have sections on Source Control, the Terminal, and the Editor for when you want more depth.
