#!/usr/bin/env bash
# Keep Homebrew packages upgraded daily, system-wide via a LaunchDaemon so it
# runs on schedule regardless of which user (if any) is logged in — not tied
# to one account's login session the way a per-user LaunchAgent would be.
# GUI apps in the Brewfile update themselves.
set -euo pipefail

label="com.starter-kit.homebrew-autoupdate"
daemon_plist="/Library/LaunchDaemons/${label}.plist"
support_dir="/Library/Application Support/HomebrewAutoupdate"
run_script="${support_dir}/run.sh"
log_dir="/Library/Logs/HomebrewAutoupdate"
log_file="${log_dir}/run.log"

if command -v brew >/dev/null 2>&1; then
  brew_bin="$(command -v brew)"
elif [ -x /opt/homebrew/bin/brew ]; then
  brew_bin=/opt/homebrew/bin/brew
elif [ -x /usr/local/bin/brew ]; then
  brew_bin=/usr/local/bin/brew
else
  echo "Homebrew not found; run scripts/homebrew.sh first" >&2
  exit 1
fi
brew_prefix="$("$brew_bin" --prefix)"
brew_owner="$(/usr/bin/stat -f '%Su' "$brew_prefix")"

# Migrate off the old per-user autoupdate (brew autoupdate tap + LaunchAgent),
# if a machine still has it from a previous version of this script.
if "$brew_bin" tap 2>/dev/null | grep -q '^homebrew/autoupdate$'; then
  echo "==> Removing old per-user Homebrew autoupdate"
  "$brew_bin" autoupdate delete >/dev/null 2>&1 || true
  "$brew_bin" untap homebrew/autoupdate >/dev/null 2>&1 || true
fi

if sudo launchctl print system/"$label" >/dev/null 2>&1; then
  echo "Homebrew autoupdate already running system-wide"
else
  echo "==> Enabling daily Homebrew autoupdate (system-wide; requires admin password)"

  sudo mkdir -p "$support_dir" "$log_dir"

  sudo tee "$run_script" >/dev/null <<EOF
#!/bin/bash
export PATH="${brew_prefix}/bin:${brew_prefix}/sbin:\$PATH"
"$brew_bin" update
"$brew_bin" upgrade
"$brew_bin" cleanup
EOF
  sudo chown root:wheel "$run_script"
  sudo chmod 755 "$run_script"

  sudo tee "$daemon_plist" >/dev/null <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key>
  <string>${label}</string>
  <key>UserName</key>
  <string>${brew_owner}</string>
  <key>ProgramArguments</key>
  <array>
    <string>/bin/bash</string>
    <string>${run_script}</string>
  </array>
  <key>StartInterval</key>
  <integer>86400</integer>
  <key>StandardOutPath</key>
  <string>${log_file}</string>
  <key>StandardErrorPath</key>
  <string>${log_file}</string>
  <key>LowPriorityIO</key>
  <true/>
  <key>ProcessType</key>
  <string>Background</string>
</dict>
</plist>
EOF
  sudo chown root:wheel "$daemon_plist"
  sudo chmod 644 "$daemon_plist"

  sudo launchctl bootstrap system "$daemon_plist"
fi

# VS Code: make sure automatic updates are on.
vscode_settings="$HOME/Library/Application Support/Code/User/settings.json"
if [ ! -f "$vscode_settings" ]; then
  mkdir -p "$(dirname "$vscode_settings")"
  printf '{\n  "update.mode": "default"\n}\n' > "$vscode_settings"
fi
