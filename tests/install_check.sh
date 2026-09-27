#!/bin/bash
# Raises the installer bar without extra tools.
# Usage: bash ./tests/install_check.sh

set -euo pipefail
root="$(cd "$(dirname "$0")/.." && pwd)"
notes="$root/notes"
fail=0
tmpdir="$(mktemp -d "${TMPDIR:-/tmp}/worknotes-check.XXXXXX")"
trap 'rm -rf "$tmpdir"' EXIT

say() { echo "$*"; }
bad() { echo "FAIL  $*"; fail=1; }

before="$(stat -c "%a" "$notes" 2>/dev/null || stat -f "%Lp" "$notes")"
bash "$root/install.sh" --check >"$tmpdir/check.out"
after="$(stat -c "%a" "$notes" 2>/dev/null || stat -f "%Lp" "$notes")"
if [[ "$before" == "$after" ]]; then
  say "ok  --check did not change notes mode ($after)"
else
  bad "--check changed notes mode $before -> $after"
fi
if ! grep -q "No files or permissions changed" "$tmpdir/check.out"; then
  bad "--check did not report that it changed nothing"
else
  say "ok  --check reports no changes"
fi

set +e
bash "$root/install.sh" --nope >"$tmpdir/bad.out" 2>&1
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

if bash "$root/tests/publish_check.sh" >"$tmpdir/publish.out"; then
  say "ok  publish_check passed on this tree"
else
  bad "publish_check failed"
  cat "$tmpdir/publish.out"
fi

fix="$tmpdir/vault"
mkdir -p "$fix/notes"
cp "$root/install.sh" "$fix/install.sh"
while read -r name; do
  mkdir -p "$fix/skills/$name"
  printf 'name: %s\n' "$name" > "$fix/skills/$name/SKILL.md"
done << 'EOF'
pa-context
pa-meetings
pa-direct-reports
pa-manager
pa-stakeholders
pa-sources
pa-promotion-case
pa-performance-concern
pa-feedback
pa-portfolio
pa-delivery
pa-scrum
pa-users
pa-coaching-span
pa-dates
pa-integrity
pa-jira
EOF
printf '# Index\n' > "$fix/notes/INDEX.md"
chmod 755 "$fix/notes"
bash "$fix/install.sh" --lock-notes >"$tmpdir/lock.out"
mode="$(stat -c "%a" "$fix/notes" 2>/dev/null || stat -f "%Lp" "$fix/notes")"
if [[ "$mode" == "700" || "$mode" == "600" ]]; then
  say "ok  --lock-notes on fixture set notes mode $mode"
else
  bad "--lock-notes fixture notes mode is $mode"
fi
root_mode="$(stat -c "%a" "$notes" 2>/dev/null || stat -f "%Lp" "$notes")"
if [[ "$root_mode" == "$after" ]]; then
  say "ok  fixture lock did not change project notes mode"
else
  bad "fixture lock changed project notes $after -> $root_mode"
fi

pub="$tmpdir/pub"
mkdir -p "$pub/tests" "$pub/notes"
cp "$root/.gitignore" "$pub/.gitignore"
cp "$root/tests/publish_check.sh" "$pub/tests/publish_check.sh"
git -C "$pub" init -q
git -C "$pub" add .gitignore
echo x > "$pub/notes/team.md"
git -C "$pub" add -f notes/team.md
set +e
bash "$pub/tests/publish_check.sh" >"$tmpdir/pubfail.out" 2>&1
pubcode=$?
set -e
if [[ "$pubcode" -ne 0 ]] && grep -q "allowlist" "$tmpdir/pubfail.out"; then
  say "ok  publish_check fails when notes/team.md is tracked"
else
  bad "publish_check did not fail a tracked team.md"
  cat "$tmpdir/pubfail.out"
fi

if [[ "$fail" -ne 0 ]]; then
  exit 1
fi
say "install checks passed"
