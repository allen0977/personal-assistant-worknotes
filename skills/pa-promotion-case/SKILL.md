---
name: pa-promotion-case
description: Files unofficial promotion evidence for a person the user names. Use when logging promotion evidence or asking for a packet. Do not invent a ladder.
metadata:
  type: workflow
  version: "1.1"
  scope: personal
---

# Unofficial promotion cases

Follow `pa-context`. The company may have no official path. Store dated, attributable evidence anyway.

Do not invent a ladder, a level name, or a rubric. Do not assume a count. Add a person only when the user names them.

## Files

- `notes/people/direct-reports/<slug>.md` is the living snapshot, not the packet.
- `notes/promotions/<slug>/case.md` is the thesis.
- `notes/promotions/<slug>/evidence.md` is append-only.
- `notes/promotions/INDEX.md` lists who is on the track.

## Open or update

1. Confirm the person is a direct report. Create the person page first if it does not exist.
2. Follow the write protocol in `pa-context`. Copy `assets/case.md` if missing. Ask for the target in the user's words, the bar they will argue, and who has to be convinced.
3. Set `promotion_track: active` on the person file.

## Evidence

Append a row. Do not rewrite old rows. An outcome the user did not state stays `unknown`. Do not invent impact.
