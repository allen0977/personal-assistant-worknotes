#!/bin/bash
# Fail closed before a public publish. Does not change files.
# Usage: bash ./tests/publish_check.sh

set -euo pipefail
root="$(cd "$(dirname "$0")/.." && pwd)"
fail=0
say() { echo "$*"; }
bad() { echo "FAIL  $*"; fail=1; }

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
  allowed='notes/.gitkeep
notes/README.md
notes/MAP.md
notes/INDEX.md'
  tracked="$(git -C "$root" ls-files 'notes' 'notes/*' 'notes/**' 'personal' 'personal/*' 2>/dev/null || true)"
  extra=""
  while IFS= read -r path; do
    [[ -z "$path" ]] && continue
    case "$path" in
      personal|personal/*)
        extra="$extra$path"$'\n'
        ;;
      notes/.gitkeep|notes/README.md|notes/MAP.md|notes/INDEX.md)
        ;;
      notes|notes/)
        ;;
      *)
        extra="$extra$path"$'\n'
        ;;
    esac
  done <<< "$tracked"
  extra="$(printf '%s' "$extra" | sed '/^$/d')"
  if [[ -n "$extra" ]]; then
    bad "tracked notes are outside the allowlist"
    printf '%s\n' "$extra"
    echo "allowed:"
    printf '%s\n' "$allowed"
  else
    say "ok  tracked notes are only the allowlist"
  fi
else
  say "ok  not a git repository; tracked-file check skipped"
fi

if [[ "$fail" -ne 0 ]]; then
  exit 1
fi
say "publish checks passed"
say "A person must still read the diff. This script cannot see a name."
