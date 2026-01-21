# agent-worktree

Git worktree manager for agentic development. Creates isolated worktrees for AI coding agents (Cursor, Amp, Windsurf, etc.) to work in parallel without conflicts.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/Mona-kecil/agent-worktree/main/install.sh | bash && exec $SHELL
```

That's it. One command, ready to use.

## Usage

```bash
# Create a new worktree for agent work
agent-worktree create my-feature

# List all agent worktrees (for current repo)
agent-worktree list

# Remove a specific worktree
agent-worktree remove my-feature

# Clean up all agent worktrees
agent-worktree clean
```

## Features

### 🔀 Isolated Environments
Each agent gets its own worktree with a dedicated `agent/<name>` branch. No more merge conflicts when multiple agents work simultaneously.

### 📁 Multi-Repo Support
Worktrees are namespaced by repository, so you can use this across all your projects:

```
~/.agent-worktrees/
├── my-frontend-feature-auth/
├── my-frontend-bugfix-nav/
├── my-backend-api-refactor/
└── another-project-tests/
```

Running `agent-worktree list` only shows worktrees for the repo you're currently in.

### 🔐 Auto Environment File Copy
Automatically detects and copies `.env*` files up to 3 directories deep — perfect for monorepos:

```
Copying environment files...
  📋 Copied: .env
  📋 Copied: apps/web/.env.local
  📋 Copied: packages/database/.env
  ✅ Copied 3 env file(s)
```

Supports: `.env`, `.env.local`, `.env.development`, `.env.test`, `.env.production` (and their `.local` variants)

### 📦 Auto Dependency Install
Uses [ni](https://github.com/antfu/ni) to detect your package manager (bun/pnpm/npm/yarn) and install dependencies automatically.

### 📊 Rich Status Display

```
┌─────────────────────────────────────────────────────────────────────────────┐
│  Agent Worktrees                                                            │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  📁 feature-auth                                                            │
│     Branch:   agent/feature-auth                                            │
│     Path:     /Users/you/.agent-worktrees/my-app-feature-auth               │
│     Created:  2025-01-21 14:30                                              │
│     Activity: 3 commit(s), last 2 hours ago                                 │
│     Based on: a1b2c3d (commit when worktree was created)                    │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### ✅ Merge Status Detection
Instantly see which worktrees have been merged and are safe to remove:

```
Status:   ✅ MERGED - safe to remove
```

### 🔄 Self-Update
Keep your installation up to date:

```bash
# Check current version
agent-worktree version

# Update to latest
agent-worktree upgrade
```

### 🐧 Cross-Platform
Works on both Linux and macOS with OS-specific implementations where needed.

## Requirements

- Git
- [ni](https://github.com/antfu/ni) (optional but recommended)

```bash
npm i -g @antfu/ni
# or
brew install ni
```

## Workflow

```bash
# 1. Create isolated worktree
agent-worktree create auth-feature

# 2. Work in the worktree (or let your agent work there)
cd ~/.agent-worktrees/my-app-auth-feature

# 3. When done, merge back to main
git checkout main
git merge agent/auth-feature

# 4. Clean up
agent-worktree remove auth-feature
```

## License

MIT
