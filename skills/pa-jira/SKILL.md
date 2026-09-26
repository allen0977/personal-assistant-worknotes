---
name: pa-jira
description: Summarizes Jira work when a Jira tool is already connected. Use when the user asks what someone has open. Do not invent tickets. File only if asked.
metadata:
  type: workflow
  version: "1.1"
  scope: personal
---

# Jira lookup

Follow `pa-context`. This skill has no site URL or project key. Those live in `notes/team.md` under Tracker, if the user stored them.

1. If no Jira tool is connected, say so. Do not invent tickets.
2. Summarize open work in chat.
3. Write a snapshot to a person file only if the user asks. Label it a lookup, not a performance fact.
4. Do not treat velocity or ticket count as a promotion or concern fact.
