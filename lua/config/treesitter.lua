local treesitter = require("nvim-treesitter")

treesitter.setup({})
local ensure_installed = {
  "bash",
  "c",
  "css",
  "html",
  "javascript",
  "json",
  "lua",
  "markdown",
  "markdown_inline",
  "python",
  "query",
  "regex",
  "tsx",
  "typescript",
  "vim",
  "vimdoc",
  "yaml",
}

local function ensure_parsers()
  local installed = treesitter.get_installed()
  local installed_map = {}
  for _, lang in ipairs(installed) do
    installed_map[lang] = true
  end

  local missing = {}
  for _, lang in ipairs(ensure_installed) do
    if not installed_map[lang] then
      table.insert(missing, lang)
    end
  end

  if #missing > 0 then
    treesitter.install(missing, { summary = true })
  end
end

vim.schedule(ensure_parsers)

local ts_group = vim.api.nvim_create_augroup("nvim_treesitter_features", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = ts_group,
  callback = function(args)
    local ok = pcall(vim.treesitter.start, args.buf)
    if ok then
      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
