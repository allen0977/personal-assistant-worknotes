# Privacy

These notes include promotion cases and a possible PIP. Treat the whole `notes/` tree as personnel data.

Privacy is about location and access. It is not a reason to store less. Keep the catalog complete inside `notes/`. See `notes/MAP.md`.

Nothing in this design can hide the folder from your employer if they control the laptop, backups, endpoint agents, or Copilot prompt logs. The goal is to stop **accidental** visibility: teammates, a shared repo, OneDrive, a second VS Code window, a screen share of the wrong folder.

## Hard boundary

| May see it | Must not see it |
|---|---|
| You | Teammates |
| Copilot, only in a window whose workspace is this folder | Copilot in a team-repo window |
| HR, when you deliberately hand them a redacted packet | Slack, email, tickets, PRs, the team skill folder |

Skills live in `skills/`. Data lives in `notes/`. Discovery settings must point at `skills/`, never at `notes/`.

## Do this on the laptop

1. Keep the folder at `~/worknotes`. Not Documents, Desktop, Downloads, iCloud Drive, a repo clone, or a network drive.
2. Open it in its own VS Code window with `code ~/worknotes`. Never add this folder to a team-repo workspace. Never `code --add` it into another window.
3. Do not create a git remote. A local repo with no remote is optional. `git remote -v` must stay empty.
4. Confirm Copilot Chat in a **team** window cannot list files under `~/worknotes`. If it can, this folder is still attached to that workspace. Remove it.
5. Lock the notes tree to your macOS user:

```bash
chmod -R go-rwx ~/worknotes/notes
```

That stops other accounts on the same Mac from reading the notes. It does not stop an admin or MDM.

6. Optional extra lock: FileVault is already the disk-level control on a managed Mac. Do not put the vault in iCloud, Dropbox, or a personal sync client as a workaround.
7. In System Settings, confirm Desktop and Documents is not dumping `~` into iCloud. Get Info on `~/worknotes` and make sure it is On My Mac.
8. When you screen-share, share a team window, not this one.

## Copilot-specific risk

Enterprise Copilot can retain **prompts**. A paste of a PIP email into chat may be logged even when the file never leaves disk. Keep verbatim pastes short. Do not paste medical detail. Check your company’s Copilot data policy before you treat chat as private.

Content exclusion in a GitHub org does **not** protect this folder. Agent mode does not reliably honor those exclusions. Physical separation of the workspace is the control that works.

`chat.agentSkillsLocations` may point at `~/worknotes/skills` so skills load elsewhere. That is acceptable. Do not point it at `~/worknotes/notes`.

## What the agent is forbidden to do

- Write vault content into any other folder, repo, PR, commit, ticket, or message
- Suggest copying notes to Slack, email, or SharePoint
- Add a git remote or push
- Attach this folder to another workspace

If a request would do any of those, it must stop and say so.

## What to do if it leaked

If a note landed in a team repo, a gist, chat, or a shared drive: copy the text out, delete it from the shared place, rotate anything sensitive that was in the paste, and tell HR if a personnel file was exposed. Then find how the folder got attached and remove that path.
