---
name: pa-performance-concern
description: Files dated performance-concern evidence for a person the user names. Use when logging a miss or asking for a timeline. Do not invent a PIP.
metadata:
  type: workflow
  version: "1.1"
  scope: personal
---

# Performance concern and possible PIP

Follow `pa-context`. This is documentation of observable work, not a verdict and not the HR system of record.

Do not assume a count. Add a person only when the user names them. Do not put promotion-track people in these files. Status stays concern until the user says a PIP is open.

This is not legal advice. Before a PIP is opened, the user should use their company's HR process.

Store only what a third party could check: the expectation, the due date, what was delivered or missed, coaching already given, the employee's stated reason if recorded, and factual impact.

Do not store inferences about laziness, attitude, health, family, or protected class. If the user dictates a motive, keep it as stated by user. The miss is the evidence.

## Files

- `notes/performance/<slug>/concern.md`
- `notes/performance/<slug>/evidence.md` append-only
- `notes/performance/INDEX.md`

## Open

1. Confirm the person is a direct report and that the user wants this track.
2. Follow the write protocol in `pa-context`. Copy `assets/concern.md` and `assets/evidence-header.md`.
3. Ask for expectations in force. If none were written, say so. That is a gap.
4. Do not write that a PIP is open unless the user says one is open.
5. Set `performance_track: concern` on the person file.
