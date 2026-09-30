# Templates

Starting points for new guides in [`docs/`](../docs) and quick references in [`cli/`](../cli). The templates hold the house structure and style, so every guide in the kit reads the same way and each new one starts with the safety and review sections already in place. You don't need to be a developer to use them: copy a file, replace the placeholders, and check your work against the list at the end.

## Contents

- [What's here](#whats-here)
- [Which template to use](#which-template-to-use)
- [Writing a guide](#writing-a-guide)
  - [1. Copy the template](#1-copy-the-template)
  - [2. Fill it in](#2-fill-it-in)
  - [3. Remove what doesn't apply](#3-remove-what-doesnt-apply)
  - [4. Verify every fact](#4-verify-every-fact)
  - [5. Link it in](#5-link-it-in)
- [Required and optional sections](#required-and-optional-sections)
- [Writing a quick reference](#writing-a-quick-reference)
- [Style rules](#style-rules)
- [Verification checklist](#verification-checklist)
- [What changed from the earlier guides](#what-changed-from-the-earlier-guides)

## What's here

| File | Use it for |
| --- | --- |
| [`guide-template.md`](guide-template.md) | A full guide in `docs/<topic>/README.md`: an interface tour, a workflow, or both. |
| [`cli-reference.md`](cli-reference.md) | A command reference in `cli/<tool>.md`. |

## Which template to use

| You're writing | Use | Example |
| --- | --- | --- |
| A tour of an app and how to use it day to day | Guide template | [GitHub Desktop](../docs/github-desktop/README.md), [VS Code](../docs/vs-code/README.md) |
| An end-to-end process with AI at specific steps | Guide template, with the tour trimmed or removed | Research synthesis, UX copy review |
| A list of terminal commands grouped by task | CLI reference template | [git](../cli/git.md), [tree](../cli/tree.md) |

## Writing a guide

### 1. Copy the template

Pick a short, lowercase, hyphenated folder name for the topic, such as `figma-mcp` or `research-synthesis`. Then copy the template into it as `README.md`. In Terminal, from the repo folder:

```sh
mkdir -p docs/figma-mcp                                         # Create the topic folder
cp templates/guide-template.md docs/figma-mcp/README.md         # Copy the template in
```

Or in Finder: duplicate `guide-template.md`, rename it `README.md`, and move it into a new folder in `docs/`.

Put a branch in place first (see the [GitHub Desktop guide](../docs/github-desktop/README.md#1-make-a-branch)) so the draft stays off `main` until someone has reviewed it.

### 2. Fill it in

- **Replace every `[bracketed placeholder]`.** Placeholders use square brackets so they show up in a preview and are easy to search for. Search the file for `[` when you think you're done; the only brackets left should be real links.
- **Read each HTML comment, then delete it.** Comments such as `<!-- REQUIRED. ... -->` say what belongs in each section. They're hidden in a preview, so check the raw file.
- **Write steps with the tool open.** Do each step as you write it, and note what you actually see on screen.
- **Use realistic design examples.** An onboarding flow, a checkout error state, interview notes, a settings page.
- **Update Contents as you go.** Every `##` heading gets a link, and every `###` heading gets a nested link. If you rename a heading, rename its link.

### 3. Remove what doesn't apply

Delete sections marked `OPTIONAL` that don't earn their place, and sections marked `REQUIRED WHEN` whose condition isn't true. Remove their line from Contents too. See [Required and optional sections](#required-and-optional-sections).

### 4. Verify every fact

Menu names, shortcuts, commands, version numbers, and plan requirements change often.

- Check each one against the tool's official documentation or the app itself (menus list their shortcuts beside each item).
- For command-line tools, run `<tool> --help` or `<tool> --version`.
- If you can't verify something, leave it out, or mark it `(unverified)` and ask a reviewer to confirm it before merging.
- Set the **Last verified** line to the month you checked and the version you checked against.

### 5. Link it in

1. Add a row for the guide to the table in the [guides index](../docs/README.md), and add it to the **Guides** line in the [main README](../README.md), in the same `[Name](docs/%3Ctopic%3E/README.md)` format, separated by ` · `.
2. Add it to **Next steps** in the guides a reader would come from, and add those guides to its own **Next steps**.
3. If the guide has a matching quick reference in `cli/`, link each to the other.

## Required and optional sections

| Section | Status | Notes |
| --- | --- | --- |
| Title and intro | Required | Title is `# [Tool or task] for UX designers`. |
| Platform note | Required when there are shortcuts | "Shortcuts below are for macOS. On Windows, swap `⌘` for `Ctrl`." |
| Last verified | Required | Month, tool version, and macOS version. |
| Contents | Required | Linked and nested. |
| Before you start | Required | What the reader needs, how long it takes, and what they'll have at the end. |
| Official links | Required | Two to four official pages. |
| Why [Tool] | Required | Three to five bolded benefits. |
| Key ideas in plain language | Required | **Term** and **Think of it as** table. |
| First-time setup | Optional | Keep when there's sign-in or settings to choose. |
| Tour of the interface | Required for interface guides | Optional for workflow guides. |
| Shortcuts worth learning first | Optional | Five to ten, verified. |
| Core workflow | Required | Numbered `###` steps, each with a **Check:** line, ending in a review step. |
| Reviewing AI output | Required when AI is used | Tailor the checks to the kind of output. |
| Protecting data | Required when AI, GitHub, or sharing is involved | Participant privacy, confidential work, secrets, visibility. |
| Accessibility check | Required when the work changes UI, copy, or visuals | Checklist the reader can tick off. |
| When things go wrong | Required | Call it "Undoing things" if every row is about reversing an action. |
| Using [Tool] with Claude Code | Optional | Keep when the two work together. |
| A typical session | Required | Five to eight steps. |
| Tips and gotchas | Required | Bolded lead-in, one or two sentences. |
| Next steps | Required | Two to four links to neighbors. |

## Writing a quick reference

Quick references in `cli/` follow a shorter pattern than guides:

1. `# [tool]` as the title, using the command name.
2. One intro paragraph: what the tool does and what it's handy for.
3. `## Contents`.
4. `## Daily and weekly`: the five to ten most-used commands.
5. `## Common commands`, with a `###` group per task.

Every line in a code block is a command, then a `#` comment that starts with a verb, such as `# Show the installed version`. Line the comments up in one column. Copy [`cli-reference.md`](cli-reference.md) to `cli/<tool>.md`, then add a row for the tool in [`cli/README.md`](../cli/README.md). CLI references link back to that index and never to each other. If the kit installs the tool, add it to the [`Brewfile`](../Brewfile) and the **What it does** list too.

## Style rules

**Voice**

- Plain language, short sentences, active voice, present tense, second person ("you").
- Explain each term on first use, or add it to **Key ideas in plain language**. Design analogies work well: a branch is like duplicating a Figma page to explore.
- Keep the designer in charge. AI drafts, explains, and speeds things up. The designer decides, reviews, and owns the result.
- Name limits honestly: models can be confidently wrong, miss nuance, and flatten diverse voices into averages.
- Use inclusive, gender-neutral language and examples.

**Words to avoid**

- No em dashes. Use a period, colon, comma, or parentheses.
- No filler or hype: "simply," "just," "easily," "powerful," "seamless," "revolutionary."
- No unexplained acronyms. Spell out on first use: "pull request (PR)."

**Formatting**

| Element | Format | Example |
| --- | --- | --- |
| UI labels | Bold, exactly as on screen | **Current Branch**, **Commit to main** |
| Menu paths | Bold, with `→` between levels | **File → Clone Repository** |
| Shortcuts | Code, in parentheses after the menu path | **File → Clone Repository** (`⇧⌘O`) |
| Commands, files, paths, keys, typed text | Code | `git status`, `.gitignore`, `⌘P` |
| Prompts to copy | Fenced code block with `text` | See the template's core workflow |
| Links in the kit | Relative paths | `[VS Code guide](../vs-code/README.md)` |
| Official links | `[Name](url): description` | `[GitHub Desktop documentation](https://docs.github.com/en/desktop): the full documentation` |
| Headings | Sentence case | "Tour of the interface," not "Tour Of The Interface" |
| Shortcut tables | **Action** column, then **Shortcut** | |

Images go in an `images/` folder beside the guide, and each meaningful image gets alt text that says what it shows, not "screenshot."

## Verification checklist

Before you open a pull request for a new or updated guide:

- [ ] Every step works in order, from a fresh start, for someone who has never used the tool.
- [ ] Every command, shortcut, menu path, and version is verified or marked `(unverified)`.
- [ ] The **Last verified** line shows this month and the version you checked.
- [ ] Every Contents link matches a real heading. Click each one in a Markdown preview (in VS Code, `⇧⌘V`).
- [ ] No `[bracketed placeholders]` or template HTML comments are left.
- [ ] No em dashes, filler words, or unexplained acronyms.
- [ ] Every workflow that produces AI output has a review step.
- [ ] Data handling is covered where the reader might paste personal, confidential, or secret material.
- [ ] Workflows that touch UI include the accessibility check.
- [ ] The guide is in the guides index and the main README, and it links to and from its neighbors.

To find em dashes and leftover placeholders from the terminal:

```sh
grep -n "—" docs/figma-mcp/README.md                    # List lines with em dashes
grep -nE "\[[^]]+\]([^(]|$)" docs/figma-mcp/README.md   # List brackets that aren't links
grep -n "<!--" docs/figma-mcp/README.md                 # List leftover template comments
```

The first search prints its own pattern if you run it on this file, because the pattern contains an em dash. On a finished guide, all three should print nothing. The Markdown checkboxes in a checklist (`- [ ]`) also show up in the placeholder search, so read each result before you change it.

## What changed from the earlier guides

The first two guides set the house style. The template keeps their structure and adds what was missing or inconsistent between them:

| Added or changed | Why |
| --- | --- |
| **Before you start** | Readers learn what they need before step 1, not halfway through. |
| **Last verified** line | Menus and shortcuts change. Readers and editors can see when a guide may be stale. |
| **Check:** line on each workflow step | Every step ends with something the reader can confirm. |
| **Reviewing AI output** as its own section | Review advice was spread across tips. It's now one place readers can find and follow. |
| **Protecting data** | The guides covered secrets but not participant data or confidential work in AI prompts. |
| **Accessibility check** | No guide included one, and it belongs in any workflow that changes UI. |
| **Next steps** | Cross-links were scattered through intros. They now sit where a reader finishes. |
| One menu-path style | The VS Code guide used `>` and the GitHub Desktop guide used `→`. Every guide now uses `→`. |
| One shortcut-table column order | The two guides ordered the columns differently. Every guide now uses **Action**, then **Shortcut**. |
| **Key ideas** required | The VS Code guide had no terms table. Every guide now has one. |
