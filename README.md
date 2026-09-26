# Personal Assistant Worknotes

A public, sanitized starter project for structured worknotes and Copilot skills.

This repository is the public starter. A filled vault on your laptop is a different contract. See [CONTRACT.md](CONTRACT.md). Do not commit names into this remote.

## Purpose

Use this repository to capture reusable context without storing secrets, customer data, credentials, or identifying personal information. Keep private notes in a separate local vault.

## Structure

- `skills/` - reusable Copilot workflow skills
- `notes/` - empty templates only in this repository
- `templates/` - starting points for consistent notes
- `CONTRACT.md` - public starter versus private vault
- `DATA.md` - classification, deletion, and incidents
- `CONTRIBUTING.md` - review and sanitization rules

## Quick start

1. Review `CONTRACT.md`, `PRIVACY.md`, and `SHARE.md`.
2. Install the recommended search tool: `brew install ripgrep`.
3. Copy `templates/worknote.md` into a local vault, not into a commit on this remote, if the note will contain names.
4. Replace every placeholder with general, non-identifying language if the note is meant to be public.
5. Run `bash ./tests/publish_check.sh` and the human checklist in `CONTRACT.md`.
6. Commit only notes that are safe to share publicly.

`ripgrep` (`rg`) is recommended for fast repository searches. The installer and checks fall back to standard `grep` when `rg` is unavailable.

## Sanitization standard

Do not commit passwords, API keys, tokens, private URLs, customer or employer names, personal contact details, raw logs, internal hostnames, or unredacted screenshots.

Windows `install.ps1` is unsupported. Use `bash ./install.sh`.
