# starter-kit

Setup scripts for a new Mac.

## What it does

- Installs [Homebrew](https://brew.sh) if it's missing
- Installs everything in the [`Brewfile`](Brewfile):
  - **CLI:** git, GitHub CLI (`gh`), gitleaks, herdr
  - **Apps:** GitHub Desktop, Visual Studio Code, Google Chrome
- Pins the apps to the Dock
- Turns on auto-updates: a daily `brew upgrade` for the CLI tools, run system-wide via a LaunchDaemon so it fires on schedule no matter which user is logged in (the apps update themselves); requires an admin password to install
- Sets global git defaults (name, email, `main` branch, VS Code as editor)

## Usage

```sh
git clone https://github.com/a-miles-uxde/starter-kit.git ~/Documents/starter-kit
cd ~/Documents/starter-kit
./setup.sh
gh auth login
```

Each script in [`scripts/`](scripts) can also be run on its own, and all of them are safe to re-run.

## Customizing

- Add or remove packages in the `Brewfile`
- Change which apps are pinned in `scripts/dock.sh`

## CLI reference

Quick references for the installed command-line tools live in [`cli/`](cli):
[git](cli/git.md) · [gh](cli/gh.md) · [gitleaks](cli/gitleaks.md) · [herdr](cli/herdr.md)

## License

[MIT](LICENSE)
