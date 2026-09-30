# herdr

Herdr is a terminal workspace manager for AI coding agents. It organizes terminals into workspaces, tabs, and panes inside a persistent session, recognizes coding agents such as Claude Code running in those panes, and shows whether each one is working, idle, or waiting on you. Because the session keeps running in the background, you can close the window and come back later with every agent still going, which helps when you run one agent on a prototype while another drafts copy. Run `herdr` with no arguments to open the session, or reattach to it if it's already running. Most other commands below talk to that running session and reply in JSON, a structured text format that's easy for scripts and Claude to read.

_Last verified: September 2026 with herdr 0.9.1 (`herdr --version`) on macOS 27._

If a command below fails, check `herdr --help` first: flags change between versions. To see every option for a command group, run the group on its own, such as `herdr pane` or `herdr agent`. Commands that close, stop, or remove things act right away with no confirmation prompt, and stopping a session ends every agent in it. Those lines are marked **Careful** below.

## Contents

- [Official links](#official-links)
- [Before you start](#before-you-start)
- [Daily and weekly](#daily-and-weekly)
- [Common commands](#common-commands)
  - [Sessions and status](#sessions-and-status)
  - [Workspaces and tabs](#workspaces-and-tabs)
  - [Panes](#panes)
  - [Running commands in panes](#running-commands-in-panes)
  - [Agents](#agents)
  - [Git worktrees](#git-worktrees)
  - [Integrations and notifications](#integrations-and-notifications)
  - [Remote machines](#remote-machines)
  - [Config and updates](#config-and-updates)
- [When things go wrong](#when-things-go-wrong)
- [Using herdr with Claude Code](#using-herdr-with-claude-code)
- [Related](#related)

## Official links

- [Herdr website](https://herdr.dev): what Herdr is, with install options and a feature overview
- [Herdr documentation](https://herdr.dev/docs/): quick start, concepts, configuration, and agent setup
- [CLI reference](https://herdr.dev/docs/cli-reference/): every command and flag, with notes on what each one changes
- [Troubleshooting](https://herdr.dev/docs/troubleshooting/): fixes for common session, keyboard, and update problems
- [Herdr on GitHub](https://github.com/herdrdev/herdr): source code, issue tracker, and [release notes](https://github.com/herdrdev/herdr/releases)

## Before you start

This kit installs herdr through the [`Brewfile`](../Brewfile). To check it's ready:

```sh
herdr --version                 # Confirm it's installed and show the version
```

- Words in angle brackets, like `<name>`, are blanks to fill in. Replace the whole thing, brackets included: `herdr agent focus <name>` becomes `herdr agent focus reviewer`.
- A comment that starts with **Careful** marks a command that changes or deletes things in a way that's hard to undo. Read the note under its block before you run it.

A few terms come up throughout. A **workspace** is a project container, usually one per repo or task. A **tab** is a layout inside a workspace, such as one for agents and one for a preview server. A **pane** is one terminal inside a tab. IDs look like `w1` (workspace), `w1:t1` (tab), and `w1:p1` (pane). Read them from `list` output rather than guessing: closed IDs are never reused.

Inside the Herdr window, the prefix key is `Ctrl-B`. Press `Ctrl-B`, then `Q` to detach: the window closes but the session and every agent keep running. Run `herdr` again to come back.

## Daily and weekly

```sh
herdr                           # Open the session, or reattach if it's running
herdr --session <name>          # Open or create a separate named session
herdr status                    # Check the app and background server are running
herdr session list              # List sessions and whether each is running
herdr agent list                # List agents and whether each needs you
herdr agent focus <name>        # Jump to an agent's pane
herdr agent read <name> --lines 120  # Read an agent's recent output
herdr pane list                 # List panes in the current session
```

## Common commands

### Sessions and status

A session is one persistent set of workspaces. You get a session called `default` without naming one. Named sessions keep separate projects apart, for example `herdr --session client-portal`.

```sh
herdr status server             # Show only the background server's status
herdr status client             # Show only this app's version and channel
herdr session attach <name>     # Reattach to a named session
herdr session stop <name>       # Careful: stops the session and everything in it
herdr session delete <name>     # Careful: deletes a stopped session
```

`session stop` ends every agent and command running in that session. Use `default` as the name to stop the default session. Save or commit agent work first, and prefer detaching (`Ctrl-B`, then `Q`) when you only want to step away. `session delete` only works on a stopped session, and there's no undo. Run `herdr session list` first to check the name and status.

### Workspaces and tabs

New workspaces and tabs open in the background by default. Add `--focus` to switch to them.

```sh
herdr workspace list            # List workspaces with their IDs
herdr workspace create --label "Onboarding flow"  # Create a named workspace
herdr workspace focus <id>      # Switch to a workspace
herdr workspace rename <id> <label>  # Rename a workspace
herdr workspace close <id>      # Careful: closes the workspace and its terminals
herdr tab list                  # List tabs in the current workspace
herdr tab create --label "Preview"  # Add a tab to the current workspace
herdr tab focus <id>            # Switch to a tab
herdr tab rename <id> <label>   # Rename a tab
herdr tab close <id>            # Careful: closes the tab and its terminals
```

Closing a workspace or tab removes it and its panes from Herdr right away, with no confirmation from the command line. It doesn't delete your project files or a worktree's folder. Closing a workspace's last tab closes the workspace too. Treat closing as the end of anything running in those panes: save or commit agent work first.

### Panes

`--current` means the pane you're typing in. It only works when you run the command inside a Herdr pane.

```sh
herdr pane current --current    # Show the pane you're typing in
herdr pane get <id>             # Show one pane's details
herdr pane split --current --direction right  # Split the current pane to the right
herdr pane split --current --direction down --no-focus  # Split down, keep focus here
herdr pane focus --direction left  # Move focus to the pane on the left
herdr pane zoom <id>            # Toggle a pane full screen and back
herdr pane rename <id> <label>  # Rename a pane
herdr pane close <id>           # Careful: closes the pane and stops what runs in it
```

`--direction` takes `left`, `right`, `up`, or `down` for focus, and `right` or `down` for split. Before you close a pane that holds an agent, check with `herdr agent list` that it isn't `working`.

### Running commands in panes

These type into a pane as if you were at the keyboard. Timeouts are in milliseconds, so `120000` is two minutes.

```sh
herdr pane run <id> "npm test"  # Type a command into a pane and press Enter
herdr pane send-text <id> "hello"  # Type text without pressing Enter
herdr pane send-keys <id> ctrl+c  # Send a key press, such as ctrl+c or esc
herdr pane read <id> --source recent-unwrapped --lines 120  # Read recent output
herdr pane wait-output <id> --match "passed" --timeout 120000  # Wait for text to appear
```

`--source` can be `visible` (what's on screen now), `recent` (recent output), or `recent-unwrapped` (recent output with wrapped lines rejoined, best for logs).

### Agents

Agent commands take an agent's name or the ID of the pane it's running in. Names are lowercase letters, digits, `_`, or `-`, up to 32 characters, and must start with a letter.

```sh
herdr agent get <name>          # Show one agent and its state
herdr agent start <name> --kind claude --pane <id>  # Start Claude Code in an open shell pane
herdr agent prompt <name> "Summarize the diff" --wait --timeout 120000  # Send a prompt and wait
herdr agent wait <name> --timeout 120000  # Wait until the agent is idle, done, or blocked
herdr agent send-keys <name> esc  # Send a key press to the agent
herdr agent rename <name> <new-name>  # Rename an agent
herdr agent attach <name>       # Open the agent's terminal on its own
herdr agent explain <name>      # Explain why Herdr shows the state it does
```

Agent states are `idle` and `done` (ready for input), `working`, `blocked` (waiting on an approval or a question from you), and `unknown` (Herdr can't tell). `agent start` needs a pane that's sitting at an empty shell prompt. Run `herdr agent` to see every supported `--kind`, such as `claude`, `codex`, and `gemini`.

### Git worktrees

A worktree is a second working copy of the same Git project on a different branch, like duplicating a Figma page to explore an idea without touching the original. Herdr opens each worktree as its own workspace, so two agents can work on two branches at once. Run these from inside the project's workspace, or add `--cwd <path>`.

```sh
herdr worktree list             # List the project's worktrees
herdr worktree create --branch <branch>  # Create a worktree and open it as a workspace
herdr worktree open --branch <branch>  # Open an existing worktree
herdr worktree remove --workspace <id>  # Careful: deletes the worktree's folder
```

`worktree remove` deletes the worktree's checkout folder. It keeps the branch, so committed work is safe. Git refuses when there are uncommitted changes, and adding `--force` deletes them with no undo. Commit or push your work with git first.

### Integrations and notifications

Integrations are small hook files that let Herdr read an agent's state exactly, rather than guessing from the screen.

```sh
herdr integration status        # Show which agent integrations are installed
herdr integration install claude  # Install the Claude Code integration
herdr integration uninstall claude  # Remove the Claude Code integration
herdr notification show "Build finished"  # Show a notification in Herdr
```

Run `herdr integration` to see every agent you can install an integration for.

### Remote machines

Herdr can run agents on another computer you reach over SSH (a secure remote login). Each saved machine has a label and a profile ID. `machine list` shows both.

```sh
herdr machine list              # List saved SSH machines
herdr machine add <ssh-target> --label <label>  # Set up and save a remote machine
herdr --machine <label> agent list  # Run a command on a saved machine
herdr --remote <ssh-target>     # Attach to a remote Herdr session over SSH
herdr machine disable <profile-id>  # Stop using a saved machine for now
herdr machine enable <profile-id>  # Start using a disabled machine again
herdr machine remove <profile-id>  # Forget a saved machine
```

Disabling or removing a machine leaves its remote sessions running. `machine add` installs and starts Herdr on the remote machine and asks before replacing anything there.

### Config and updates

Herdr's settings live in `~/.config/herdr/config.toml`. Logs are in the same folder.

```sh
herdr config check              # Check config.toml for mistakes
herdr server reload-config      # Apply config changes to the running session
herdr --default-config          # Print every setting with its default
herdr completion zsh            # Print zsh tab-completion setup
herdr config reset-keys         # Careful: removes your custom keyboard shortcuts
brew upgrade herdr              # Update herdr now, instead of waiting for the daily update
herdr server stop               # Careful: stops the default session and all its agents
```

This kit updates herdr through Homebrew once a day, so don't use `herdr update` or `herdr channel set preview`: they're for Herdr's own installer and don't apply to Homebrew installs. After an update, the session that's already running keeps the old version until you restart it with `herdr server stop` and then `herdr`.

`config reset-keys` copies `config.toml` to a backup in the same folder before removing your shortcuts. The backup's name starts with `config.toml.bak-keybind-v2-` and ends in a number, and the command prints the exact `cp` line to restore it. `server stop` ends every agent and command in the default session, like `session stop`. Save or commit first.

## When things go wrong

| What you see | What it means | What to do |
| --- | --- | --- |
| `zsh: command not found: herdr` | herdr isn't installed, or Terminal was open before it was | Run `./setup.sh` from the kit folder, or `brew install herdr`, then open a new Terminal window |
| `{"error":{"code":"pane_not_found","message":"pane w99:p99 not found"},"id":"cli:pane:get"}` | The pane ID is wrong or the pane was closed. The same happens with `agent_not_found` for agent names. The `id` at the end names the command you ran, so it varies | Run `herdr pane list` or `herdr agent list` and copy the ID or name from the output |
| `herdr: Inappropriate ioctl for device (os error 25)` | Something tried to open the Herdr window without a real terminal, such as Claude running `herdr` for you | Run `herdr` yourself in Terminal. `session attach` creates the session if the name is new, so check `herdr session list` and stop and delete any you didn't mean to make |
| Agents or commands stopped after `session stop`, `server stop`, `session delete`, or closing a workspace, tab, or pane | Those commands end what was running, and there's no undo | Run `herdr` (or `herdr --session <name>`) to open the session again, then restart the agent. Files the agent saved are still on disk: check with `git status` |
| Files missing after `worktree remove --force` | The worktree's uncommitted changes were deleted | Anything committed is still on the branch: open it with `herdr worktree create --branch <branch>`. Uncommitted work can only come back from a backup such as Time Machine |
| Your custom shortcuts stopped working after `config reset-keys` | The command removed them from `config.toml` after saving a backup | Run the `To restore: cp ...` line the command printed, or copy the newest `config.toml.bak-keybind-v2-` file in `~/.config/herdr/` over `config.toml`. Then run `herdr server reload-config` |

## Using herdr with Claude Code

When Claude Code runs inside a Herdr pane, it can check on your other agents and report back, which saves switching between panes. Run `herdr integration install claude` first so Herdr reports Claude's state exactly.

```text
You're running inside Herdr. Run `herdr agent list`, then `herdr agent read <name> --lines 120` for any agent that is blocked or done. Tell me in plain language what each one is waiting on or finished. Don't send prompts or keys to any agent, and don't close anything.
```

Before you act on the result, run `herdr agent focus <name>` and read the agent's screen yourself. Claude's summary describes what it read, and it can miss a question or an error. Agent output can include file contents and anything the other agent saw, so don't paste it outside your team if a project holds research participants' details or client material.

## Related

- [CLI reference index](README.md): all the command references in this kit
