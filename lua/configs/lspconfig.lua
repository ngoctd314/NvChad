require("nvchad.configs.lspconfig").defaults()

-- read :h vim.lsp.config for changing options of lsp servers

local servers = { "html", "cssls", "gopls" }
vim.lsp.enable "gopls"
vim.lsp.config("gopls", {
  cmd = { "gopls" },
  settings = {},
})
