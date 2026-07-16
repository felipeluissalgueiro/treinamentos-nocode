#!/usr/bin/env bash
# claude-dev-skills installer — Unix / macOS / WSL

set -e

SKILLS_DIR="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_SRC="$SCRIPT_DIR/skills"

echo "claude-dev-skills installer"
echo "Installing to: $SKILLS_DIR"
echo ""

mkdir -p "$SKILLS_DIR"

installed=0
skipped=0

for skill_dir in "$SKILLS_SRC"/*/; do
  skill_name=$(basename "$skill_dir")
  dest="$SKILLS_DIR/$skill_name"

  if [ -d "$dest" ]; then
    echo "  ~ $skill_name (already exists, skipping — use --force to overwrite)"
    skipped=$((skipped + 1))
  else
    cp -r "$skill_dir" "$dest"
    echo "  ✓ $skill_name"
    installed=$((installed + 1))
  fi
done

echo ""
echo "Done: $installed installed, $skipped skipped."
echo "Restart Claude Code to load the new skills."
