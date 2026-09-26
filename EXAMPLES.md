# How to use this vault

This file is the walkthrough. Skills are the rules. Notes are your facts. Prompts are what you type in the `~/worknotes` VS Code window, with GitHub Copilot in Agent mode.

A new person should read this after [SETUP.md](SETUP.md) and before they paste names. Then run [CONFIGURE.md](CONFIGURE.md).

## The process

1. Open only this folder: `code ~/worknotes`.
2. Confirm `/skills` lists the `pa-` skills.
3. Run the configure questions. Answers go in `notes/`, never into a skill.
4. Talk in this window for people, meetings, evidence, and dates.
5. Talk in a team-repo window for code. Do not add this folder to that workspace.
6. When you want a live system (Jira, AWS), keep those skills or MCP tools available. File a short snapshot here only if you ask.

Privacy limits *where* a file lives and *who* can open the folder. It does not mean store less. A sweep should cover every row in [notes/MAP.md](notes/MAP.md).

Facts that belong to one team (partners, org name, headcount, who is on a promotion track) are configuration. If you hand this folder to a coworker, hand them the skills and empty notes, not your filled `notes/`. See [SHARE.md](SHARE.md).

## What you can ask

Each block is a type of interaction. Replace angle brackets. Skip a block that does not apply.

### Start a session

```text
What is due in the next 7 days. What is overdue.
Sweep INDEX, dates, delivery, promotions, and performance.
Do not invent unknowns.
```

### Configure the team (once)

```text
Read CONFIGURE.md and notes/team.md.
Ask one group at a time. Write only what I confirm.
Do not suggest partners. Do not invent an org chart.
```

### Log a meeting

```text
Log this 1-1 with <name> on <date>.
Discussion: <paste or bullets>.
Decisions: <list>.
Actions: <owner, due>.
Do not invent attendance.
```

### Ask for a summary, then the exact words

```text
Catch me up on <name>. Use the person file and recent meetings.
```

```text
Show the email from <date> as written. Quote ## Verbatim. Do not paraphrase.
```

If there is no source file, the agent should say so.

### Check the catalog

```text
Run pa-integrity. Report drift only. Do not invent missing facts.
Repair index rows only if I say repair.
```

### Track current work

```text
Update <name>. Now they own <work>. Blocker: <blocker or none>.
```

```text
Using pa-jira, list open issues for <name>.
Summarize in chat. File a short snapshot on their person page only if I say file it.
Do not copy that into a promotion or performance file unless I say so.
If Jira is not connected, say so. Do not invent tickets.
```

### Users of the product

```text
Log user feedback. Role: <role>. Product: <owned name or partner name>.
Their words: <quote>.
What I think they need: <translation>.
Keep those two separate.
```

### Standup, review, retro

Log these even if you only attend.

```text
Log today's standup. Blockers: <list>. Now for <name>: <one line>.
Do not invent the rest of the team.
```

```text
Log the review on <date>. Shown: <what>. In the room: <who>.
They said: <quote>. Still not done: <item>.
```

```text
Log the retro on <date>. Keep: <themes>. Try: <item, owner>.
Concerns stay delivery concerns unless I send one to the performance track.
```

### Delivery cadence (only if you run one)

```text
Open this cycle. Goal a user would recognize: <goal>.
User-facing outcome: <what they can do at review>.
Impediment: <text>. Kind: <team | user-access | vendor | data-model | environment | decision>.
Owner: <name>.
```

### Manager and focus

```text
Log my manager sync on <date>.
They asked me to focus on <items>.
Open commitment I made: <item>.
Update notes/focus.md.
```

### Promotion evidence (only people you name)

```text
These people are on an unofficial promotion track: <names>.
There may be no company path. Ask what the bar is before you invent one.
```

```text
Log promotion evidence for <name>.
Date: <date>. Outcome: <what shipped or who used it>.
Scope: <what they owned>. Source: <meeting, email, or ticket key>.
```

### Performance concern (only people you name)

```text
<name> is a performance concern. Not a PIP until I say HR opened one.
Expectation already given on <date>: <text>.
What happened on <date>: <observable fact>.
Do not invent motive.
```

```text
Draft a packet in chat from dated rows only.
Do not say a PIP is open.
```

### Dates

```text
Remind me. Add <date>: <what>, kind <1-1 | delivery | user-review | vendor | manager>.
These only surface when I open this window or ask what is due.
Do not put this on a shared calendar.
```

### Org chart (later is fine)

```text
Read notes/org/INDEX.md.
I will dictate the chart. Ask one level at a time.
Do not guess reporting lines.
```

## What the agent should refuse

- Writing notes into a team repo, PR, Slack, or email unless you ask for a redacted draft
- Adding this folder to another workspace
- Inventing people, quotes, partners, or a ladder
- Using velocity as performance evidence
- Treating a Jira delay as a PIP fact unless you send it there
- Filling an unknown because an example in this file used a placeholder

## Design, from the work that produced this folder

This vault started as a personal manager assistant next to team-curated Copilot skills. The constraints that survived:

- Skills follow the Agent Skills spec (`SKILL.md` plus a matching folder name). Prefix `pa-` so they do not override team skills.
- Procedures live in `skills/`. Data lives in `notes/`. Mixing them dumps personnel files into every skill run.
- Summary and verbatim are two layers. Living pages answer "catch me up." Source files answer "the email as written."
- Promotion and performance are separate tracks. Dates and facts, not motive. Status stays "concern" until a PIP is actually opened.
- Privacy is workspace isolation: dedicated VS Code window, no git remote, not iCloud, notes not pointed at by `chat.agentSkillsLocations`. Employer laptop access and Copilot prompt logs are still possible. Do not overclaim.
- Team shape is configuration. Partners, org name, user roles, and headcount are asked in CONFIGURE.md and stored in notes. Skills stay reusable for another manager.
- Live systems (Jira, AWS) are optional tools. A skill can say how to query them. MCP or a plugin does the query. The vault stores only the snapshot you ask to keep.

Public skill libraries (engineering-manager packs, prompt libraries, official Agent Skills catalogs) teach conversations. They are not a private catalog. Borrow advice skills if you want. Do not let them write `.agents/em-context.md` into a team repo, and do not let them become the system of record for people.

## Files a new person should open, in order

| File | Why |
|---|---|
| [SETUP.md](SETUP.md) | Folder on the Mac, VS Code, load skills |
| [PRIVACY.md](PRIVACY.md) | What isolation does and does not do |
| [CONFIGURE.md](CONFIGURE.md) | Questions that make the vault specific |
| [FIRST_START.md](FIRST_START.md) | Short prompt sequence for the first hour |
| This file | How to talk to it after that |
| [PROMPTS.md](PROMPTS.md) | Extra phrases |
| [notes/MAP.md](notes/MAP.md) | Every track that must stay complete |
| [SHARE.md](SHARE.md) | What you may copy for a coworker |
