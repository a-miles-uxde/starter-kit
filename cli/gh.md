# gh (GitHub CLI)

`gh` is GitHub's official command-line tool. It brings pull requests, issues, repositories, Actions runs, and releases into the terminal, so you can open a PR for a copy change, check whether a prototype's build passed, or file a bug without switching to the browser. It complements git: git handles your files and history on your Mac, gh handles everything on GitHub. Run `gh` with no arguments to see a list of its commands.

_Last verified: September 2026 with gh 2.101.0 (`gh --version`) on macOS 27._ If a command below fails, check `gh --help` first: flags change between versions.

## Contents

- [Official links](#official-links)
- [Before you start](#before-you-start)
- [Daily and weekly](#daily-and-weekly)
- [Common commands](#common-commands)
  - [Signing in](#signing-in)
  - [Pull requests](#pull-requests)
  - [Issues](#issues)
  - [Repositories](#repositories)
  - [Checks and automation](#checks-and-automation)
  - [Releases](#releases)
  - [Sharing files as gists](#sharing-files-as-gists)
  - [Searching and browsing](#searching-and-browsing)
- [When things go wrong](#when-things-go-wrong)
- [Using gh with Claude Code](#using-gh-with-claude-code)
- [Related](#related)

## Official links

- [GitHub CLI website](https://cli.github.com): what gh does, install options, and release notes
- [GitHub CLI manual](https://cli.github.com/manual): every command and flag, one page each, such as [`gh pr merge`](https://cli.github.com/manual/gh_pr_merge)
- [GitHub CLI on GitHub](https://github.com/cli/cli): source code, releases, and where to report bugs

## Before you start

This kit installs gh through the [`Brewfile`](../Brewfile). To check it's ready and sign in:

```sh
gh --version                    # Confirm it's installed and show the version
gh auth login                   # Sign in to GitHub (once per Mac)
gh auth status                  # Show which account you're signed into
```

`gh auth login` asks a few questions. Use the arrow keys to pick an answer, then press `Return`. The usual answers are:

| Question | Pick |
| --- | --- |
| **Where do you use GitHub?** | **GitHub.com** |
| **What is your preferred protocol for Git operations on this host?** | **HTTPS** |
| **Authenticate Git with your GitHub credentials?** | **Yes** (`Y`) |
| **How would you like to authenticate GitHub CLI?** | **Login with a web browser** |

gh then shows **First copy your one-time code** followed by a code. Copy it, press `Return` to open GitHub in your browser, and paste the code into the page that opens.

- Words in angle brackets, like `<number>`, are blanks to fill in. Replace the whole thing, brackets included: `gh pr checkout <number>` becomes `gh pr checkout 42`.
- A comment that starts with **Careful** marks a command that changes or deletes things in a way that's hard to undo. Read the note under its block before you run it.
- Most commands act on the repository in your current folder. `cd` into your project folder first.

## Daily and weekly

```sh
gh status                       # Summarize your PRs, issues, and mentions
gh pr list                      # List open pull requests in this repo
gh pr checkout <number>         # Check out a PR's branch to review it locally
gh pr create --fill             # Open a PR titled from your commits
gh pr checks                    # Show whether the current PR's checks passed
gh pr view --web                # Open the current branch's PR in the browser
gh issue list --assignee @me    # List issues assigned to you
gh run watch                    # Follow a workflow run live
gh browse                       # Open the current repo on GitHub
```

## Common commands

### Signing in

`gh auth login` and `gh auth status` are in [Before you start](#before-you-start).

```sh
gh auth setup-git               # Let git use your gh sign-in when you push
gh auth refresh -s <scope>      # Add a permission, such as workflow
gh auth logout                  # Sign out of GitHub on this Mac
```

### Pull requests

A pull request (PR) asks teammates to review a branch before it joins the main project. Most PR commands act on the current branch's PR when you leave out `<number>`.

```sh
gh pr create                    # Create a PR, answering prompts as you go
gh pr create --draft            # Create a draft PR that isn't ready for review
gh pr view <number>             # Show a PR's title, description, and status
gh pr diff <number>             # Show exactly what a PR changes
gh pr diff --name-only          # List only the files the current PR changes
gh pr status                    # Show PRs you created or need to review
gh pr ready                     # Mark a draft PR ready for review
gh pr edit --add-reviewer <user>  # Ask someone to review the PR
gh pr comment -b "Updated the empty state copy"  # Add a comment to the PR
gh pr comment --attach "<file>#<alt text>"  # Attach a screenshot with alt text
gh pr review --approve          # Approve the current PR
gh pr review --request-changes -b "Error text needs a fix"  # Request changes
gh pr close <number>            # Close a PR without merging
gh pr merge --squash --delete-branch  # Careful: merges into main, deletes branch
```

`--attach` takes the file name, a `#`, then alt text describing the image, for example `"checkout-error.png#Checkout form showing the card declined message"`. Write alt text that says what a reviewer needs to notice.

`gh pr merge --squash --delete-branch` combines the PR's commits into one, adds it to the main branch, and deletes the branch both on GitHub and on your Mac. Run `gh pr checks` and `gh pr view` first. To undo, open the PR on GitHub and use **Revert** to create a new PR that reverses it, and **Restore branch** to bring the branch back. If you close a PR by mistake, `gh pr reopen <number>` opens it again.

### Issues

An issue is a tracked task, bug, or idea. Each has a number, like `#57`.

```sh
gh issue create                 # Create an issue, answering prompts as you go
gh issue list                   # List open issues in this repo
gh issue view <number>          # Show an issue's details and comments
gh issue comment <number> -b "Added the mobile layout"  # Comment on an issue
gh issue edit <number> --add-label bug  # Add a label to an issue
gh issue develop <number> -c    # Create a branch for an issue and switch to it
gh issue close <number>         # Close an issue (reopen with gh issue reopen)
```

### Repositories

A repository (repo) is a project folder with its full history. `<owner/repo>` is the account and project name from its GitHub address, like `a-miles-uxde/starter-kit`.

```sh
gh repo clone <owner/repo>      # Download a repo to your Mac
gh repo view                    # Show the current repo's README and info
gh repo list                    # List your repositories
gh repo create <name> --private  # Create a new private repository
gh repo create --source=. --private --push  # Publish this folder as a private repo
gh repo create <name> --public  # Careful: anyone on the internet can see it
gh repo fork <owner/repo>       # Copy someone else's repo to your account
gh repo sync <owner/repo>       # Update your fork on GitHub from its parent
gh repo edit --description "Onboarding flow prototype"  # Change the description
```

For `gh repo sync`, `<owner/repo>` is your fork, not the original project. Leave it out to update the copy in your current folder from GitHub instead.

Start with `--private` unless you're sure the work can be public. Research notes, client names, and unreleased designs don't belong in a public repo. Before you publish a folder, scan it for passwords and keys with gitleaks. If you make one public by mistake, see [When things go wrong](#when-things-go-wrong). Anything already seen or copied can't be recalled.

### Checks and automation

GitHub Actions runs automated jobs, such as building a prototype or running tests, each time you push. Each run has an ID, shown by `gh run list`.

```sh
gh run list                     # List recent workflow runs
gh run view <id>                # Show a run's jobs and whether they passed
gh run view <id> --log-failed   # Show logs from failed steps only
gh run rerun <id> --failed      # Rerun only the jobs that failed
gh workflow list                # List the repo's workflows
gh workflow run <workflow>      # Start a workflow by hand
```

### Releases

A release is a named, dated version of a project, often with files to download.

```sh
gh release list                 # List releases
gh release view <tag>           # Show a release's notes and files
gh release download <tag>       # Download a release's files to this folder
gh release create v1.0 --generate-notes  # Publish a release with written notes
```

### Sharing files as gists

A gist is a single file or snippet shared through a link. A secret gist is unlisted, but anyone with the link can open it.

```sh
gh gist create <file>           # Share a file as a secret gist
gh gist list                    # List your gists
gh gist create --public <file>  # Careful: lists the file publicly on GitHub
```

To remove a gist, run `gh gist delete <id>`, using the ID from `gh gist list`.

### Searching and browsing

```sh
gh search repos <query>         # Search GitHub repositories
gh search issues <query>        # Search issues across GitHub
gh browse <file>                # Open a file from this repo on GitHub
gh browse -n                    # Print the repo's GitHub address
gh api user                     # Call the GitHub API directly
gh extension list               # List installed gh extensions
```

## When things go wrong

| What you see | What it means | What to do |
| --- | --- | --- |
| `To get started with GitHub CLI, please run:  gh auth login` | gh isn't signed in to GitHub on this Mac. | Run `gh auth login`, then try again. |
| `failed to run git: fatal: not a git repository (or any of the parent directories): .git` | You're in a folder that isn't a project. | `cd` into your project folder, then run the command again. |
| `no pull requests found for branch "main"` | The branch you're on has no PR. | Switch to your work branch with `git switch <branch>`, or create a PR with `gh pr create`. |
| `GraphQL: Could not resolve to a PullRequest with the number of 99999. (repository.pullRequest)` | No PR with that number exists in this repo. | Run `gh pr list` to find the right number. |
| You merged a PR too early | `gh pr merge` added the changes to main and deleted the branch. | On the PR page on GitHub, use **Revert** to open a PR that reverses it, and **Restore branch** to get the branch back. |
| You made a repo or gist public by mistake | Anyone can see it until you change it. | For a repo, run `gh repo edit <owner/repo> --visibility private --accept-visibility-change-consequences`. For a gist, run `gh gist delete <id>`. If it held personal or client data, tell your team lead. |

## Using gh with Claude Code

Claude can run gh for you to summarize a PR, explain why a check failed, or draft a review comment, which saves reading long logs yourself.

```text
In this repo, run `gh pr view 42` and `gh pr diff 42`. Summarize what the PR changes
in plain language for a designer, list any UI copy that changed (old and new text),
and flag anything that affects accessibility, such as removed labels or alt text.
Don't comment on, approve, or merge the PR.
```

Before you act on the summary, open the diff yourself (`gh pr diff 42` or **Files changed** on GitHub) and check each copy change against the source: a summary describes intent, the diff shows what actually changed. Ask Claude to show you any comment before it posts it. PR discussions and CI logs can contain names, emails, or tokens, so don't paste them into other tools, and follow your organization's AI policy.

## Related

- [CLI reference index](README.md): all the command references in this kit
- [GitHub Desktop guide](../docs/github-desktop/README.md): the same save-and-share loop in an app with a window
- [VS Code guide](../docs/vs-code/README.md): run gh from the built-in terminal panel
