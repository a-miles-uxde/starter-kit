#!/usr/bin/env bash
# Keep Homebrew packages upgraded daily. GUI apps in the Brewfile update themselves.
set -euo pipefail

mkdir -p "$HOME/Library/LaunchAgents"
brew tap homebrew/autoupdate

if brew autoupdate status | grep -q "installed and running"; then
  echo "Homebrew autoupdate already running"
else
  echo "==> Enabling daily Homebrew autoupdate"
  brew autoupdate start 86400 --upgrade --cleanup
fi

# VS Code: make sure automatic updates are on.
vscode_settings="$HOME/Library/Application Support/Code/User/settings.json"
if [ ! -f "$vscode_settings" ]; then
  mkdir -p "$(dirname "$vscode_settings")"
  printf '{\n  "update.mode": "default"\n}\n' > "$vscode_settings"
fi
