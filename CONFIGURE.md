# Configure

Run this after [SETUP.md](SETUP.md), in the `~/worknotes` window. The agent asks. You answer. It writes `notes/`. It does not write your answers into a skill.

Ask by group, not 30 separate turns. Labeled fields still. Skip is valid.

- `unknown` — it may exist; you have not supplied it
- `none` — you confirmed there is nothing to record
- `later` — deferred on purpose; keep it on the gap list

If `personal/context.md` or `personal/calendar.md` exists, start each group with: already in overlay / needs confirmation / will be copied into notes / stays only in the overlay. Do not copy overlay facts into a skill. Do not skip confirmation just because the overlay has a value.

```text
Read CONFIGURE.md, pa-context, notes/team.md, and personal/context.md if that file exists.
Ask one group at a time. Show the labeled fields for that group. Wait for answers.
Write only what I confirm. unknown, none, and later are not interchangeable.
If I name a partner without a product, record partner and leave product unknown.
For team, cadence, portfolio, and dates: show one preview of the notes files you would change, then apply when I say apply.
For a person, manager, promotion case, or performance concern: preview that record alone. Apply only after I say apply.
After the last group, run pa-integrity. Read back INDEX, team, me, promotions, performance, and any roster gap.
```

## Team

1. `organization:` who this team serves
2. `users:` role names of the people who use the software
3. `delivery_role:` Scrum Master, tech lead, none, or other
4. `standup:` run | attend | neither
5. `review:` run | attend | neither
6. `retro:` run | attend | neither
7. `planning:` run | attend | neither
8. `refinement:` run | attend | neither
9. `report_count:` number of direct reports, or skip
10. `levels:` span of levels, no names yet

## Portfolio

11. `owned:` product names this team owns end to end, one per line
12. Each integration is five fields, one partner at a time:
    `partner:`
    `product:` or unknown
    `users_do:`
    `team_owns:`
    `partner_owns:`
13. `done_means:` what done looks like for a user
14. For each product: `bus_factor:` who else could keep it running, or unknown

## Operating

16. `coverage_delivery:` who runs cadence if you are out
17. `coverage_users:` who users contact if you are out
18. `coverage_manager:` who your manager contacts if you are out
19. `can_decide:`
20. `must_escalate:`
21. `tracker:` tool name, or none. No URL unless you dictate one

## People tracks

22. `promotion:` names, or none. Do not assume a count
23. `concern:` names, or none. Status is concern until you say a PIP is open
24. `roster:` every other direct report. Promotion and concern names are not the whole team. If `report_count` is 5 and three names are on a track, ask for the other two, one name at a time. `skip` leaves a roster gap. A gap is not setup complete. Do not invent names. Preview each person file before apply.
25. `manager:` name, or unknown

## Organization

26. `org_chart:` now | later
27. If now: `reports_into:` and `accepts_done:`

## Dates

28. `one_on_one_cadence:`
29. `delivery_dates:` or none
30. `other_windows:` or none

Do not add promotion or concern dates unless you dictate them.

## Check

Read these back. Do not stop at team and portfolio.

```text
Read back, one section at a time, and list unknowns. Do not fill them.
- notes/team.md
- notes/portfolio/INDEX.md
- notes/org/INDEX.md
- notes/dates.md
- notes/people/manager/ and the manager row in notes/INDEX.md
- notes/people/direct-reports/ and the direct-reports table in notes/INDEX.md
- roster gap: if report_count is higher than person files, list the missing count. Do not call configuration complete.
- notes/promotions/INDEX.md
- notes/performance/INDEX.md
For each person, promotion, and concern row, open the linked file.
Confirm the path exists, the frontmatter name matches the row, and the file lives under notes/.
Flag a missing file, a row with no file, or a file with no row.
Confirm no skill file contains a partner name, an org name, or a headcount.
Then say which of these are still open: installed, privacy, configuration, Finder On My Mac.
```
