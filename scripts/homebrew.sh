#!/usr/bin/env bash
# Install Homebrew (if missing) and everything in the Brewfile.
set -euo pipefail

if ! command -v brew >/dev/null 2>&1; then
  echo "==> Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "==> Installing Brewfile packages"
brew bundle --file="$(dirname "$0")/../Brewfile"
