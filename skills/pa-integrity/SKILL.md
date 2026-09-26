---
name: pa-integrity
description: Compares indexes to files and reports drift. Use for an integrity sweep or health check. Repair only if asked.
metadata:
  type: workflow
  version: "1.1"
  scope: personal
---

# Integrity sweep

Follow `pa-context`. This skill finds drift. It does not fill unknowns. It does not delete files.

Read `notes/MAP.md`, then the indexes it names, then the folders those indexes point at.

Report only rows you can verify by opening a file.

1. Index row with no file.
2. File with no index row.
3. Date row with an empty source, or a source path that does not exist.
4. `last_touched` older than 14 days on a living page the user still treats as current. Say it may be stale. Do not refresh the date unless they confirm the page is still true.
5. Promotion or performance folder with no row, or a row with no folder. Also check the manager file and each direct-report file against `notes/INDEX.md`.
6. Frontmatter mismatch. The name or path in an index row does not match the file. A linked path outside `notes/` is a defect.
7. A skill file that names a person, a headcount, a partner, or an organization. Quote the path. Do not edit the skill unless asked.
8. Roster gap: `report_count` higher than person files. Do not invent names.
9. Related living pages that disagree, such as organization in `team.md` still unknown in `INDEX.md`.

Default is report only. Repair index rows only if the user says repair. The source file wins for wording. Do not invent a person to fill a blank row.

Empty promotion, performance, and org indexes are valid. Do not dump verbatim sources.
