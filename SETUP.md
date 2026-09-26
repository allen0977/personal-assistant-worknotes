# Setup

Mac. VS Code. GitHub Copilot. Clone this repository into a local folder.

## 1. Place the folder

Clone or unzip so the project folder contains `skills/` and `notes/` directly, not a nested copy of the repository.

Get Info. It must say On My Mac, not iCloud. Not Documents, Desktop, or a repo clone.

```bash
code /path/to/personal-assistant-worknotes
```

Open this folder in its own VS Code window when working with local notes.

## 2. Confirm skills

```bash
bash ./install.sh --check
```

`install.sh` may not be executable in the zip. That is expected. Use `bash ./install.sh`. Optional: `chmod +x install.sh`.

`--check` changes nothing. `--lock-notes` locks `notes/` only. `--first-run` is check plus lock. `--link-skills` is only if your client scans `~/.copilot/skills`.

People who change `install.sh` or templates should review the contribution and sanitization rules first.

Then in Copilot Chat, type `/skills`. You should see the `pa-` skills.

In Copilot Chat, type `/skills`. You should see the `pa-` skills, including `pa-delivery`, `pa-integrity`, and `pa-dates`.

This window loads `skills/` from `.vscode/settings.json`.

To see the same skills from other windows, add this to **User** settings only, not a team repo:

```json
"chat.agentSkillsLocations": {
  "/path/to/personal-assistant-worknotes/skills": true
}
```

Point that setting at `skills`, never at `notes`.

If a team window still cannot see the skills:

```bash
chmod +x /path/to/personal-assistant-worknotes/install.sh
/path/to/personal-assistant-worknotes/install.sh --link
```

That symlinks skills into `~/.copilot/skills`. It does not copy notes.

## 3. Lock the notes

```bash
./install.sh --lock-notes
```

That is the only permission change. It touches `notes/` only. A plain `./install.sh` changes nothing.

This repository is intended to have a GitHub remote. Keep only sanitized content in commits and review the diff before pushing.

Keep the local notes folder on a device location you control, not a shared or cloud-synced folder.

## 4. What this cannot do by itself

Copilot will not ping you on a date unless you open this window or ask. `pa-dates` keeps the list. A session-start prompt surfaces it. Do not put promotion or PIP dates on a shared company calendar.

Review [CONTRIBUTING.md](CONTRIBUTING.md) before adding notes. A passing installer is not a substitute for reviewing content before publication.
