# Security

This folder is a local manager notebook plus Agent Skills. It is not a certified product, not an HR system of record, and not a substitute for company legal or security review. Use it as a private workspace. Who can see the folder is [PRIVACY.md](PRIVACY.md). This file is what the design does and does not claim.

## What this follows

- [Agent Skills](https://agentskills.io/specification): one folder per skill, `SKILL.md`, `name` matching the folder, trigger in `description`.
- Personal skills prefixed `pa-` so they do not override team skills that share a name.
- Procedures in `skills/`. Data in `notes/`. Skills are safe to copy. Filled notes are not.
- No secrets in skills. Install scripts only symlink skill folders. They do not copy notes and do not touch a team repo.
- Git settings in this workspace disable autofetch, force-push, and parent-folder repo discovery. Do not add a remote.
- Notes default to local disk. Not iCloud, not a shared drive, not the team repository.

## What you must still do

1. Keep the folder on the machine, outside Documents, Desktop, and cloud-synced home folders.
2. `chmod -R go-rwx notes` on macOS or Linux after you put names in notes.
3. FileVault or full-disk encryption on the laptop. This vault does not encrypt files itself.
4. No git remote. If you use local git, `git remote -v` stays empty.
5. Do not publish a filled `notes/` tree. Ship skills plus empty templates only. See SHARE.md.
6. Treat Copilot and any MCP (Jira, AWS) as company-logged. A paste can leave the laptop even when the file does not.
7. Redact tokens, passwords, keys, and customer secrets before a note is written. The skills say this. Check the file.
8. Do not put promotion or performance dates on a shared calendar.
9. Review any extra skill you add. Skills are untrusted instructions. Do not install a third-party skill that runs scripts you have not read.
10. Company policy on personnel files and AI tools wins. If HR or legal forbids local PIP notes, do not use that track.

## What this does not claim

- It cannot hide the folder from an employer that controls the laptop, backups, MDM, or Copilot logs.
- It is not SOC 2, ISO 27001, HIPAA, or GDPR certified.
- It is not legal advice for performance management.
- Content exclusion lists in a GitHub org do not reliably hide this folder from agent mode. Isolation of the window is the control that works.

## If you distribute this

Distribute the zip before anyone has typed names. Recipients run SETUP, then CONFIGURE. Their organization, partners, users, and headcount are answers, not defaults.

If a skill still names a vendor, an org, or a person, that is a defect. Move the fact into notes.
