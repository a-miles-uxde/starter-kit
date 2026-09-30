# starter-kit

Setup scripts for a new Mac.

## Contents

- [What it does](#what-it-does)
- [Usage](#usage)
- [Customizing](#customizing)
- [Formatting](#formatting)
- [CLI reference](#cli-reference)
- [Guides](#guides)
- [License](#license)

## What it does

- Installs [Homebrew](https://brew.sh) if missing
- Installs everything in the [`Brewfile`](Brewfile):
  - **CLI:** git, GitHub CLI (`gh`), gitleaks, herdr, pre-commit, prettier, tree
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
- Change Prettier's formatting rules in [`.prettierrc`](.prettierrc)

## Formatting

The Markdown files follow one style, checked by [Prettier](cli/prettier.md). Before you open a pull request, run:

```sh
prettier --check .    # List files that aren't formatted, change nothing
prettier --write .    # Careful: rewrites the listed files in place
```

[`.prettierrc`](.prettierrc) sets paragraphs to stay on one line, so your editor wraps them to fit the window. Prettier is installed by the `Brewfile`. The [pre-commit](cli/pre-commit.md) tool is installed too, but this repo doesn't have a checks file yet, so nothing runs on commit.

## CLI reference

One-page command references for the terminal tools this kit installs, indexed in [`cli/README.md`](cli/README.md).

## Guides

Interface walkthroughs for designers getting started with Git, GitHub, and Claude Code, indexed in [`docs/README.md`](docs/README.md): [GitHub Desktop](docs/github-desktop/README.md) · [VS Code](docs/vs-code/README.md)

To add a guide or CLI reference, start from the templates and instructions in [`templates/`](templates/README.md).

## License

[MIT](LICENSE)
