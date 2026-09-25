#!/usr/bin/env bash
# Bootstrap a new Mac: Homebrew, packages, Dock, auto-updates, and git.
set -euo pipefail

cd "$(dirname "$0")"

./scripts/homebrew.sh
./scripts/dock.sh
./scripts/autoupdate.sh
./scripts/git.sh

echo
echo "Done. Next: run 'gh auth login' to sign in to GitHub."
