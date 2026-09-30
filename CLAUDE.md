# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

Two things in one repo: (1) macOS bootstrap shell scripts, and (2) Markdown guides and CLI references for UX designers adopting Git, GitHub, VS Code, and Claude Code. There is no build, lint, or test suite.

## Commands

```sh
./setup.sh                  # Run everything: homebrew.sh, dock.sh, autoupdate.sh, git.sh (in that order)
./scripts/<name>.sh         # Run one script on its own
bash -n scripts/<name>.sh   # Syntax-check a script without running it
```

All scripts use `set -euo pipefail` and must stay idempotent (safe to re-run). `setup.sh` `cd`s to its own directory. Running them changes the real machine (Homebrew, Dock, `sudo` LaunchDaemon, global git config), so don't execute them casually.

## Scripts architecture

- `scripts/autoupdate.sh` installs a system-wide **LaunchDaemon** (`com.starter-kit.homebrew-autoupdate`, runs `brew update/upgrade/cleanup` every 24h as the Homebrew owner), not a per-user LaunchAgent. It also migrates away from the old `homebrew/autoupdate` tap and sets VS Code `update.mode`. GUI casks self-update.

## Docs architecture

- `docs/<topic>/README.md`: full guides, indexed in [docs/README.md](docs/README.md) and listed on the **Guides** line of the main [README.md](README.md).
- `cli/<tool>.md`: one-page command references, indexed in [cli/README.md](cli/README.md). CLI references link back to the index, never to each other.
- `templates/`: `guide-template.md`, `cli-reference.md`, `quick-reference-template.md`. **[templates/README.md](templates/README.md) is the authoritative style guide and verification checklist.** Read it before writing or editing any doc.
- A tool installed by the kit should appear in the Brewfile, the README **What it does** list, and `cli/`.
- The `ux-ai-docs-writer` agent in `.claude/agents/` is intended for writing these docs.

Key style rules (full list in templates/README.md): no em dashes; no filler words ("simply," "just," "easily"); UI labels in bold, menu paths as **File → Clone Repository**; shortcuts in code; sentence-case headings; relative links; every `##`/`###` heading linked in Contents; each guide has a **Last verified** line, and every command/shortcut must be verified or marked `(unverified)`. Adding a guide means also updating the docs index, the main README, and neighbor guides' **Next steps**.

## Conventions

- **Chat responses:** write for a UX professional with limited technical background. Use plain language authoring practices: short sentences, active voice, everyday words, and one idea per paragraph. Explain technical terms the first time you use them, lead with what matters or what to do next, and say what a command does before showing it.

- Dated work files (notes, transcripts, drafts, exports) follow the user's global naming rule `{hhmm-YYMMDD}-{kebab-case-name}.ext`; this does not apply to conventional names like README.md.
