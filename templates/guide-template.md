<!--
  Guide template for docs/<topic>/README.md
  Read templates/README.md before you start.

  How to use this file:
  - Replace every [bracketed placeholder]. Search for "[" before you finish.
  - Sections marked OPTIONAL can be deleted. Delete their line in Contents too.
  - Sections marked REQUIRED WHEN ... stay if the condition is true for your guide.
  - Delete every HTML comment (like this one) before you commit.
-->

# [Tool or task] for UX designers

<!-- REQUIRED. One paragraph: what this is, who it's for, and what the reader can do by the end. Add "You don't need to be a developer." only when that's true. -->

A guide to [tool or task] for designers who are getting started with Git, GitHub, and Claude Code. You don't need to be a developer. [Tool] is [one sentence in design terms: what it lets the reader do].

<!-- REQUIRED WHEN the guide has shortcuts or platform-specific steps. -->

Shortcuts below are for macOS. On Windows, swap `⌘` for `Ctrl`.

<!-- REQUIRED. Update this line every time you re-check the guide against the tool. -->

_Last verified: [Month YYYY] with [Tool] [version] on macOS [version]._

## Contents

<!-- REQUIRED. One link per ## heading, nested for ### headings. Anchors are the heading in lowercase, spaces become hyphens, punctuation removed. Update this list whenever you rename or remove a heading. -->

- [Before you start](#before-you-start)
- [Official links](#official-links)
- [Why [Tool]](#why-tool)
- [Key ideas in plain language](#key-ideas-in-plain-language)
- [First-time setup](#first-time-setup)
- [Tour of the interface](#tour-of-the-interface)
  - [Shortcuts worth learning first](#shortcuts-worth-learning-first)
- [[Core workflow name]](#core-workflow-name)
  - [1. [First action]](#1-first-action)
  - [2. [Second action]](#2-second-action)
  - [3. Review the result](#3-review-the-result)
- [Reviewing AI output](#reviewing-ai-output)
- [Protecting data](#protecting-data)
- [Accessibility check](#accessibility-check)
- [When things go wrong](#when-things-go-wrong)
- [Using [Tool] with Claude Code](#using-tool-with-claude-code)
- [A typical session](#a-typical-session)
- [Tips and gotchas](#tips-and-gotchas)
- [Next steps](#next-steps)

## Before you start

<!-- REQUIRED. Everything the reader needs before step 1, so nobody gets stuck halfway. Link to the guide or script that provides each item. Remove rows that don't apply. -->

| You need | Why | How to get it |
| --- | --- | --- |
| [Tool] [minimum version] | [What it's used for in this guide] | Installed by this kit. See the [main README](../../README.md). |
| A GitHub account | [Reason] | [github.com](https://github.com/) |
| [A paid Claude plan, access to a Figma file, a sample project] | [Reason] | [Link or who to ask] |

**Time:** about [N] minutes the first time.

**By the end you'll have:** [a concrete result, for example "a branch with your copy changes, reviewed and ready for a pull request"].

## Official links

<!-- REQUIRED. Two to four official pages. Format: [Name](url): short description. Prefer linking here over restating pricing, plan limits, or other details that change often. -->

- [[Tool] website]([url]): downloads and overview
- [[Tool] documentation]([url]): the full documentation
- [Claude Code overview](https://code.claude.com/docs/en/overview): Anthropic's introduction to Claude Code

## Why [Tool]

<!-- REQUIRED. Three to five bolded benefits in design terms, each one or two sentences. No hype words. -->

- **[Benefit].** [One sentence explaining it in design terms.]
- **[Benefit].** [One sentence.]
- **[Benefit].** [One sentence.]

This kit installs [Tool] for you. See the [main README](../../README.md).

## Key ideas in plain language

<!-- REQUIRED. Every term a newcomer might not know, in the order they meet it. Use design analogies where they help. Bold the term. -->

| Term | Think of it as |
| --- | --- |
| **[Term]** | [Plain-language explanation or design analogy, for example "a named version, like saving a Figma file with a note".] |
| **[Term]** | [Explanation.] |

## First-time setup

<!-- OPTIONAL. Keep when the reader must sign in, pick settings, or install something. Numbered steps, one action each. Write menu paths with arrows and the shortcut in parentheses, copying each level exactly as the app shows it, trailing ellipsis included: **File → Clone Repository…** (`⇧⌘O`). -->

1. Open [Tool].
2. [Action, with the **UI label** bolded exactly as it appears on screen, including capitalization, punctuation, and any trailing ellipsis.]
3. [Action.] **Check:** [what the reader should see when it worked].

## Tour of the interface

<!-- REQUIRED FOR interface guides. OPTIONAL FOR workflow guides. List parts in the order the eye meets them. -->

Open [Tool] alongside this table to follow along.

| Part | Where | What it's for |
| --- | --- | --- |
| **[Part name]** | [Top left, Center, Bottom edge] | [What it does, in one or two sentences.] |
| **[Part name]** | [Where] | [What it does.] |

### Shortcuts worth learning first

<!-- OPTIONAL. Five to ten shortcuts, most useful first. Verify each one in the app's menus or official docs. Column order is Action, then Shortcut. -->

| Action   | Shortcut |
| -------- | -------- |
| [Action] | `[⇧⌘X]`  |
| [Action] | `[⌘,]`   |

If a shortcut doesn't respond, find the action in the menu bar. The shortcut is listed beside it.

## [Core workflow name]

<!-- REQUIRED. The main job of the guide, for example "A basic save-and-share loop" or "Synthesizing interview notes". Each ### step is one action the reader can finish and check. Always include a review step. -->

[One sentence on what this workflow produces and when to use it.]

### 1. [First action]

<!-- Start with a safety step when it applies: make a branch, commit, or duplicate the file before a large AI request. -->

1. [Action.]
2. [Action.]

**Check:** [what the reader should see before moving on].

### 2. [Second action]

<!-- When a step uses a prompt, put it in a code block the reader can copy, then say what context to give and what a good response looks like. -->

[Action and context.]

```text
[Prompt the reader can copy, for example: Summarize the recurring pain points in @notes/checkout-interviews.md. Quote the notes for each point and say how many participants mentioned it.]
```

- **Give it:** [files, selection, or background the prompt needs].
- **A good response:** [what to expect, for example "three to six themes, each with quotes and a count"].

**Check:** [what the reader should see before moving on].

### 3. Review the result

<!-- REQUIRED. The designer decides what to keep. Point to the diff, the source, or the screen. -->

1. [Open the diff, compare with the source, or preview the change.]
2. [Keep, edit, or discard.]
3. [Save the result: commit, export, or share.]

## Reviewing AI output

<!-- REQUIRED WHEN the guide uses Claude or any AI tool. Tailor the checks to the output: copy, research synthesis, code, flows. -->

You own anything you keep. Before you commit, share, or build on AI output:

- **Read the diff, not the summary.** The summary describes what Claude meant to do. The diff shows what it did.
- **Compare with the source.** [For example: every quote in a synthesis should appear in the original notes, and every count should match.]
- **Look for what's missing.** Models flatten outliers and minority voices into averages. Check that edge cases and less common views survived.
- **Watch for confident mistakes.** A fluent answer can still be wrong. Verify names, numbers, and claims about the product.
- **[Task-specific check].** [For example: read new UX copy aloud in context on the screen.]

## Protecting data

<!-- REQUIRED WHEN the guide involves AI tools, pushing to GitHub, or sharing files. Adjust the list to the tool. -->

- **Keep people out of prompts.** Don't paste participant names, emails, recordings, or other personal data into an AI tool. Replace them with IDs such as `P1`, `P2` first.
- **Keep confidential work out.** Unreleased strategy, client material, and anything under NDA stays out unless your organization's AI policy allows it.
- **Don't commit secrets.** API keys, tokens, and `.env` files never go in a repo. This kit includes [gitleaks](../../cli/gitleaks.md) to help catch them.
- **Check visibility.** [Where the tool can make work public, and how to keep it private.]
- **Follow your organization's AI policy.** When it and this guide disagree, the policy wins.

## Accessibility check

<!-- REQUIRED WHEN the workflow creates or changes UI, copy, or visual assets. OPTIONAL otherwise. -->

Before you share work that changes what people see or hear:

- [ ] Text and interactive elements meet contrast requirements (WCAG 2.2 AA: 4.5:1 for body text).
- [ ] Every meaningful image has alt text, and decorative images are marked as decorative.
- [ ] You can reach and use every control with the keyboard alone.
- [ ] A screen reader (VoiceOver on macOS: `⌘F5`) announces labels, states, and errors in a sensible order.
- [ ] Copy is plain, and error messages say what happened and how to fix it.

## When things go wrong

<!-- REQUIRED. Call it "Undoing things" if every row is about reversing an action. Cover the three to six situations beginners hit most. Say when to stop and ask a teammate. -->

| Situation | What to do |
| --- | --- |
| [Something the reader might see or do by mistake] | [The fix, with the exact **UI label** or command.] |
| [Claude changed more than you asked] | [How to discard the changes, for example discard in the diff view or return to your last commit.] |
| [A situation that's risky to fix alone] | Stop, and ask Claude or a teammate before [pushing, deleting]. |

## Using [Tool] with Claude Code

<!-- OPTIONAL. Keep when the tool and Claude Code work together. Describe how they share work, then number the steps. -->

[One or two sentences on how the two tools connect, for example "both work on the same files on disk".]

1. **Create a branch or commit first**, so any experiment can be undone.
2. [Step.]
3. [Step.]
4. Review the changes in [Tool] before you keep them. See [Reviewing AI output](#reviewing-ai-output).

## A typical session

<!-- REQUIRED. Five to eight numbered steps from opening the tool to sharing the result. Short, no new concepts. -->

1. Open [Tool] and [pick the project].
2. [Get up to date, for example fetch or pull.]
3. [Make a branch.]
4. [Do the work, with Claude Code if you like.]
5. [Review.]
6. [Save and share.]

## Tips and gotchas

<!-- REQUIRED. Bolded lead-in, then one or two sentences. Most costly mistakes first. -->

- **[Lead-in].** [One or two sentences.]
- **[Lead-in].** [One or two sentences.]

## Next steps

<!-- REQUIRED. Two to four neighbors a reader would look for next, with relative paths and a reason to go. -->

- [[Neighbor guide]](../[topic]/README.md): [why to read it next]
- [[Tool] quick reference](../../cli/[tool].md): [the same tasks in the terminal]
- [[Official page]]([url]): [for more depth on a topic]
