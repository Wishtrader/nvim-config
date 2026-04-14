# Neovim Configuration
## Installation
### Prerequisites
- Neovim `0.12+` (recommended: latest stable)
- `git`
- `tree-sitter-cli` (for parser compilation)
- A C compiler toolchain
- A Nerd Font (for icons from `nvim-web-devicons`/Neo-tree)

### First run
1. Start Neovim:
   - `nvim`
2. Let `lazy.nvim` bootstrap automatically (handled in `lua/config/lazy.lua`).
3. Install/sync plugins:
   - `:Lazy sync`
4. Treesitter parsers are bootstrapped automatically on startup (first run may take longer).
   - Optional manual update: `:TSUpdate`
5. Install language servers configured in `lua/config/lsp.lua`:
   - `:Mason`
   - Ensure `lua_ls`, `pyright`, and `ts_ls` are installed.
6. Optional health check:
   - `:checkhealth`

## Leader key
- `<leader>` is set to `<Space>`.

## Keymap reference
### Core (normal mode)
- `<Esc>`: Clear search highlight
- `<leader>w`: Save file
- `<leader>q`: Quit window
- `<C-h>`: Move focus to left split
- `<C-l>`: Move focus to right split
- `<C-j>`: Move focus to lower split
- `<C-k>`: Move focus to upper split

### Telescope (normal mode)
- `<leader>ff`: Find files
- `<leader>fg`: Live grep
- `<leader>fb`: List open buffers
- `<leader>fh`: Help tags

### Neo-tree (normal mode)
- `<leader>e`: Toggle filesystem view (left panel)
- `<leader>be`: Toggle buffers view (right panel)
- `<leader>ge`: Toggle git status view (right panel)

### LSP (normal mode, buffer-local after LSP attaches)
- `gd`: Go to definition
- `gr`: List references
- `gi`: Go to implementation
- `K`: Hover documentation
- `<leader>rn`: Rename symbol
- `<leader>ca`: Code action
- `<leader>ld`: Open diagnostic float
- `[d`: Previous diagnostic
- `]d`: Next diagnostic

### Completion (`nvim-cmp`, insert/select mode)
- `<C-Space>`: Trigger completion menu
- `<CR>`: Confirm selected completion
- `<Tab>`: Next completion item, or expand/jump snippet
- `<S-Tab>`: Previous completion item, or jump backward in snippet
