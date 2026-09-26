# Completion checklist

A green installer is not a finished vault. Keep these four states separate.

## Installed

- [ ] `./install.sh` lists every expected skill as `ok`
- [ ] `notes/INDEX.md` exists
- [ ] `/skills` in this VS Code window shows the `pa-` skills
- [ ] Markdown tables in `notes/` have matching header and divider counts

## Privacy checks

- [ ] Path is `~/worknotes`, or you accept a different local path
- [ ] Installer did not report a cloud-synced path
- [ ] Finder Get Info says On My Mac (manual)
- [ ] `notes` mode is private to you, or you chose not to lock it
- [ ] Git is not a repository, or it is a repository with no remotes

The installer reports these. A plain `./install.sh` changes nothing. Lock only if you want to:

```bash
./install.sh --lock-notes
```

That runs `chmod -R go-rwx` on `notes/` only. It does not touch skills or `personal/`.

## Configuration captured

- [ ] CONFIGURE was asked one field at a time
- [ ] Unknowns are still unknown, not guessed
- [ ] Each integration has partner, product, users, team responsibility, and partner responsibility, or an explicit unknown
- [ ] Person, promotion, and concern files were previewed, then applied only after you said apply
- [ ] Readback included manager, direct reports, promotions, and performance, not only team and portfolio
- [ ] Each linked person or case file exists, and its frontmatter matches the index row
- [ ] Direct-report files match `report_count`, or `notes/team.md` lists an open roster gap. Promotion and concern tracks do not count as the whole team.

## Manual checks remaining

- [ ] Finder Get Info: On My Mac
- [ ] This window is only `~/worknotes`, not a team repo
- [ ] `personal/` is present only on your machine, not in a zip you will share
- [ ] No promotion or concern dates on a shared calendar

Installed plus privacy is not the same as configured. Configured is not the same as the Finder check.
