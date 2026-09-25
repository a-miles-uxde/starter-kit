# gh (GitHub CLI)

`gh` is GitHub's official command-line tool. It brings pull requests, issues, repositories, Actions runs, and releases into the terminal, so you can work with GitHub without switching to the browser. It complements `git`: git handles your files and history, gh handles everything on GitHub.

## Contents

- [Daily and weekly](#daily-and-weekly)
- [Common commands](#common-commands)
  - [Authentication](#authentication)
  - [Repositories](#repositories)
  - [Pull requests](#pull-requests)
  - [Issues](#issues)
  - [Actions](#actions)
  - [Releases](#releases)
  - [Gists](#gists)
  - [Search, browse, and API](#search-browse-and-api)

## Daily and weekly

```sh
gh status                       # Summarize your PRs, issues, and mentions
gh pr create --fill             # Open a PR using commit info
gh pr list                      # List open pull requests in this repo
gh pr checkout <number>         # Check out a PR's branch locally
gh pr view --web                # Open the current branch's PR in browser
gh pr checks                    # Show CI status for the current PR
gh pr merge --squash --delete-branch  # Squash-merge the PR and delete its branch
gh issue list --assignee @me    # List issues assigned to you
gh run watch                    # Follow a workflow run live
gh browse                       # Open the current repo on GitHub
```

## Common commands

### Authentication

```sh
gh auth login                   # Sign in to GitHub
gh auth status                  # Show which account you're signed into
gh auth setup-git               # Use gh for git credentials
gh auth refresh -s <scope>      # Add a permission scope to your login
gh auth logout                  # Sign out of GitHub
```

### Repositories

```sh
gh repo create <name> --public  # Create a new public repository
gh repo create --source=. --push  # Publish the current folder as a repo
gh repo clone <owner/repo>      # Clone a repo by owner and name
gh repo fork <owner/repo>       # Fork a repo to your account
gh repo view                    # Show the current repo's README and info
gh repo list                    # List your repositories
gh repo edit --description "…"  # Change repo settings like description
gh repo sync                    # Update your fork from its parent
```

### Pull requests

```sh
gh pr create                    # Create a PR interactively
gh pr create --draft            # Create a draft PR
gh pr view <number>             # Show a PR's details
gh pr diff <number>             # Show a PR's changes
gh pr status                    # Show PRs relevant to you
gh pr review --approve          # Approve the current PR
gh pr review --request-changes -b "…"  # Request changes with a comment
gh pr comment -b "…"            # Add a comment to the PR
gh pr ready                     # Mark a draft PR ready for review
gh pr edit --add-reviewer <user>  # Request a review from someone
gh pr close <number>            # Close a PR without merging
```

### Issues

```sh
gh issue create                 # Create an issue interactively
gh issue list                   # List open issues
gh issue view <number>          # Show an issue's details
gh issue comment <number> -b "…"  # Comment on an issue
gh issue edit <number> --add-label bug  # Add a label to an issue
gh issue close <number>         # Close an issue
gh issue develop <number> -c    # Create a branch linked to an issue
```

### Actions

```sh
gh run list                     # List recent workflow runs
gh run view <id>                # Show a run's jobs and status
gh run view <id> --log-failed   # Show logs from failed steps only
gh run rerun <id> --failed      # Rerun only the failed jobs
gh workflow list                # List the repo's workflows
gh workflow run <workflow>      # Trigger a workflow manually
```

### Releases

```sh
gh release list                 # List releases
gh release create v1.0 --generate-notes  # Publish a release with auto-notes
gh release view <tag>           # Show a release's details
gh release download <tag>       # Download a release's assets
```

### Gists

```sh
gh gist create <file>           # Share a file as a secret gist
gh gist create --public <file>  # Share a file as a public gist
gh gist list                    # List your gists
```

### Search, browse, and API

```sh
gh search repos <query>         # Search GitHub repositories
gh search issues <query>        # Search issues across GitHub
gh browse <file>                # Open a file on GitHub
gh api user                     # Call the GitHub API directly
gh extension list               # List installed gh extensions
```
