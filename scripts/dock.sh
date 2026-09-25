#!/usr/bin/env bash
# Pin apps to the Dock, skipping any that are already pinned.
set -euo pipefail

apps=(
  "/Applications/Google Chrome.app"
  "/Applications/Visual Studio Code.app"
  "/Applications/GitHub Desktop.app"
)

current="$(defaults read com.apple.dock persistent-apps 2>/dev/null || true)"
changed=0

for app in "${apps[@]}"; do
  [ -d "$app" ] || { echo "Skipping $app (not installed)"; continue; }
  name="$(basename "$app")"
  encoded="${name// /%20}"
  if grep -qE "(${name}|${encoded})" <<<"$current"; then
    echo "Already in Dock: $name"
    continue
  fi
  echo "==> Pinning $name"
  defaults write com.apple.dock persistent-apps -array-add \
    "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>$app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
  changed=1
done

[ "$changed" -eq 1 ] && killall Dock
exit 0
