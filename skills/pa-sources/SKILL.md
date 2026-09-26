---
name: pa-sources
description: Stores verbatim emails and quotes. Use when the user pastes a source or asks for exact words.
metadata:
  type: workflow
  version: "1.1"
  scope: personal
---

# Sources

Follow `pa-context`.

1. Copy `assets/source.md` to `notes/sources/YYYY/YYYY-MM-DD-<kind>-<slug>.md`. Kind is `email`, `chat`, `quote`, `doc`, or `other`. Do not overwrite.
2. Put exact wording under `## Verbatim`. Do not clean it up. Redact secrets and say so.
3. Put a short summary under `## Abstract`.
4. If the user wants the line findable alone, append it to `notes/quotes.md` with a link to the source file.
5. Add a row to Sources in `notes/INDEX.md`.
6. A summary request uses the abstract. A verbatim request quotes `## Verbatim` unchanged. If no source exists, say so. Do not invent a quote.
