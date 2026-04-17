local servers = { "lua_ls", "pyright", "ts_ls", "gopls", "rust_analyzer" }

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = servers,
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr, silent = true }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
end

local function setup_server(server, opts)
  opts = vim.tbl_deep_extend("force", {
    capabilities = capabilities,
    on_attach = on_attach,
  }, opts or {})

  if vim.lsp and vim.lsp.config and vim.lsp.enable then
    vim.lsp.config(server, opts)
    vim.lsp.enable(server)
    return
  end

  local ok, lspconfig = pcall(require, "lspconfig")
  if ok and lspconfig[server] then
    lspconfig[server].setup(opts)
  end
end

setup_server("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        checkThirdParty = false,
      },
    },
  },
})

for _, server in ipairs({ "pyright", "ts_ls" }) do
  setup_server(server)
end
