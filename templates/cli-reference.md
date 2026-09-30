# CLI quick reference template

A template for the one-page command references in [`cli/`](../cli). Each reference helps a designer find the right command fast, understand what it does before running it, and know how to back out if something goes wrong. Use this file for any command-line tool the kit installs or that designers run next to it. For apps with a window (GitHub Desktop, VS Code), write a full guide in `docs/` instead.

## Contents

- [How to use this template](#how-to-use-this-template)
- [The template](#the-template)
- [Section by section](#section-by-section)
- [Writing commands and comments](#writing-commands-and-comments)
  - [Line format](#line-format)
  - [Comments](#comments)
  - [Choosing daily and weekly commands](#choosing-daily-and-weekly-commands)
  - [Grouping the rest](#grouping-the-rest)
  - [Careful commands](#careful-commands)
- [Verifying before you publish](#verifying-before-you-publish)
- [A filled-in example](#a-filled-in-example)
- [What changed from the original format](#what-changed-from-the-original-format)
- [Checklist](#checklist)

## How to use this template

1. **Name the file after the command.** Use the name a reader types: `cli/gh.md`, not `cli/github-cli.md`.
2. **Copy the template.** Copy everything inside the four-backtick block in [The template](#the-template) into the new file.
3. **Fill in every `<placeholder>`.** Delete optional sections that don't earn their place (each is marked below).
4. **Verify every line** against the installed tool and its official docs. See [Verifying before you publish](#verifying-before-you-publish).
5. **Link it in.** Add the page to the **CLI reference** line in the root [`README.md`](../README.md), and add a row for it in [`cli/README.md`](../cli/README.md), the index that lists every reference. CLI references do not link to each other, so the set can grow without every page needing an edit.
6. **Run the [Checklist](#checklist).**

## The template

````markdown
# <tool> (<full name, only if it differs from the command>)

<What the tool is, in one sentence. What it's for in everyday work, in one or two sentences. How it fits with the other tools in this kit.> Run `<tool>` <with no arguments / with `--help`> to <what happens>.

Verified with <tool> <x.y.z> on macOS <nn>, <Month YYYY>. Run `<tool> --version` to see yours. If a command below fails, check `<tool> --help` first: flags change between versions.

## Contents

- [Official links](#official-links)
- [Before you start](#before-you-start)
- [Daily and weekly](#daily-and-weekly)
- [Common commands](#common-commands)
  - [<Group one>](#<group-one>)
  - [<Group two>](#<group-two>)
- [When things go wrong](#when-things-go-wrong)
- [Using <tool> with Claude Code](#using-<tool>-with-claude-code)
- [Related](#related)

## Official links

- [<Tool> website](<url>): <what's there>
- [<Tool> documentation](<url>): <what's there>

## Before you start

This kit installs <tool> through the [`Brewfile`](../Brewfile). To check it's ready:

```sh
<tool> --version                # Confirm it's installed and show the version
```

- Words in angle brackets, like `<file>`, are blanks to fill in. Replace the whole thing, brackets included: `tree <path>` becomes `tree ~/Documents`.
- A comment that starts with **Careful** marks a command that changes or deletes things in a way that's hard to undo. Read the note under its block before you run it.

## Daily and weekly

```sh
<command>                       # <Verb-led description of the effect>
<command>                       # <Description>
```

## Common commands

### <Group one>

<Optional: one or two sentences the whole group needs, such as what an ID looks like.>

```sh
<command>                       # <Description>
<command>                       # Careful: <what it removes or overwrites>
```

<Optional: a short note for anything a comment can't hold, such as allowed values, or how to undo the Careful command above.>

### <Group two>

```sh
<command>                       # <Description>
```

## When things go wrong

| What you see | What it means | What to do |
| --- | --- | --- |
| `<error, exactly as printed>` | <Plain-language cause> | <The fix, with any command in code> |

## Using <tool> with Claude Code

<One sentence on when it helps to hand this tool to Claude, such as explaining output or running a routine check.>

```text
<A prompt the reader can copy. Name the folder or files, the command to run, and the result you want back.>
```

Before you act on the result, <how to check it: rerun the command yourself, read the diff, compare with the source>. <Data note, if relevant: what not to paste or share.>

## Related

- [CLI reference index](README.md): all the command references in this kit
- [<Guide>](../docs/<guide>/README.md): <how it relates; include only guides that cover this tool>
````

## Section by section

| Section | Required | What goes in it |
| --- | --- | --- |
| **Title** | Yes | The command as typed, in lowercase. Add the full name in parentheses only when it differs: `# gh (GitHub CLI)`. |
| **Intro** | Yes | One paragraph: what it is, what it's for, how it fits the kit, and what running it bare does. Name design uses where they exist, such as sharing a folder structure in a handoff doc. For built-in macOS tools, add a sentence noting that macOS ships the BSD versions, so some flags differ from Linux tutorials. |
| **Verified line** | Yes | The version you tested, the macOS version, and the month. Readers use it to judge whether a mismatch is their version or the doc. Update it whenever you re-verify. |
| **Contents** | Yes | Every `##` and `###` heading, nested to match. |
| **Official links** | Yes | The tool's home page and docs, each with a short description after a colon. Add the manual or changelog if readers will need it. |
| **Before you start** | Yes | How to confirm the tool is installed, plus the two reading conventions (placeholders and **Careful**). Add setup the tool needs, such as `gh auth login`. If the kit doesn't install the tool, give the `brew install` line instead of the Brewfile link. |
| **Daily and weekly** | Yes | The 5 to 10 commands a designer runs most. See [Choosing daily and weekly commands](#choosing-daily-and-weekly-commands). |
| **Common commands** | Yes | Everything else worth knowing, in `###` groups of 3 to 10 lines. |
| **When things go wrong** | Yes | 2 to 6 rows covering the errors a beginner is most likely to hit, and how to undo each **Careful** command. |
| **Using with Claude Code** | Optional | Include when Claude can run the tool or explain its output in a way that saves real effort. Always pair the prompt with a review step. |
| **Related** | Yes | A link back to the [`cli/README.md`](../cli/README.md) index, plus any `docs/` guides that cover the tool. Never link to another `cli/` page, in this section or in the body: mention other tools by name in plain text. |

## Writing commands and comments

### Line format

- Use a `sh` code block for commands, one command per line.
- Start every comment at column 33: pad the command with spaces so `#` is the 33rd character. This matches the existing files and keeps the comment column straight.
- When a command is 31 characters or longer, put two spaces before the `#` and let that line run long. Don't wrap it.
- Write placeholders in lowercase angle brackets: `<file>`, `<branch>`, `<id>`. Use the same placeholder name for the same thing across the page.
- Show quoted example values with a realistic stand-in, `"Fix checkout error copy"`, rather than `"…"`, where the value helps the reader understand the command.

### Comments

- **Start with a verb** and describe the effect, not the flag: `# Show only two levels deep`, not `# Set -L to 2`.
- **Keep them short.** Aim for 60 characters or fewer. Move anything longer into a note under the block.
- **Sentence case, no closing period.**
- **Say when something is permanent.** Name what gets deleted or overwritten, and whether there's an undo.
- **No em dashes**, and none of "simply," "just," or "easily."

### Choosing daily and weekly commands

- Pick the 5 to 10 commands a designer runs in a normal week, not the ones an expert finds clever.
- Order them the way a session runs: check status, do the work, share it, tidy up.
- Don't repeat them in **Common commands**. Each command appears once on the page. If a group feels incomplete without one, move that command into the group and choose another daily command.
- Keep **Careful** commands out of this block unless a beginner truly needs them every week.

### Grouping the rest

- Name groups after the task, not the subcommand: **Undoing changes**, not **reset and revert**.
- Order groups from most to least used. Put setup and config first only when a reader needs it before anything else works.
- When a group needs shared context (what an ID looks like, what a status means), put one or two sentences between the heading and the code block.

### Careful commands

A command is **Careful** when it deletes files, rewrites history, overwrites a remote, changes permissions, or runs with admin rights.

- Start its comment with `Careful:` and name the consequence: `# Careful: deletes untracked files, no undo`.
- Add a note under the block that says how to preview it first (a dry-run flag, if one exists) or how to recover.
- Add a matching row to **When things go wrong**.

## Verifying before you publish

Check every command, flag, and link. Don't document anything from memory. The default check is the tool's own help: `--help`, a subcommand's `--help`, or `man`. If the help doesn't settle it (it's missing, too terse, or the tool has no help), search the official docs online and cite them in **Official links**.

1. **Record the version.** Run `<tool> --version` and put the result in the verified line.
2. **Check each flag against help.** Run `<tool> --help`, `<tool> <subcommand> --help`, or `man <tool>`, and confirm every flag you list exists with the meaning you gave it.
3. **Check against the official docs.** Use the docs for behavior the help text doesn't explain, and for the **Official links** section.
4. **Run the safe ones.** In a scratch folder, run read-only commands and confirm the output matches your comment. Copy error messages for **When things go wrong** from real output, word for word.
5. **Run it, don't just read it.** A command isn't verified until it has run successfully, or failed the way your comment says it will.
6. **Don't run Careful commands on real work.** Test them in a throwaway folder or repo, or verify them from the docs alone.
7. **Flag what you can't verify.** Leave the line out, or mark it `<!-- TODO: verify -->` and mention it when you hand the page back.

## A filled-in example

The top of a reference for `tree`, following the template. Flags checked against `tree --help` in tree v2.3.2.

````markdown
# tree

Tree prints a folder's contents as an indented outline, so you can see how files and subfolders fit together at a glance. It's handy for checking a project's layout before you ask Claude to change it, and for pasting a folder structure into a handoff doc. Run `tree` with no arguments to list the current folder.

Verified with tree 2.3.2 on macOS 27, September 2026. Run `tree --version` to see yours. If a command below fails, check `tree --help` first: flags change between versions.

## Daily and weekly

```sh
tree -L 2                       # Show only two levels deep
tree -a -I .git                 # Include hidden files, but skip .git
tree --gitignore                # Hide anything ignored by .gitignore
tree -d                         # Show folders only
```
````

## What changed from the original format

| Change | Why |
| --- | --- |
| Added a **verified line** with version and date | Flags drift between versions. Readers can tell whether a mismatch is their install or the doc. |
| Added **Official links** | Matches the guides in `docs/` and gives readers a trusted place to go further. |
| Added **Before you start** | New terminal users often don't know that `<file>` is a blank to fill in, or how to check a tool is installed. |
| Added the **Careful** convention | Destructive commands were mixed in with safe ones, with warnings in some files and not others. |
| Added **When things go wrong** | Gives readers a way back, which is the main worry for people new to the terminal. |
| Added optional **Using with Claude Code** | Connects the reference to AI workflows, with a review step built in. |
| Added **Related** | Every reference links back to the `cli/README.md` index and never to another reference, so adding a tool means adding one index row. |
| No repeats between **Daily and weekly** and groups | Keeps pages short and avoids two descriptions of one command drifting apart. |
| Fixed the comment column at 33 | Most files already use it. This makes it the rule. |

## Checklist

- [ ] File is `cli/<command>.md` and the title matches the command.
- [ ] Every `<placeholder>` from the template is replaced or deleted.
- [ ] The verified line has a real version, macOS version, and month.
- [ ] Every command and flag was checked against `--help` or the official docs.
- [ ] Every comment starts at column 33 (or two spaces after a long command) and starts with a verb.
- [ ] No command appears twice on the page.
- [ ] Every destructive command starts with `Careful:` and has a recovery row.
- [ ] Every **Contents** link matches a real heading anchor.
- [ ] Any Claude Code prompt has a review step and a data note where relevant.
- [ ] No em dashes, no "simply," "just," or "easily."
- [ ] The page has a row in `cli/README.md` and links back to it from **Related**.
- [ ] The page links to no other `cli/` page. Other tools are named in plain text.
