vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.termguicolors = true

-- Tab settings: 2 spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Auto format on save using LSP if available, otherwise use vim's equal
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    if vim.lsp.buf.format then
      vim.lsp.buf.format({ async = false })
    else
      vim.cmd("silent! normal! gg=G")
    end
  end,
})

require("config.options")
require("config.keymaps")
require("config.lazy")

vim.opt.cursorline = true
vim.opt.guicursor = "n-v-c:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor"

local themes = { "catppuccin", "cyberdream", "gruvbox", "tokyonight", "kanagawa", "rose-pine", "nightfox", "onedark", "everforest", "dracula" }
local current_theme = 3

local theme_cursor_colors = {
  gruvbox = { bg = "#b8bb26", fg = "#282828" },
  dracula = { bg = "#ff79c6", fg = "#282a36" },
  catppuccin = { bg = "#cba6f7", fg = "#1e1e2e" },
  cyberdream = { bg = "#00d4ff", fg = "#16161e" },
  tokyonight = { bg = "#7aa2f7", fg = "#1a1b26" },
  ["rose-pine"] = { bg = "#ebbcba", fg = "#191724" },
  kanagawa = { bg = "#dca561", fg = "#1f1f28" },
  nightfox = { bg = "#db4f87", fg = "#131720" },
  onedark = { bg = "#61afef", fg = "#282c34" },
  everforest = { bg = "#a7c080", fg = "#2d353b" },
}

local function set_cursor_hl()
  local theme = vim.g.colors_name or ""
  for name, colors in pairs(theme_cursor_colors) do
    if theme:find(name) then
      local hl = { bg = colors.bg, fg = colors.fg, bold = true }
      vim.api.nvim_set_hl(0, "Cursor", hl)
      vim.api.nvim_set_hl(0, "CursorIM", hl)
      return
    end
  end
end

local function switch_theme()
  current_theme = current_theme % #themes + 1
  vim.cmd.colorscheme(themes[current_theme])
  set_cursor_hl()
  vim.notify("Theme: " .. themes[current_theme])
end

vim.keymap.set("n", "<leader>th", switch_theme, { desc = "Switch colorscheme" })

vim.cmd.colorscheme(themes[current_theme])

set_cursor_hl()
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = set_cursor_hl,
})
