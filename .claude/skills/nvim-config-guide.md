# Neovim Configuration Guide

Analyze and describe the current Neovim configuration project, including its structure, plugins, features, and key bindings.

## Project Overview

This is a **LazyVim-based Neovim configuration** using the **lazy.nvim** plugin manager. It follows LazyVim conventions with custom overrides in `lua/plugins/` and `lua/config/`.

- **Colorscheme**: `vscode.nvim` (VS Code dark theme) with `vim-code-dark` as fallback
- **Auto-format**: Disabled globally (`vim.g.autoformat = false`)
- **Clipboard**: System clipboard via `y` keymap (`"+y`), but `clipboard=""` (no auto-clipboard)
- **Relative numbers**: Off | **Mouse**: `r` (resize only) | **Wrap**: On | **Ignore case**: Off
- **Tabline**: Always shown (`showtabline = 2`) | **Split**: Below off (`splitbelow = false`)

## File Structure

```
~/.config/nvim/
├── init.lua                          # Entry point → require('config.lazy')
├── lua/
│   ├── config/
│   │   ├── lazy.lua                  # Lazy.nvim bootstrap + setup
│   │   ├── options.lua               # Custom vim options
│   │   ├── keymaps.lua               # Custom keymaps
│   │   └── autocmds.lua              # Custom autocommands
│   └── plugins/
│       ├── aerial.lua                # Symbol navigation sidebar
│       ├── bufferline.lua            # Buffer line (disabled)
│       ├── claude.lua                # Claude Code integration
│       ├── conform.lua               # Code formatter
│       ├── copilot.lua               # GitHub Copilot (disabled)
│       ├── dap.lua                   # Debug adapters (cppdbg/GDB) + DAP UI layout
│       ├── example.lua               # LazyVim example (disabled)
│       ├── lazygit.lua               # LazyGit (disabled, uses toggleterm instead)
│       ├── lspconfig.lua             # LSP server config (clangd)
│       ├── lualine.lua               # Statusline + tabline + winbar
│       ├── neotree.lua               # File explorer
│       ├── outline.lua               # Symbol outline sidebar
│       ├── oversee.lua               # Task runner
│       ├── tabline.lua               # Tabline (disabled)
│       ├── telescope.lua             # Fuzzy finder
│       ├── toggle-term.lua           # Terminal manager
│       ├── trouble.lua               # Diagnostics viewer
│       ├── typescript.lua           # TypeScript/JS overrides (vtsls keymaps, prettier)
│       └── vscode.lua                # Colorschemes
├── scripts/
│   └── sudo-gdb.sh                   # GDB wrapper for privileged debugging
├── after/
│   └── ftplugin/
│       ├── c.lua                     # C ftplugin (8-space tabs without .editorconfig)
│       ├── sh.lua                    # Shell ftplugin (8-space tabs without .editorconfig)
│       └── rust.lua                  # Rust ftplugin (rustaceanvim keymaps)
├── lazy-lock.json                    # Plugin lock file
├── lazyvim.json                      # LazyVim extras config
├── stylua.toml                       # Lua formatter config (single quotes, spaces)
├── KEYBINDINGS.md                    # Key bindings reference
└── .claude/
    └── settings.local.json
```

## LazyVim Extras (from lazyvim.json)

| Category | Extra |
|----------|-------|
| DAP | `lazyvim.plugins.extras.dap.core` |
| Editor | `aerial`, `illuminate`, `outline`, `neo-tree`, `telescope` |
| Lang | `clangd`, `json`, `markdown`, `python`, `cmake`, `git`, `go`, `rust`, `toml`, `typescript` |
| Linting | `eslint` |

## All Plugins (58 total, from lazy-lock.json)

### Core / Framework
| Plugin | Description |
|--------|-------------|
| `lazy.nvim` | Plugin manager |
| `LazyVim` | LazyVim framework |
| `snacks.nvim` | LazyVim utilities (dashboard, explorer, terminal, etc.) |

### UI / Colorscheme
| Plugin | Description |
|--------|-------------|
| `vscode.nvim` | VS Code dark theme (primary) |
| `vim-code-dark` | VS Code dark theme (fallback) |
| `tokyonight.nvim` | Fallback install colorscheme |
| `catppuccin` | Fallback install colorscheme |
| `lualine.nvim` | Statusline, tabline (buffers mode=4), winbar (filename + aerial) |
| `noice.nvim` | Better cmdline/popup UI |
| `which-key.nvim` | Keybinding popup |
| `mini.icons` | Icon provider |
| `dressing.nvim` | Better vim.ui.select/input |

### Navigation / File Explorer
| Plugin | Description |
|--------|-------------|
| `neo-tree.nvim` | File explorer (right side, auto-close if last window) |
| `telescope.nvim` | Fuzzy finder (horizontal layout, ascending sort, cwd-mode for grep/files) |
| `telescope-fzf-native.nvim` | FZF backend for telescope |
| `flash.nvim` | Quick jump (2-char + label) |
| `aerial.nvim` | Symbol sidebar (left, prefer_left, treesitter→lsp→markdown) |
| `outline.nvim` | Symbol outline sidebar (left, width=15) |
| `nvim-illuminate` | Highlight same-word under cursor |

### Editing / Completion
| Plugin | Description |
|--------|-------------|
| `blink.cmp` | Autocompletion engine |
| `copilot.lua` | AI code completion (auto-trigger, Tab to accept, panel disabled) |
| `mini.ai` | Extended text objects |
| `mini.pairs` | Auto-close brackets |
| `nvim-ts-autotag` | Auto-close HTML tags |
| `ts-comments.nvim` | TS-based comment strings |
| `friendly-snippets` | Snippet collection |

### LSP / Diagnostics
| Plugin | Description |
|--------|-------------|
| `nvim-lspconfig` | LSP config (custom clangd: background-index, clang-tidy, iwyu, utf-16) |
| `mason.nvim` | LSP/DAP/linter installer |
| `mason-lspconfig.nvim` | Mason↔lspconfig bridge |
| `clangd_extensions.nvim` | Clangd extra features (switch header/source, etc.) |
| `trouble.nvim` | Diagnostics list (LSP mode as floating bottom window) |
| `nvim-lint` | Linter framework |
| `lazydev.nvim` | Lua dev setup for lazy.nvim |
| `vtsls` (via mason) | TypeScript/JS LSP; `eslint-lsp` runs alongside for diagnostics |

### Formatting
| Plugin | Description |
|--------|-------------|
| `conform.nvim` | Formatter with per-ft config |

**Formatter assignments:**
| Filetype | Formatter |
|----------|-----------|
| html / css / htmldjango | prettier |
| js / jsx / ts / tsx | prettier |
| python | black |
| sh / bash | shfmt |
| rust | rustfmt (via `rustup run nightly`, edition 2024) |
| c / cpp | clang-format (respects .editorconfig) |
| json / jsonc | prettier |
| toml | taplo |

### DAP (Debugging)
| Plugin | Description |
|--------|-------------|
| `nvim-dap` | Debug Adapter Protocol client |
| `nvim-dap-ui` | DAP UI |
| `nvim-dap-virtual-text` | Virtual text for DAP |
| `mason-nvim-dap.nvim` | Mason↔DAP bridge |
| `nvim-nio` | Async for DAP UI |
| `nvim-dap-python` / `nvim-dap-go` | Python / Go debug adapters |
| `js-debug-adapter` (via mason) | Node/Chrome debugging for TS/JS (`pwa-node`) |

### Git
| Plugin | Description |
|--------|-------------|
| `gitsigns.nvim` | Git signs + hunk operations |
| `lazygit.nvim` | LazyGit integration (disabled; uses toggleterm terminal instead) |

### Terminal
| Plugin | Description |
|--------|-------------|
| `toggleterm.nvim` | Terminal manager (float by default, `<C-\>` toggle, `<Esc><Esc>` exit terminal mode) |
| Built-in terminals: lazygit, node, python3 |

### Language-Specific
| Plugin | Description |
|--------|-------------|
| `rustaceanvim` | Rust LSP + tools (code action `<leader>a`, hover `K`, expand macro `<leader>m`) |
| `crates.nvim` | Cargo.toml completion |
| `cmake-tools.nvim` | CMake integration |
| `markdown-preview.nvim` | Markdown browser preview |
| `render-markdown.nvim` | Markdown rendering in buffer |
| `SchemaStore.nvim` | JSON schema support |

### Task Runner
| Plugin | Description |
|--------|-------------|
| `overseer.nvim` | Task runner (no custom config yet) |

### AI Integration
| Plugin | Description |
|--------|-------------|
| `claudecode.nvim` | Claude Code CLI integration (right split 40%, uses `cfuse` if available, else `claude`) |

### Misc
| Plugin | Description |
|--------|-------------|
| `persistence.nvim` | Session restore |
| `todo-comments.nvim` | TODO/FIXME highlight + search |
| `grug-far.nvim` | Search & replace |
| `plenary.nvim` | Lua utility library |
| `nui.nvim` | UI component library |

### Disabled Plugins
| Plugin | Note |
|--------|------|
| `bufferline.nvim` | Replaced by lualine tabline with buffers |
| `tabline.nvim` | Replaced by lualine tabline with buffers |
| `lazygit.nvim` | Replaced by toggleterm lazygit terminal |

## Custom Autocommands

1. **Session save for tmux-resurrect** — On `VimLeavePre`, writes `Session.vim` if any named buffer is open (so `nvim -S` can restore)
2. **Auto-quit on sidebar-only** — On `WinClosed`, if only sidebar windows remain (aerial, neo-tree, Outline, toggleterm, trouble, lazy, mason, terminal) and a file was previously opened, quit Neovim

## Custom Keymaps

| Key | Mode | Action |
|-----|------|--------|
| `<C-p>` | n | Jump forward (override `<C-i>`) |
| `<leader>se` | n | Snacks Explorer |
| `y` | n/x | Yank to system clipboard (`"+y`) |
| `<C-n>` | n | Neo-tree toggle (right side) |
| `<F2>` | n | Outline toggle |
| `<C-x>` | n | Aerial toggle |
| `<C-\>` | n | Toggle floating terminal |
| `<Esc><Esc>` | t | Exit terminal mode |
| `<leader>ac` | n | Toggle Claude Code |
| `<leader>af` | n | Focus Claude Code |
| `<C-q>` | n/t | Toggle Claude Code |
| `<leader>as` | v | Send selection to Claude |
| `<leader>at` | n | Add file to Claude |
| `<leader>ab` | n | Add current buffer to Claude |
| `<leader>am` | n | Select Claude model |
| `<leader>ay` | n | Accept Claude diff |
| `<leader>an` | n | Deny Claude diff |
| `<leader>cf` | n/v | Format via Conform |
| `gD` / `gR` | n (ts/js) | Goto source definition / file references |
| `<leader>cM` / `<leader>co` / `<leader>cu` | n (ts/js) | Add missing / organize / remove unused imports |
| `<leader>cD` / `<leader>cV` | n (ts/js) | Fix all diagnostics / select TS version |
| `<leader>a` | n (rust) | Rust code action |
| `K` | n (rust) | Rust hover actions |
| `<leader>m` | n (rust) | Rust expand macro |

## ftplugin Overrides

- **C** (`after/ftplugin/c.lua`): If no `.editorconfig`, sets 8-space tabs, no expandtab, textwidth=80
- **Shell** (`after/ftplugin/sh.lua`): Same as C — 8-space tabs without `.editorconfig`
- **Rust** (`after/ftplugin/rust.lua`): rustaceanvim keymaps (`<leader>a`, `K`, `<leader>m`)

## Formatter Config (stylua.toml)

- Single quotes
- Space indentation

## Performance Tuning (lazy.lua)

Disabled built-in rtp plugins: `gzip`, `tarPlugin`, `tohtml`, `tutor`, `zipPlugin`
Plugin update checker: enabled, no notification

## Language Support Summary

| Language | LSP | Formatter | Debugger | Extras |
|----------|-----|-----------|----------|--------|
| C/C++ | clangd (custom args) | clang-format (.editorconfig-aware) | DAP | cmake-tools, clangd_extensions |
| Rust | rustaceanvim | rustfmt (nightly, edition 2024) | DAP | crates.nvim |
| Python | pyright (via Mason) | black | DAP (nvim-dap-python) | venv-selector, ruff |
| JS/TS/TSX | vtsls + eslint (diagnostics) | prettier | DAP (`pwa-node`, js-debug-adapter) | ts-autotag, mini.icons file glyphs |
| HTML/CSS | via LazyVim | prettier | — | — |
| JSON | jsonls + SchemaStore | prettier | — | — |
| Markdown | marksman | — | — | markdown-preview, render-markdown |
| TOML | taplo | taplo | — | — |
| Shell | via Mason | shfmt | — | — |
| Lua | lua_ls (via LazyVim) | stylua | — | lazydev |
| Go | gopls (via Mason) | gofumpt/goimports | DAP (nvim-dap-go, dlv) | golangci-lint |
| Git | — | — | — | LazyVim git extras |

## Notable Design Decisions

1. **Two symbol sidebars**: Aerial (`<C-x>`, left, treesitter-first) and Outline (`<F2>`, left, width=15) — different detail levels
2. **Lualine as universal bar**: Handles statusline, tabline (buffers as tabs), and winbar (filename + aerial breadcrumb)
3. **System clipboard on `y` only**: No auto-clipboard (`clipboard=""`), explicit `"+y` mapping
4. **clangd heavily customized**: background-index, clang-tidy, iwyu headers, detailed completion, function-arg-placeholders, utf-16 offset encoding
5. **clang-format respects .editorconfig**: Falls back to LLVM style with detected shiftwidth/tab settings
6. **Terminal workflow**: toggleterm with floating terminal + dedicated lazygit/node/python3 terminals; `<Esc><Esc>` to exit terminal mode
7. **Claude Code integrated**: Right-side split (40%), prefers `cfuse` binary, full diff accept/deny workflow
8. **Session persistence for tmux**: Auto-saves `Session.vim` on exit for tmux-resurrect compatibility
9. **Smart auto-close**: Quits Neovim when only sidebar/terminal windows remain after closing a file buffer
10. **TypeScript: vtsls + eslint split roles** — vtsls owns completion/refactors, eslint is diagnostics-only (`vim.g.lazyvim_eslint_auto_format = false`), prettier owns formatting via conform, so the three never fight over the buffer
11. **`servers.vtsls.keys` extended via opts function** — a plain opts table would overwrite the LazyVim extra's keymap list instead of appending to it
