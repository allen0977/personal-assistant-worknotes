# AI pieces

Four layers. Do not merge them. Merging is how token use and privacy leaks grow.

| Layer | File | Loads | Holds |
|---|---|---|---|
| Instructions | `AGENTS.md`, `.github/copilot-instructions.md` | Every chat | Hard rules only |
| Skills | `skills/pa-*/SKILL.md` | When the task matches | Procedures |
| Prompts | `PROMPTS.md`, `EXAMPLES.md` | When you open them | What you type |
| Memory | `notes/`, optional `personal/` | When a skill reads them | Facts |

There is no separate agent runtime. Copilot is the agent. `AGENTS.md` is the always-on instruction file. Skills are the on-demand procedures.

## Closed against similar libraries

Compared with [manager-dot-dev/manager-skills](https://github.com/manager-dot-dev/manager-skills) and [AI-for-engineering-leaders](https://github.com/shiphrahx/AI-for-engineering-leaders).

Those packs advise. This vault records. Advice skills do not belong in the shareable pack, because they are opinion and they do not know this team.

Already covered here: context, meetings, direct reports, 1-1 prep, manager and upward sync, stakeholders, verbatim sources, unofficial promotion evidence, concern evidence, feedback, portfolio, delivery cadence, users, coaching span, dates, integrity, optional Jira lookup.

## Left out on purpose

Hiring, interviews, layoff notes, compensation advice, and generic leadership essays. Use an advice pack in a different window if you want those. Do not copy their output into `notes/` unless you dictate it as your own record.

## Standard

Skills follow the [Agent Skills](https://agentskills.io/specification) layout: `name` matches the folder, `description` says when to use it, templates live in `assets/`.

`bash ./tests/install_check.sh` checks that `--check` does not change permissions and that an unknown flag fails. It does not need extra tools.
