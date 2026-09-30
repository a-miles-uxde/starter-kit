# herdr

Herdr is a terminal workspace manager for AI coding agents. It organizes terminals into workspaces, tabs, and panes inside a persistent session, recognizes coding agents running in those panes, and shows whether each one is working, idle, or waiting on you. Because the session persists, you can close the window and reattach later with everything still running.

Run `herdr` with no arguments to launch or attach to the session. Every other command below talks to a running session and returns JSON.

## Contents

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

## Daily and weekly

```sh
herdr                           # Launch or attach to the persistent session
herdr --session <name>          # Use or create a named session
herdr status                    # Show local client and server status
herdr agent list                # List the agents Herdr can see
herdr pane list                 # List panes in the current session
herdr update                    # Download and install the latest version
```

## Common commands

### Sessions and status

```sh
herdr status server             # Show only the running server's status
herdr session list              # List named sessions
herdr session attach <name>     # Attach to a named session
herdr session stop <name>       # Stop a session
herdr session delete <name>     # Delete a stopped session
herdr --version                 # Show the installed version
```

### Workspaces and tabs

A workspace holds tabs, and a tab holds panes. IDs look like `w1` (workspace), `w1:t1` (tab), and `w1:p1` (pane).

```sh
herdr workspace list            # List workspaces
herdr workspace create          # Create a workspace
herdr workspace get <id>        # Show one workspace
herdr workspace focus <id>      # Switch to a workspace
herdr workspace rename <id> <name>  # Rename a workspace
herdr workspace close <id>      # Close a workspace
herdr tab list                  # List tabs
herdr tab create                # Create a tab
herdr tab focus <id>            # Switch to a tab
herdr tab rename <id> <name>    # Rename a tab
herdr tab close <id>            # Close a tab
```

### Panes

```sh
herdr pane list                 # List panes
herdr pane current --current    # Show the pane you're typing in
herdr pane get <id>             # Show one pane
herdr pane split --current --direction right  # Split the current pane to the right
herdr pane split --current --direction down --no-focus  # Split down, keep focus here
herdr pane focus <id>           # Focus a pane
herdr pane zoom <id>            # Toggle a pane full-screen
herdr pane rename <id> <name>   # Rename a pane
herdr pane close <id>           # Close a pane
```

### Running commands in panes

```sh
herdr pane run <id> "npm test"  # Type a command into a pane and press Enter
herdr pane send-text <id> "hello"  # Type text without pressing Enter
herdr pane send-keys <id> ctrl+c  # Send a key press, such as ctrl+c or esc
herdr pane read <id> --source recent-unwrapped --lines 120  # Read recent output
herdr pane wait-output <id> --match "passed" --timeout 120000  # Wait for text to appear
```

`--source` can be `visible`, `recent`, `recent-unwrapped`, or `detection`. Timeouts are in milliseconds.

### Agents

Agent commands take an agent's name or the ID of the pane it's running in.

```sh
herdr agent list                # List agents and their state
herdr agent get <name>          # Show one agent
herdr agent start <name> --kind <kind> --pane <id>  # Start an agent in an open shell pane
herdr agent prompt <name> "<text>" --wait --timeout 120000  # Send a prompt and wait for it to settle
herdr agent wait <name> --timeout 120000  # Wait until the agent is idle, done, or blocked
herdr agent read <name> --lines 120  # Read the agent's recent output
herdr agent send-keys <name> esc  # Send a key press to the agent
herdr agent rename <name> <new-name>  # Rename an agent
herdr agent focus <name>        # Jump to the agent's pane
herdr agent attach <name>       # Attach directly to the agent's terminal
```

Agent states are `idle`, `working`, `blocked` (waiting on an approval or question), `done`, and `unknown`. Names are lowercase letters, digits, `_` or `-`, up to 32 characters.

### Git worktrees

```sh
herdr worktree list             # List worktree workspaces
herdr worktree create           # Create and open a new Git worktree
herdr worktree open             # Open an existing worktree
herdr worktree remove           # Remove a worktree checkout
```

### Integrations and notifications

```sh
herdr integration status        # Show which agent integrations are installed
herdr integration install <name>  # Install an agent integration
herdr integration uninstall <name>  # Remove an agent integration
herdr notification show         # Show a notification in Herdr
```

### Remote machines

```sh
herdr machine list              # List saved SSH machines
herdr machine add               # Set up and save a remote machine
herdr --machine <label> agent list  # Run a command on a saved machine
herdr --remote <ssh-target>     # Attach to a remote Herdr server over SSH
herdr machine disable <label>   # Stop using a saved machine
herdr machine remove <label>    # Forget a saved machine
```

### Config and updates

```sh
herdr config check              # Validate config.toml and show problems
herdr server reload-config      # Apply config changes to the running server
herdr config reset-keys         # Back up config.toml and remove custom keybindings
herdr --default-config          # Print the default configuration
herdr completion zsh            # Generate zsh shell completions
herdr channel set preview       # Switch to the preview update channel (or stable)
herdr update                    # Install the latest version
herdr server stop               # Stop the server and every pane process in it
```
