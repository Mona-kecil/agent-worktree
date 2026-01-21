# agent-worktree

Git worktree manager for agentic development. Creates isolated worktrees for AI coding agents (Cursor, Amp, etc.) to work in parallel without conflicts.

## Features

- **Isolated environments** – Each agent gets its own worktree with a dedicated branch
- **Auto env file copy** – Detects and copies `.env*` files (up to 3 levels deep)
- **Auto dependency install** – Uses [ni](https://github.com/antfu/ni) to detect and run the right package manager
- **Cross-platform** – Works on Linux and macOS
- **Easy cleanup** – Remove individual worktrees or clean all at once

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/Mona-kecil/agent-worktree/main/agent-worktree -o ~/.local/bin/agent-worktree && chmod +x ~/.local/bin/agent-worktree
```

Make sure `~/.local/bin` is in your PATH:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

## Usage

```bash
# Create a new worktree for agent work
agent-worktree create my-feature

# List all agent worktrees
agent-worktree list

# Remove a specific worktree
agent-worktree remove my-feature

# Clean up all agent worktrees
agent-worktree clean
```

## How it works

1. Creates worktrees in `~/.agent-worktrees/<repo>-<name>`
2. Each worktree gets a branch named `agent/<name>`
3. Automatically installs dependencies using `ni` (falls back gracefully if not installed)
4. Tracks commits and uncommitted changes for visibility

## Requirements

- Git
- [ni](https://github.com/antfu/ni) (optional, for auto dependency install)

```bash
npm i -g @antfu/ni
# or
brew install ni
```

## License

MIT
