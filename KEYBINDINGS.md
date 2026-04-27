# Neovim / LazyVim Keybindings Reference

> Leader key: `<Space>` | Local leader: `\`

---

## General

| Key | Mode | Description |
|-----|------|-------------|
| `<C-s>` | n/i/x | Save file |
| `<leader>qq` | n | Quit all |
| `<leader>fn` | n | New file |
| `<leader>l` | n | Open Lazy plugin manager |
| `<leader>L` | n | LazyVim changelog |
| `<Esc>` | n | Clear search highlight |
| `<leader>ur` | n | Redraw / Clear hlsearch / Diff update |
| `<leader>K` | n | Keywordprg |

---

## Movement & Navigation

| Key | Mode | Description |
|-----|------|-------------|
| `j` / `k` | n/x | Up/Down (respects word wrap) |
| `n` / `N` | n/x/o | Next/Prev search result (always consistent direction) |
| `<C-o>` | n | Jump back (jump list) |
| `<C-p>` | n | Jump forward (jump list, custom) |
| `<leader>se` | n | Snacks Explorer |

---

## Window Management

| Key | Mode | Description |
|-----|------|-------------|
| `<C-h/j/k/l>` | n | Move to left/down/up/right window |
| `<C-Up/Down>` | n | Increase/Decrease window height |
| `<C-Left/Right>` | n | Decrease/Increase window width |
| `<leader>-` | n | Split window below |
| `<leader>\|` | n | Split window right |
| `<leader>wd` | n | Delete window |
| `<leader>wm` | n | Zoom window (toggle maximize) |
| `<leader>uz` | n | Zen mode |

---

## Buffer Management

| Key | Mode | Description |
|-----|------|-------------|
| `<S-h>` | n | Previous buffer |
| `<S-l>` | n | Next buffer |
| `[b` / `]b` | n | Previous/Next buffer |
| `<leader>bb` | n | Switch to last used buffer |
| `<leader>bd` | n | Delete current buffer |
| `<leader>bo` | n | Delete all other buffers |
| `<leader>bD` | n | Delete buffer and window |

---

## Tab Management

| Key | Mode | Description |
|-----|------|-------------|
| `<leader><tab><tab>` | n | New tab |
| `<leader><tab>d` | n | Close tab |
| `<leader><tab>o` | n | Close other tabs |
| `<leader><tab>]` / `[` | n | Next/Previous tab |
| `<leader><tab>f` / `l` | n | First/Last tab |

---

## Line Editing

| Key | Mode | Description |
|-----|------|-------------|
| `<A-j>` / `<A-k>` | n/i/v | Move line(s) down/up with auto-reindent |
| `<` / `>` | x | Indent left/right (stays in visual mode) |
| `gco` | n | Add comment line below |
| `gcO` | n | Add comment line above |
| `,` / `.` / `;` | i | Insert + create undo break-point |

---

## Clipboard (Custom)

| Key | Mode | Description |
|-----|------|-------------|
| `y` | n/x | Yank to system clipboard (`"+y`) |

---

## Flash.nvim (Jump)

| Key | Mode | Description |
|-----|------|-------------|
| `s` | n/x/o | Flash jump: type 2 chars, press label to jump |
| `S` | n/o/x | Flash Treesitter: select syntax node by label |
| `r` | o | Remote flash: operate on distant text (e.g. `yr<label>`) |
| `R` | o/x | Treesitter search |
| `<C-s>` | c | Toggle flash in command-line search |
| `f/F/t/T` | n | Enhanced inline jump with multi-match labels |

---

## Telescope (Fuzzy Finder)

| Key | Mode | Description |
|-----|------|-------------|
| `<leader><space>` | n | Find files (cwd) |
| `<leader>/` | n | Live grep (cwd) |
| `<leader>fh` | n | Find hidden files |
| `<leader>fr` | n | Recent files |
| `<leader>sg` | n | Grep search |
| `<leader>sw` | n | Search word under cursor |
| `<leader>sk` | n | Search keymaps |
| `<leader>ss` | n | Goto symbol (Aerial) |
| `<leader>sS` | n | Goto symbol (workspace) |
| `<leader>st` | n | Search TODOs |
| `<leader>sT` | n | Search TODO/FIX/FIXME only |
| `<leader>"` | n | Registers |
| `<leader>?` | n | Buffer keymaps (which-key) |
| `<C-d>` | i (buffer picker) | Delete buffer from list |

---

## Neo-tree (File Explorer)

### Global Keymaps

| Key | Mode | Description |
|-----|------|-------------|
| `<C-n>` | n | Toggle Neo-tree (custom) |
| `<leader>e` | n | Explorer (root dir) |
| `<leader>E` | n | Explorer (cwd) |
| `<leader>fe` | n | Explorer (root dir) |
| `<leader>fE` | n | Explorer (cwd) |
| `<leader>ge` | n | Git status explorer |
| `<leader>be` | n | Buffer explorer |

### Inside Neo-tree Window

| Key | Description |
|-----|-------------|
| `l` / `<CR>` | Open file/expand directory |
| `h` | Collapse directory |
| `/` | Fuzzy finder (recursive search) |
| `f` | Filter on submit (current visible tree only) |
| `#` | Fuzzy sorter |
| `D` | Fuzzy finder (directories only) |
| `<C-x>` | Clear filter |
| `H` | Toggle hidden files |
| `a` | Add file/directory |
| `d` | Delete |
| `r` | Rename |
| `c` | Copy |
| `m` | Move |
| `p` | Paste |
| `y` | Copy to clipboard |
| `x` | Cut to clipboard |
| `Y` | Copy full path to clipboard |
| `O` | Open with system application |
| `P` | Toggle preview |
| `<space>` | Disabled (prevents conflicts) |
| `.` | Set as root |
| `<BS>` | Navigate up |
| `[g` / `]g` | Previous/Next git modified |
| `i` | Show file details |
| `S` | Open in split |
| `s` | Open in vertical split |
| `t` | Open in new tab |
| `?` | Show help |
| `q` | Close |

---

## Aerial (Symbol Outline)

| Key | Mode | Description |
|-----|------|-------------|
| `<C-x>` | n | Toggle Aerial sidebar |
| `<leader>cs` | n | Toggle Aerial (LazyVim) |

---

## Outline

| Key | Mode | Description |
|-----|------|-------------|
| `<F2>` | n | Toggle Outline sidebar |
| `<Up>` / `<Down>` | (inside outline) | Jump to symbol |

---

## LSP (Language Server)

| Key | Mode | Description |
|-----|------|-------------|
| `gd` | n | Goto definition |
| `gr` | n | Show references |
| `gD` | n | Goto declaration |
| `gI` | n | Goto implementation |
| `gy` | n | Goto type definition |
| `K` | n | Hover documentation |
| `gK` | n | Signature help |
| `<C-k>` | i | Signature help (insert mode) |
| `<leader>ca` | n/x | Code action |
| `<leader>cA` | n | Source action |
| `<leader>cr` | n | Rename symbol |
| `<leader>cR` | n | Rename file |
| `<leader>cf` | n/v | Format code (Conform) |
| `<leader>cc` | n/x | Run codelens |
| `<leader>cC` | n | Refresh & display codelens |
| `<leader>cd` | n | Line diagnostics (float) |
| `<leader>cl` | n | LSP info |
| `<leader>co` | n | Organize imports |
| `]d` / `[d` | n | Next/Prev diagnostic |
| `]e` / `[e` | n | Next/Prev error |
| `]w` / `[w` | n | Next/Prev warning |
| `]]` / `[[` | n | Next/Prev reference (Snacks words) |

### Clangd (C/C++)

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>ch` | n | Switch between source/header |

### Rust (rustaceanvim)

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>a` | n | Rust code action (with grouping) |
| `K` | n | Rust hover actions (overrides default) |
| `<leader>m` | n | Expand macro |

---

## Git

### Gitsigns (Hunk Operations)

| Key | Mode | Description |
|-----|------|-------------|
| `]h` / `[h` | n | Next/Prev hunk |
| `]H` / `[H` | n | Last/First hunk |
| `<leader>ghs` | n/x | Stage hunk |
| `<leader>ghr` | n/x | Reset hunk |
| `<leader>ghS` | n | Stage entire buffer |
| `<leader>ghu` | n | Undo stage hunk |
| `<leader>ghR` | n | Reset entire buffer |
| `<leader>ghp` | n | Preview hunk inline |
| `<leader>ghb` | n | Blame current line |
| `<leader>ghB` | n | Blame entire buffer |
| `<leader>ghd` | n | Diff this (vs HEAD) |
| `<leader>ghD` | n | Diff this (vs HEAD~1) |
| `ih` | o/x | Select hunk (text object) |

### Lazygit & Git Browse

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>gg` | n | Open Lazygit (root dir) |
| `<leader>gG` | n | Open Lazygit (cwd) |
| `<leader>gl` | n | Git log |
| `<leader>gL` | n | Git log (cwd) |
| `<leader>gb` | n | Git blame line |
| `<leader>gf` | n | Git current file history |
| `<leader>gB` | n/x | Git browse (open in browser) |
| `<leader>gY` | n/x | Git browse (copy URL) |

---

## Trouble (Diagnostics)

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>xx` | n | All diagnostics |
| `<leader>xX` | n | Current buffer diagnostics |
| `<leader>cs` | n | Symbols |
| `<leader>cS` | n | LSP references/definitions |
| `<leader>xL` | n | Location list |
| `<leader>xQ` | n | Quickfix list |
| `<leader>xl` | n | Toggle location list |
| `<leader>xq` | n | Toggle quickfix list |
| `[q` / `]q` | n | Previous/Next quickfix item |

---

## TODO Comments

| Key | Mode | Description |
|-----|------|-------------|
| `]t` / `[t` | n | Next/Prev TODO comment |
| `<leader>xt` | n | All TODOs (Trouble) |
| `<leader>xT` | n | TODO/FIX/FIXME only (Trouble) |
| `<leader>st` | n | Search TODOs (Telescope) |
| `<leader>sT` | n | Search TODO/FIX/FIXME (Telescope) |

---

## Search & Replace

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>sr` | n/x | Open grug-far (search & replace) |

---

## DAP (Debugger)

### Quick Keys (F-keys)

| Key | Mode | Description |
|-----|------|-------------|
| `<F5>` | n | Continue / Start debugging |
| `<F6>` | n | Terminate debugging |
| `<F9>` | n | Toggle breakpoint |
| `<F10>` | n | Step over |
| `<F11>` | n | Step into |
| `<S-F11>` | n | Step out |

### Leader Keys

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>db` | n | Toggle breakpoint |
| `<leader>dB` | n | Breakpoint with condition |
| `<leader>dL` | n | Log point (breakpoint with message) |
| `<leader>dc` | n | Continue / Start |
| `<leader>da` | n | Run with args |
| `<leader>dC` | n | Run to cursor |
| `<leader>dg` | n | Go to line (no execute) |
| `<leader>di` | n | Step into |
| `<leader>do` | n | Step out |
| `<leader>dO` | n | Step over |
| `<leader>dP` | n | Pause |
| `<leader>dl` | n | Run last session |
| `<leader>dj` / `dk` | n | Down/Up in stack |
| `<leader>dr` | n | Toggle REPL |
| `<leader>ds` | n | Show session |
| `<leader>dt` | n | Terminate |
| `<leader>dw` | n | Hover widgets |
| `<leader>du` | n | Toggle DAP UI |
| `<leader>de` | n/x | Eval expression |

### Available Debug Adapters (C/C++)

| Adapter | Backend | Configurations |
|---------|---------|----------------|
| codelldb | LLDB | Launch file, Attach to process |
| cppdbg | GDB (via cpptools) | Launch, Launch with args, Attach to process, Attach to gdbserver |

---

## ToggleTerm (Terminal)

### Global

| Key | Mode | Description |
|-----|------|-------------|
| `<C-\>` | n | Toggle floating terminal |
| `<leader>ft` | n | Terminal (root dir, via Snacks) |
| `<leader>fT` | n | Terminal (cwd, via Snacks) |
| `<C-/>` | n/t | Terminal (root dir, via Snacks) |

### Inside Terminal

| Key | Mode | Description |
|-----|------|-------------|
| `<Esc>` | t | Exit terminal mode (lazygit 除外) |
| `<C-h/j/k/l>` | t | Navigate to left/down/up/right window |

---

## Copilot

| Key | Mode | Description |
|-----|------|-------------|
| `<Tab>` | i | Accept suggestion |
| `<M-]>` | i | Next suggestion |
| `<M-[>` | i | Previous suggestion |
| `<C-]>` | i | Dismiss suggestion |

---

## UI Toggles (`<leader>u` prefix)

| Key | Description |
|-----|-------------|
| `<leader>uf` | Toggle format on save (buffer) |
| `<leader>uF` | Toggle format on save (global) |
| `<leader>us` | Toggle spelling |
| `<leader>uw` | Toggle word wrap |
| `<leader>ul` | Toggle line numbers |
| `<leader>uL` | Toggle relative line numbers |
| `<leader>ud` | Toggle diagnostics |
| `<leader>uc` | Toggle conceal level |
| `<leader>uh` | Toggle inlay hints |
| `<leader>uT` | Toggle treesitter highlight |
| `<leader>ub` | Toggle dark background |
| `<leader>ug` | Toggle indent guides |
| `<leader>uG` | Toggle git signs |
| `<leader>uA` | Toggle tabline |
| `<leader>uS` | Toggle scroll animation |
| `<leader>uD` | Toggle dim |
| `<leader>ua` | Toggle animate |
| `<leader>uZ` | Toggle zoom |

---

## Profiler

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>dpp` | n | Toggle profiler |
| `<leader>dph` | n | Toggle profiler highlights |

---

## Misc

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>ui` | n | Inspect position (highlight groups) |
| `<leader>uI` | n | Inspect treesitter tree |
| `<localleader>r` | n/x | Run Lua snippet |
| `<C-w><space>` | n | Window hydra mode (which-key) |
