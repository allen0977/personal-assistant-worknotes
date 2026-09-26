---
name: pa-dates
description: Surfaces dates and the recurring calendar when the user starts a session or asks what is due. Does not send invites.
metadata:
  type: workflow
  version: "1.1"
  scope: personal
---

# Dates

Follow `pa-context`. This skill does not send calendar invites or OS notifications.

If the user is starting the day or asking what they should remember, read `notes/dates.md`, `notes/actions.md`, and `notes/delivery/INDEX.md`. For cadence, read `personal/calendar.md` if that file exists, otherwise `notes/calendar.md`. Do not require the personal folder. Reply with:

- Recurring events that usually fall in this part of the week, labeled as cadence, not as a meeting that already happened
- Due in the next 7 days
- Overdue
- 1-1s with no date on file
- A one-line note if a promotion or concern date exists
- A one-line note if direct-report files are fewer than the headcount. Name the gap. Do not invent the missing people.

Do not dump person files. Do not invent a date. Do not put promotion or concern dates on a shared calendar.
