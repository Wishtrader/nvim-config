vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.options")
require("config.keymaps")
require("config.lazy")

-- init.lua (или theme.lua)
local ok, _ = pcall(vim.cmd, "colorscheme tokyonight")
if not ok then
  vim.notify("Theme 'catppuccin' not found; using default.", vim.log.levels.WARN)
end
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.cmd([[highlight CursorLine guibg=#2a2a2a]])
vim.opt.guicursor = "n-v-c:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor"
