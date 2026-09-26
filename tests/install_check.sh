#!/bin/bash
# Raises the installer bar without extra tools.
# Usage: bash ./tests/install_check.sh

set -euo pipefail
root="$(cd "$(dirname "$0")/.." && pwd)"
notes="$root/notes"
fail=0

say() { echo "$*"; }
bad() { echo "FAIL  $*"; fail=1; }

before="$(stat -c "%a" "$notes" 2>/dev/null || stat -f "%Lp" "$notes")"
bash "$root/install.sh" --check >/tmp/worknotes-check.out
after="$(stat -c "%a" "$notes" 2>/dev/null || stat -f "%Lp" "$notes")"
if [[ "$before" == "$after" ]]; then
  say "ok  --check did not change notes mode ($after)"
else
  bad "--check changed notes mode $before -> $after"
fi
if ! grep -q "No files or permissions changed" /tmp/worknotes-check.out; then
  bad "--check did not report that it changed nothing"
else
  say "ok  --check reports no changes"
fi

set +e
bash "$root/install.sh" --nope >/tmp/worknotes-bad.out 2>&1
code=$?
set -e
if [[ "$code" -eq 2 ]]; then
  say "ok  unknown flag exits 2"
else
  bad "unknown flag exited $code, expected 2"
fi

if grep -q "pa-feedback" "$root/install.sh"; then
  say "ok  installer expects pa-feedback"
else
  bad "installer skill list missing pa-feedback"
fi

if grep -q "git fail" "$root/install.sh"; then
  say "ok  installer can fail closed on a remote plus private notes"
else
  bad "installer missing fail-closed git check"
fi

if bash "$root/tests/publish_check.sh" >/tmp/worknotes-publish.out; then
  say "ok  publish_check passed on this tree"
else
  bad "publish_check failed"
fi

if [[ "$fail" -ne 0 ]]; then
  exit 1
fi
say "install checks passed"
