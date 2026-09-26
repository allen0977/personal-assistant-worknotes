# Personal Assistant Worknotes

A public, sanitized starter project for structured worknotes and Copilot skills.

## Purpose

Use this repository to capture reusable context without storing secrets, customer data, credentials, or identifying personal information. Keep private notes in a separate local vault.

## Structure

- `skills/` - reusable Copilot workflow skills
- `notes/` - reviewed, sanitized notes organized by topic or date
- `templates/` - starting points for consistent notes
- `CONTRIBUTING.md` - review and sanitization rules

## Quick start

1. Review `PRIVACY.md` and `SHARE.md`.
2. Install the recommended search tool: `brew install ripgrep`.
3. Copy `templates/worknote.md` into `notes/`.
4. Replace every placeholder with general, non-identifying language.
5. Run the pre-commit checklist in `CONTRIBUTING.md`.
6. Commit only notes that are safe to share publicly.

`ripgrep` (`rg`) is recommended for fast repository searches. The installer
and checks fall back to standard `grep` when `rg` is unavailable.

## Sanitization standard

Do not commit passwords, API keys, tokens, private URLs, customer or employer names, personal contact details, raw logs, internal hostnames, or unredacted screenshots.
