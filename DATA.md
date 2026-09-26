# Data handling

Not a certification. Not legal advice. Company policy wins.

## Classification

| Class | Examples | Where it may live |
|---|---|---|
| Public | Skills, this file, empty templates | The public starter |
| Personal | Your calendar overlay, names you have not put in notes | `personal/` on the laptop only |
| Personnel | Direct reports, feedback, promotion evidence, concern notes, quotes | `notes/` on the laptop only |
| Secret | Tokens, passwords, keys, customer secrets | Nowhere. Redact before writing |

Do not put personnel or secrets in a skill, a prompt example, or a commit.

## Retention

Keep a note while it still changes a future conversation, a case, or your focus. Do not keep color commentary you did not ask to store.

There is no automatic expiry. You delete. The agent does not delete history unless you say to.

## Deletion

- A person leaving the team: set `status: inactive`. Do not delete the file if you still need the history.
- To erase: delete the person file, their meeting and source files, and the index rows. Then search the vault for the name.
- A public accidental commit: treat it as an incident, below. Deleting the file in a later commit does not remove it from history.

## Backup and recovery

This folder does not back itself up. If you copy it, copy to a disk you control, not to a shared drive or a repo with a remote.

Recovery is the copy you made. There is no vendor restore. If you have no copy, the notes are gone.

## Incident

If personnel notes were committed, pushed, pasted into a team chat, or opened in a team-repo Copilot window:

1. Stop pushing.
2. Remove the remote from the laptop copy if it has names.
3. Assume the content was seen. A force-push does not guarantee deletion on GitHub.
4. Tell the people your company requires you to tell. This file cannot name that process.
5. Rotate any token that was in the file.
6. Write down what left, when, and where. Keep that note on the laptop, not in the public starter.

Copilot prompt logs can retain a paste even when the file never left the disk. That is a leak of the prompt, not of the git history.
