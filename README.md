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
2. Copy `templates/worknote.md` into `notes/`.
3. Replace every placeholder with general, non-identifying language.
4. Run the pre-commit checklist in `CONTRIBUTING.md`.
5. Commit only notes that are safe to share publicly.

## Sanitization standard

Do not commit passwords, API keys, tokens, private URLs, customer or employer names, personal contact details, raw logs, internal hostnames, or unredacted screenshots.
