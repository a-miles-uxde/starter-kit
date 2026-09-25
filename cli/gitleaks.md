# gitleaks

Gitleaks scans code for secrets such as API keys, passwords, and tokens before they reach a public place like GitHub. It can scan a folder, a repo's full git history, or just the changes you're about to commit. It exits with code 1 when it finds something, which makes it easy to use in scripts, git hooks, and CI.

## Contents

- [Daily and weekly](#daily-and-weekly)
- [Common commands](#common-commands)
  - [Scanning git repositories](#scanning-git-repositories)
  - [Scanning files and folders](#scanning-files-and-folders)
  - [Reports and output](#reports-and-output)
  - [Handling false positives](#handling-false-positives)
  - [Pre-commit hook](#pre-commit-hook)

## Daily and weekly

```sh
gitleaks git --staged -v        # Scan staged changes before committing
gitleaks git -v                 # Scan the whole repo history
gitleaks dir . -v               # Scan current files, ignoring git history
gitleaks version                # Show the installed version
```

## Common commands

### Scanning git repositories

```sh
gitleaks git                    # Scan all commits in the current repo
gitleaks git <path>             # Scan a repo at another path
gitleaks git --staged           # Scan only staged changes
gitleaks git --pre-commit       # Scan uncommitted working-tree changes
gitleaks git --log-opts="-10"   # Scan only the last ten commits
gitleaks git --log-opts="main..HEAD"  # Scan commits not yet on main
```

### Scanning files and folders

```sh
gitleaks dir <path>             # Scan a folder or file
gitleaks dir --max-target-megabytes 5  # Skip files larger than 5 MB
cat file.txt | gitleaks stdin   # Scan text piped from another command
```

### Reports and output

```sh
gitleaks git -v                 # Print each finding in detail
gitleaks git --redact           # Hide secret values in the output
gitleaks git -r report.json     # Save findings to a JSON report
gitleaks git -f sarif -r out.sarif  # Save a SARIF report for GitHub
gitleaks git --no-banner        # Hide the startup banner
gitleaks git --exit-code 0      # Report findings without failing scripts
```

### Handling false positives

```sh
gitleaks git -r baseline.json   # Record current findings as a baseline
gitleaks git -b baseline.json   # Report only findings not in baseline
gitleaks git -c .gitleaks.toml  # Use a custom rules config file
gitleaks git --enable-rule <id> # Run only specific rules by ID
echo "<fingerprint>" >> .gitleaksignore  # Ignore one finding by fingerprint
```

Add `# gitleaks:allow` to the end of a line to ignore it.

### Pre-commit hook

```sh
# Block commits that contain secrets in this repo
printf '#!/bin/sh\ngitleaks git --staged --no-banner\n' > .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit  # Make the hook executable
git commit --no-verify          # Skip hooks for one commit, carefully
```
