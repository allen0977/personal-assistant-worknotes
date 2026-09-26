#!/bin/bash
# Fail closed before a public publish. Does not change files.
# Usage: bash ./tests/publish_check.sh

set -euo pipefail
root="$(cd "$(dirname "$0")/.." && pwd)"
fail=0
say() { echo "$*"; }
bad() { echo "FAIL  $*"; fail=1; }

# Literal match. Do not pass notes/** to basic grep; macOS treats * as a regex operator.
need_ignore() {
  if grep -F -q "$1" "$root/.gitignore"; then
    say "ok  gitignore has $1"
  else
    bad "gitignore missing $1"
  fi
}

need_ignore 'personal/'
need_ignore 'notes/**'
need_ignore '!notes/MAP.md'
need_ignore '!notes/INDEX.md'
need_ignore '!notes/README.md'
need_ignore '!notes/.gitkeep'

if [[ -d "$root/.git" ]]; then
  tracked="$(git -C "$root" ls-files \
    'personal' 'personal/*' \
    'notes/people' 'notes/people/*' \
    'notes/meetings' 'notes/meetings/*' \
    'notes/sources' 'notes/sources/*' \
    'notes/drafts' 'notes/drafts/*' \
    'notes/promotions' 'notes/promotions/*' \
    'notes/performance' 'notes/performance/*' \
    'notes/dates.md' 'notes/calendar.md' 'notes/team.md' \
    'notes/focus.md' 'notes/quotes.md' 'notes/actions.md' \
    'notes/inbox.md' \
    2>/dev/null || true)"
  tracked="$(printf '%s\n' "$tracked" | grep -v -E 'notes/(promotions|performance)/INDEX.md$' || true)"
  if [[ -n "$tracked" ]]; then
    bad "private paths are tracked"
    printf '%s\n' "$tracked"
  else
    say "ok  no private paths tracked"
  fi
else
  say "ok  not a git repository; tracked-file check skipped"
fi

if [[ "$fail" -ne 0 ]]; then
  exit 1
fi
say "publish checks passed"
say "A person must still read the diff. This script cannot see a name."
