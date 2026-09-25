# herdr

Herdr is a terminal workspace manager for AI coding agents. It runs a persistent session of workspaces, tabs, and panes (like tmux), recognizes coding agents running in those panes, and tracks whether each agent is working, blocked, or done. Its CLI can split panes, start agents, send them prompts, and read their output.

Most control commands return JSON and must be run from inside a Herdr pane. Run `herdr <group>` (for example `herdr pane`) to see a group's subcommands.

## Contents

- [Daily and weekly](#daily-and-weekly)
- [Common commands](#common-commands)
  - [Sessions](#sessions)
  - [Workspaces and tabs](#workspaces-and-tabs)
  - [Git worktrees](#git-worktrees)
  - [Panes](#panes)
  - [Agents](#agents)
  - [Remote machines](#remote-machines)
  - [Config, integrations, and updates](#config-integrations-and-updates)

## Daily and weekly

```sh
herdr                           # Launch or reattach to your persistent session
herdr --session <name>          # Open or create a named session
herdr status                    # Show client and server status
herdr agent list                # List agents and their current states
herdr workspace list            # List workspaces in the session
herdr session list              # List named sessions
herdr update                    # Install the latest herdr version
```

## Common commands

### Sessions

```sh
herdr session list              # List named sessions
herdr session attach <name>     # Attach to a named session
herdr session stop <name>       # Stop a session and its processes
herdr session delete <name>     # Delete a stopped session
```

### Workspaces and tabs

```sh
herdr workspace list            # List workspaces
herdr workspace create          # Create a new workspace
herdr workspace focus <id>      # Switch to a workspace
herdr workspace rename <id> <name>  # Rename a workspace
herdr workspace close <id>      # Close a workspace
herdr tab list --workspace <id> # List tabs in a workspace
herdr tab create                # Create a new tab
herdr tab focus <id>            # Switch to a tab
herdr tab close <id>            # Close a tab
```

### Git worktrees

```sh
herdr worktree list             # List worktree-backed workspaces
herdr worktree create           # Create a git worktree workspace
herdr worktree open             # Open an existing git worktree
herdr worktree remove           # Remove a worktree checkout
```

Run `herdr worktree` to see the arguments each takes.

### Panes

```sh
herdr pane list --workspace <id>  # List panes in a workspace
herdr pane current --current    # Show the pane you're in
herdr pane split --current --direction right --no-focus  # Split right, keep focus
herdr pane split --current --direction down  # Split the current pane downward
herdr pane run <pane> "<cmd>"   # Run a command in a pane
herdr pane read <pane> --lines 100  # Read a pane's recent output
herdr pane wait-output <pane> --match "<text>"  # Wait until output contains text
herdr pane send-keys <pane> ctrl+c  # Send key presses to a pane
herdr pane zoom <pane>          # Toggle a pane's full-size zoom
herdr pane close <pane>         # Close a pane
```

### Agents

```sh
herdr agent list                # List agents and their states
herdr agent start <name> --kind <kind> --pane <pane>  # Start an agent in a shell pane
herdr agent prompt <name> "<text>" --wait  # Send a prompt, wait for finish
herdr agent wait <name> --until blocked  # Wait until an agent needs input
herdr agent read <name> --lines 120  # Read an agent's recent output
herdr agent get <name>          # Show an agent's details and state
herdr agent send-keys <name> esc  # Send key presses to an agent
herdr agent focus <name>        # Jump to an agent's pane
herdr agent attach <name>       # Attach directly to an agent terminal
```

### Remote machines

```sh
herdr machine list              # List saved SSH machines
herdr machine add               # Set up and save an SSH machine
herdr --remote <ssh-target>     # Attach to a remote herdr server
herdr --machine <label> agent list  # Run a command on a saved machine
```

### Config, integrations, and updates

```sh
herdr config check              # Validate config.toml and show problems
herdr config reset-keys         # Back up config, remove custom keybindings
herdr server reload-config      # Apply config changes without restarting
herdr --default-config          # Print the default configuration
herdr integration status        # Show built-in agent integration status
herdr integration install       # Install an agent integration
herdr channel show              # Show the current update channel
herdr channel set preview       # Switch to preview releases
herdr server stop               # Stop the server and all pane processes
```

Config lives at `~/.config/herdr/config.toml`; logs sit alongside it.
