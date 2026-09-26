---
name: pa-meetings
description: Files meeting minutes, decisions, and actions. Use when the user logs a meeting, 1-1, standup, review, or retro.
metadata:
  type: workflow
  version: "1.1"
  scope: personal
---

# Meetings

Follow `pa-context`. If that skill is not loaded, obey `AGENTS.md` before writing.

Kinds: `1-1`, `manager-sync`, `standup`, `group`, `review`, `retro`, `planning`, `refinement`, `checkin`, `adhoc`.

A presentation is `review`. An upward review is `manager-sync`. A leads meeting is `group`. Do not invent an organization name to pick a kind.

## Steps

1. Read `notes/me.md` and `notes/INDEX.md`.
2. Identify date, kind, and attendees. If the date is missing, ask. Do not assume today unless the user said today or just now.
3. Resolve named people against `notes/people/`. If a name has no file, ask the relationship before creating one. Attendees with no page stay in the meeting file only.
4. Copy `assets/meeting.md` to `notes/meetings/YYYY/YYYY-MM-DD-<kind>-<slug>.md`. Do not overwrite. Use an addendum or a `-2` suffix.
5. Discussion is themes and positions. Attribute a position only if the user attributed it.
6. Decisions are only what the user described. A leaning is not a decision.
7. Actions need an owner and a due date, or `none`. "We should" with no owner is not an action.
8. Append each decision to `notes/decisions.md`. A reversal is a new row.
9. Add each action to `notes/actions.md` and to Commitments on known person files.
10. Update a person snapshot only when the user stated current work, a blocker, or a handoff. Stamp `last_touched`.
11. If kind is `manager-sync`, update `notes/focus.md` only for a focus change the user stated or accepted.
12. If kind is `standup`, `review`, `retro`, `planning`, `refinement`, or `checkin`, also follow `pa-delivery`. A group meeting is one file. A 1-1 is one file per person. Read `personal/calendar.md` if it exists, otherwise `notes/calendar.md`. Do not invent that today's instance already happened.
13. Update Recent meetings and Open actions in `notes/INDEX.md`.
14. If the user pasted a transcript, keep it under `## Raw notes` after redacting secrets. If they asked to keep exact wording, also file it with `pa-sources`.

## Quality bar

Do not smooth conflict into false agreement. Do not invent attendance.
