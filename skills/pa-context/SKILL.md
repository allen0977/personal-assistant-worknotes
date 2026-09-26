---
name: pa-context
description: Vault contract for paths, privacy, and summary versus verbatim. Use at the start of a people, meeting, or notes task, or when asked where notes live.
metadata:
  type: workflow
  version: "1.1"
  scope: personal
---

# Private manager vault

These notes are personal management memory. They are not team documentation and not an HR system of record.

## Locate the vault

Stop at the first hit.

1. A `notes/INDEX.md` in the current workspace.
2. The parent of this skill's directory, if that parent contains `notes/INDEX.md`.
3. `~/worknotes/notes`.

If none exist, stop. Tell the user to open `~/worknotes` in its own VS Code window. Do not create the vault inside a team repo, Documents, Desktop, iCloud Drive, or a company-synced folder.

If the workspace is a team repository and the notes root is not readable, stop. Do not write team notes into that repository.

## Personal overlay

If `personal/` exists next to `notes/`, read `personal/context.md` and `personal/calendar.md` before asking questions those files already answer. Treat them as confirmed for this user. Do not copy them into a skill. Do not require the folder.

A headcount is not a roster. People on a promotion or concern track are not the rest of the team. If person files are fewer than the count, ask for the missing names. Do not treat setup as complete while that gap is open.

Label overlay facts as already in overlay, needs confirmation, will be copied into notes, or stays only in the overlay.

## Hard rules

- Write only under the notes root.
- Never write vault content into a repository, pull request, commit, ticket, or chat destined for someone else.
- Never add a git remote, push, or copy the vault to email, Slack, Teams, or SharePoint.
- Never add this folder to another workspace.
- Do not invent people, quotes, dates, owners, attendance, or sentiment.
- Do not answer about a person, focus, or open work from chat memory if a note file exists. Read the file.
- If `last_touched` is older than 14 days, say the snapshot may be stale.
- If two files disagree, the source file wins for wording. The person file wins for current work. Repair the index. Mention the conflict in one sentence.
- Exact words, quote, the email, as written, or verbatim means open the source and quote `## Verbatim`. If none exists, say so.
- Catch me up or summary means abstracts and living pages. Do not dump raw emails unless asked.
- Redact tokens, passwords, keys, and customer secrets before writing. Say that you redacted them.
- Do not store medical, family, or protected-class detail unless the user explicitly dictates it.
- Compensation, ratings, and formal performance language go under `## Sensitive` only when the user asks to record them. Add one line: stored at your request; work Copilot may retain this prompt under company policy.
- An outward draft stays in chat unless the user says to save it. Saved drafts go in `notes/drafts/`.

## Values

- `unknown` means it may exist and has not been supplied.
- `none` means the user confirmed there is nothing to record.
- `later` means deferred on purpose. Keep it on the gap list.

## File roles

Living pages update in place: person files, `team.md`, `focus.md`, `INDEX.md`. Meetings, sources, and evidence append. Do not rewrite history. After a write, update the matching index.

Copy `skills/*/assets/` when creating a record. Meeting kinds live in `pa-meetings`. Do not keep a second kind list.

## Write protocol

Use this for a new person, manager, stakeholder, promotion case, or concern. Other skills point here. Do not copy these steps into them.

1. Show the path and the index row. Name fields that stay unknown.
2. Write only after the user says apply. Write only under `notes/`.
3. Copy the asset template. Fill only confirmed fields.
4. Update the matching index.
5. Reopen the file and the row. If the path is missing or the name does not match, report it. Do not invent a fix.

Ordinary team, cadence, portfolio, and date fields may be previewed as one group. Sensitive records stay one preview each.

## Confirm

After writes, reply with paths touched, decisions recorded, actions recorded, and anything refused or redacted. Do not paste full note files back unless asked.
