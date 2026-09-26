# Habits

How to use the vault after setup. Skills stay procedures. Facts stay in `notes/`.

## Open

- Start at `notes/INDEX.md`. It links to current pages and track indexes.
- In VS Code, Cmd+P opens a file by path, such as `team.md`.
- Keep this folder in its own VS Code window. Do not add it to a team workspace. Do not copy note contents into team tools. Copilot prompts may still be retained under company policy.

## Write

- Edit personal facts only under `notes/`. Treat `skills/` as procedures and `skills/*/assets/` as templates.
- Use `unknown` rather than guessing.
- Update living pages in place: person files, `team.md`, `focus.md`, `INDEX.md`.
- Append to meetings, sources, and evidence logs. Do not rewrite history.
- When you add a record, update the matching index too.
- Use Markdown preview (Cmd+Shift+V) to check tables and links before you finish.

## Prompt

A precise edit is safer than a wide one.

```text
Update only the Users field in notes/team.md with these confirmed roles.
Preserve unknowns. Update the relevant index if needed. Read back what changed.
```

Do not ask Copilot to “clean up” a file. Say the field, the file, and what stays unknown.

Skill descriptions and AGENTS.md load on every chat. A skill body loads only when that skill is used. Templates load only when creating a record.

Keep a new rule in the one skill that owns it. Do not copy it into AGENTS.md and every other skill. That is how token use grows, and how two lists drift apart.
