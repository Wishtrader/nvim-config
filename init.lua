vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.termguicolors = true

require("config.options")
require("config.keymaps")
require("config.lazy")

local function apply_tokyonight_cursor_hl()
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#faa2f7", fg = "NONE" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#171825" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#b9e981", bold = true })
end

local ok = pcall(vim.cmd, "colorscheme tokyonight")
if not ok then
  vim.notify("Theme 'tokyonight' not found; using default.", vim.log.levels.WARN)
else
  apply_tokyonight_cursor_hl()
end

vim.opt.cursorline = true
vim.opt.guicursor = "n-v-c:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor"

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "tokyonight",
  callback = apply_tokyonight_cursor_hl,
})

