# starter-kit

Setup scripts for a new Mac.

## Contents

- [What it does](#what-it-does)
- [Usage](#usage)
- [Customizing](#customizing)
- [CLI reference](#cli-reference)
- [Guides](#guides)
- [License](#license)

## What it does

- Installs [Homebrew](https://brew.sh) if missing
- Installs everything in the [`Brewfile`](Brewfile):
  - **CLI:** git, GitHub CLI (`gh`), gitleaks, herdr
  - **Apps:** GitHub Desktop, Visual Studio Code, Google Chrome
- Pins the apps to the Dock
- Runs a daily system-wide `brew upgrade` for the CLI tools via a LaunchDaemon (needs an admin password to install; the apps update themselves)
- Sets global git defaults (name, email, `main` branch, VS Code as editor)

## Usage

```sh
git clone https://github.com/a-miles-uxde/starter-kit.git ~/Documents/starter-kit
cd ~/Documents/starter-kit
./setup.sh
gh auth login
```

Each script in [`scripts/`](scripts) can also be run on its own, and all are safe to re-run.

## Customizing

- Add or remove packages in the `Brewfile`
- Change pinned apps in `scripts/dock.sh`

## CLI reference

Quick references in [`cli/`](cli):
[terminal basics](cli/terminal.md) · [git](cli/git.md) · [gh](cli/gh.md) · [gitleaks](cli/gitleaks.md) · [herdr](cli/herdr.md)

## Guides

Interface walkthroughs for designers getting started with Git, GitHub, and Claude Code, in [`docs/`](docs):
[GitHub Desktop](docs/github-desktop/README.md) · [VS Code](docs/vs-code/README.md)

## License

[MIT](LICENSE)
