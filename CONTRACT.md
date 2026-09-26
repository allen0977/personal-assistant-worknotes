# Two contracts

This tree can be one of two things. It cannot safely be both at once.

## Public starter

A GitHub repository of skills, instructions, and empty templates.

- A remote is allowed.
- Tracked notes may be only `notes/README.md`, `notes/MAP.md`, `notes/INDEX.md`, and `notes/.gitkeep`.
- No names, employer, customer, ticket URL, or personnel file.
- `personal/` is never tracked.
- A human reads the diff before every publish. See the checklist below.

## Private vault

The folder on your laptop, usually `~/worknotes`, after you have typed names.

- No git remote. A remote plus person files is a failed check, not a warning.
- `notes/` and `personal/` stay on this machine.
- Do not copy filled notes into the public starter.
- Copilot in this window can read notes. Copilot in a team-repo window must not.

If you cloned the public starter and then filled notes in that clone, stop. Move the filled notes to a folder that is not that clone, and remove the remote from any copy that holds names.

## Publish checklist

Run this in the public starter, not in the laptop vault.

```bash
bash ./tests/publish_check.sh
git diff --cached --stat
```

Then a person reads the diff and confirms:

- [ ] No `personal/`
- [ ] No person, meeting, source, promotion, or performance file
- [ ] No name, employer, customer, host, or ticket URL
- [ ] No token, key, or password
- [ ] Only skills, instructions, and empty templates

`publish_check.sh` cannot see a person's name. The human step is required.
