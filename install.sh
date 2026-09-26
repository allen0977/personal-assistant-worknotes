#!/bin/bash
# Read-only preflight unless --lock-notes, --link, or --first-run.
# Usage:
#   bash ./install.sh
#   bash ./install.sh --check
#   bash ./install.sh --lock-notes
#   bash ./install.sh --link-skills
#   bash ./install.sh --first-run

set -euo pipefail

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/homebrew/bin:${PATH:-}"

root="$(cd "$(dirname "$0")" && pwd)"
skills="$root/skills"
notes="$root/notes"
expected_path="${HOME}/worknotes"
expected=(pa-context pa-meetings pa-direct-reports pa-manager pa-stakeholders pa-sources pa-promotion-case pa-performance-concern pa-feedback pa-portfolio pa-delivery pa-scrum pa-users pa-coaching-span pa-dates pa-integrity pa-jira)
link=0
lock=0
first=0

usage() {
  echo "Usage: bash $0 [--check] [--lock-notes] [--link-skills] [--first-run]"
}

for arg in "$@"; do
  case "$arg" in
    --check|--preflight) ;;
    --link|--link-skills) link=1 ;;
    --lock-notes) lock=1 ;;
    --first-run) lock=1; first=1 ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown option: $arg" >&2; usage >&2; exit 2 ;;
  esac
done

need() {
  if ! command -v "$1" >/dev/null 2>&1; then
    echo "Missing required command: $1" >&2
    echo "Install it, or run with a complete macOS PATH." >&2
    echo "Expected PATH includes /usr/bin /bin /usr/local/bin /opt/homebrew/bin." >&2
    exit 1
  fi
}

echo "worknotes root: $root"
need bash
need dirname
need grep
need python3
need chmod
need ls
need uname
need stat
echo "deps: bash grep python3 dirname ok"
echo "bash: $BASH_VERSION"

if [[ ! -x "$0" && ! -x "$root/install.sh" ]]; then
  echo "install.sh is not executable. That is fine. Use: bash ./install.sh"
fi

if [[ "$root" == "$expected_path" ]]; then
  echo "path: expected ($expected_path)"
else
  echo "path: $root"
  echo "      expected $expected_path if this is the personal Mac vault"
fi

os="$(uname -s)"
echo "os: $os"
if [[ "$os" != "Darwin" && "$os" != "Linux" ]]; then
  echo "os warning: not macOS or Linux. Commands may differ."
fi

if [[ "$root" == *"/Library/CloudStorage/"* ]] || [[ "$root" == *"/iCloud Drive/"* ]] || [[ "$root" == *"/OneDrive"* ]]; then
  echo "path warning: looks cloud-synced. Prefer On My Mac. Confirm in Finder Get Info."
else
  echo "path: not an obvious cloud path. Still confirm Finder Get Info says On My Mac."
fi

for name in "${expected[@]}"; do
  skill_file="$skills/$name/SKILL.md"
  if [[ ! -f "$skill_file" ]]; then
    echo "Missing $skill_file" >&2
    exit 1
  fi
  if ! grep -q "^name: ${name}$" "$skill_file"; then
    echo "$name SKILL.md name does not match its folder" >&2
    exit 1
  fi
  echo "ok  $name"
done

if [[ ! -f "$notes/INDEX.md" ]]; then
  echo "Missing notes/INDEX.md" >&2
  exit 1
fi

indexes=(INDEX.md MAP.md team.md calendar.md dates.md portfolio/INDEX.md delivery/INDEX.md promotions/INDEX.md performance/INDEX.md org/INDEX.md)
echo
echo "indexes:"
populated=0
for rel in "${indexes[@]}"; do
  if [[ -f "$notes/$rel" ]]; then
    echo "ok  notes/$rel"
  else
    echo "missing  notes/$rel"
  fi
done
if [[ -d "$notes/people/direct-reports" ]] && ls "$notes/people/direct-reports"/*.md >/dev/null 2>&1; then
  populated=1
fi
if [[ "$populated" -eq 1 ]]; then
  echo "notes: already populated"
else
  echo "notes: templates only, or no person files yet"
fi

echo
echo "notes permissions (reported only unless --lock-notes):"
ls -ld "$notes"
if [[ "$os" == "Darwin" ]]; then
  mode="$(stat -f "%Lp" "$notes")"
else
  mode="$(stat -c "%a" "$notes")"
fi
echo "notes mode: $mode"
if [[ "$mode" == "700" || "$mode" == "600" ]]; then
  echo "notes privacy: private to owner"
else
  echo "notes privacy: not locked. Optional: bash ./install.sh --lock-notes"
fi

echo
echo "markdown tables and index links:"
python3 - "$notes" << 'PY'
import re, sys
from pathlib import Path
root = Path(sys.argv[1])
bad = 0

def is_divider(line):
    if not line.startswith("|"):
        return False
    cells = line.strip().strip("|").split("|")
    if not cells:
        return False
    for cell in cells:
        s = cell.strip()
        if not s or set(s) - set("-:"):
            return False
        if s.count("-") < 3:
            return False
    return True

for path in sorted(root.rglob("*.md")):
    lines = path.read_text().splitlines()
    for i, line in enumerate(lines[:-1]):
        if not line.startswith("|") or is_divider(line):
            continue
        nxt = lines[i + 1]
        if not is_divider(nxt):
            continue
        if line.count("|") != nxt.count("|"):
            print(f"mismatch  {path}:{i+1} header {line.count('|')} divider {nxt.count('|')}")
            bad += 1

for name in ("INDEX.md", "promotions/INDEX.md", "performance/INDEX.md", "portfolio/INDEX.md"):
    p = root / name
    if not p.exists():
        continue
    text = p.read_text()
    for m in re.finditer(r"\[[^\]]+\]\(([^)]+\.md)\)", text):
        rel = m.group(1)
        target = (p.parent / rel).resolve()
        try:
            target.relative_to(root.resolve())
        except ValueError:
            print(f"outside  {p} -> {rel}")
            bad += 1
            continue
        if not target.exists():
            print(f"missing-link  {p} -> {rel}")
            bad += 1

team = root / "team.md"
people = root / "people" / "direct-reports"
if team.exists() and people.exists():
    t = team.read_text()
    m = re.search(r"report_count:\s*(\d+)", t)
    if not m:
        m = re.search(r"direct reports[^\n]*\b(\d+)\b", t, re.I)
    files = [x for x in people.glob("*.md") if x.name != "INDEX.md"]
    if m:
        n = int(m.group(1))
        if len(files) < n:
            print(f"roster-gap  report_count={n} files={len(files)}")
        else:
            print(f"ok  roster {len(files)}/{n}")

if bad == 0:
    print("ok  tables and linked files")
else:
    sys.exit(1)
PY

echo
if [[ -d "$root/.git" ]]; then
  echo "git: this folder is a repository."
  remotes="$(git -C "$root" remote -v 2>/dev/null || true)"
  if [[ -z "$remotes" ]]; then
    echo "git remotes: none. That is what we want."
  else
    echo "git remotes: present. Remove them. This vault should not have a remote."
    echo "$remotes"
  fi
else
  echo "git: not a repository. That is fine."
  echo "      The check is not a failed remote. There is no repo, so there is no remote list."
fi

echo
echo "status:"
echo "  Installed: yes (skills and indexes present)"
echo "  Notes locked: $([[ "$mode" == "700" || "$mode" == "600" ]] && echo yes || echo no)"
echo "  Skills verified: yes"
echo "  Finder check: manual"
echo "  See CHECKLIST.md for configuration and roster."
if [[ "$first" -eq 1 ]]; then
  echo "  Next: open this folder in its own VS Code window and run CONFIGURE.md"
fi

echo
echo "Dedicated window: open this folder by itself. Do not add it to a team-repo workspace."

if [[ "$lock" -eq 1 ]]; then
  echo
  echo "lock-notes: will run chmod -R go-rwx on this folder only:"
  echo "  $notes"
  echo "It does not touch skills, personal/, or any other directory."
  chmod -R go-rwx "$notes"
  echo "lock-notes: done."
fi

if [[ "$link" -eq 1 ]]; then
  dest="${HOME}/.copilot/skills"
  mkdir -p "$dest"
  for name in "${expected[@]}"; do
    source="$skills/$name"
    link_path="$dest/$name"
    if [[ -e "$link_path" ]]; then
      echo "skip  $link_path already exists"
      continue
    fi
    ln -s "$source" "$link_path"
    echo "link  $link_path -> $source"
  done
  echo "Symlinks point at this folder. Edit skills here, not in ~/.copilot/skills."
else
  echo
  if [[ "$lock" -eq 0 ]]; then
    echo "No files or permissions changed. Modes: --check --lock-notes --link-skills --first-run"
  fi
fi
