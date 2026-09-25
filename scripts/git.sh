#!/usr/bin/env bash
# Configure global git identity and defaults. Prompts for name/email if unset.
set -euo pipefail

name="$(git config --global user.name || true)"
email="$(git config --global user.email || true)"

if [ -z "$name" ]; then
  read -rp "Git name [$(id -F)]: " name
  name="${name:-$(id -F)}"
fi
if [ -z "$email" ]; then
  read -rp "Git email: " email
fi

git config --global user.name "$name"
git config --global user.email "$email"
git config --global init.defaultBranch main
git config --global core.editor "code --wait"
git config --global credential.helper osxkeychain
git config --global push.autoSetupRemote true
git config --global pull.rebase false

echo "==> Git configured for $name <$email>"
