---
name: pa-direct-reports
description: Tracks each direct report, current work, and 1-1 continuity. Use when the user names a report or asks what someone is working on. Asks for missing roster names.
metadata:
  type: workflow
  version: "1.1"
  scope: personal
---

# Direct reports

Follow `pa-context`. Direct reports live in `notes/people/direct-reports/<slug>.md`.

## Roster

A promotion track and a concern track are not the team. If `notes/team.md` or `personal/context.md` gives a headcount, compare it to files in `notes/people/direct-reports/`.

If files are fewer than the count, say how many are missing and ask for the next name. One name at a time. Do not invent a name. `skip` is allowed, but then record `roster gap: N unnamed` on `notes/team.md` and mention it at session start until the user names them or lowers the count.

Collect spelling before reuse. One canonical name per person.

## Add or correct a person

1. Ask for a name if you do not have one. Never create a file from a guessed nickname.
2. Slug is lowercase, hyphenated, unique.
3. Follow the write protocol in `pa-context`. Copy `assets/direct-report.md`.
4. To deactivate, set `status: inactive`. Do not delete the file.

## Prep a 1-1

Read the person file, open actions, and the latest 1-1 if one exists. Reply with what is still open, what is stale, and one question the user has not asked yet. Do not invent the other person's view. Save the agenda only if asked.

## Update current work

The Now section is a snapshot, not a journal. Replace Now when the user states current work. Do not append a transcript. If Now is unknown, say so.
