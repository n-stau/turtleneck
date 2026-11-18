#!/usr/bin/env bash
# Symlink every skills/<name> into Claude Code and Codex/T3 skill folders. Re-run after adding a skill.
set -euo pipefail
D="$(cd "$(dirname "$0")/skills" && pwd)"
for t in "$HOME/.claude/skills" "$HOME/.agents/skills"; do
  mkdir -p "$t"
  for s in "$D"/*/; do
    s="${s%/}"; [ -f "$s/SKILL.md" ] || continue
    n="$(basename "$s")"; dst="$t/$n"
    if [ -e "$dst" ] && [ ! -L "$dst" ]; then echo "skip (real folder exists): $dst"; continue; fi
    ln -sfn "$s" "$dst"
  done
done
echo done
