#!/usr/bin/env bash
set -e

BIN_DIR="$HOME/.local/bin"
SCRIPT_URL="https://raw.githubusercontent.com/Mona-kecil/agent-worktree/main/agent-worktree"

mkdir -p "$BIN_DIR"

echo "Downloading agent-worktree..."
curl -fsSL "$SCRIPT_URL" -o "$BIN_DIR/agent-worktree"
chmod +x "$BIN_DIR/agent-worktree"

# Detect shell and rc file
if [ -n "$ZSH_VERSION" ] || [ "$SHELL" = "/bin/zsh" ]; then
  RC_FILE="$HOME/.zshrc"
else
  RC_FILE="$HOME/.bashrc"
fi

# Add to PATH if not already there
if ! grep -q 'export PATH="$HOME/.local/bin:$PATH"' "$RC_FILE" 2>/dev/null; then
  echo '' >> "$RC_FILE"
  echo '# agent-worktree' >> "$RC_FILE"
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$RC_FILE"
  echo "Added ~/.local/bin to PATH in $RC_FILE"
fi

echo ""
echo "✅ Installed! Run 'source $RC_FILE' or open a new terminal."
echo ""
echo "Usage:"
echo "  agent-worktree create <name>"
echo "  agent-worktree list"
echo "  agent-worktree remove <name>"
