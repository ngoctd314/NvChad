local map = vim.keymap.set

return {
  "neovim/nvim-lspconfig",
  lazy = false,
  dependencies = {
    "saghen/blink.cmp",
    { "williamboman/mason.nvim", opts = {} },
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "nvim-telescope/telescope.nvim",
  },

  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or "n"
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end
        local telescope = require "telescope.builtin"

        map("gd", telescope.lsp_definitions, "Goto Definition")
        map("gD", vim.lsp.buf.declaration, "Goto Declaration")
        map("gR", telescope.lsp_references, "Goto References")
        map("gI", telescope.lsp_implementations, "Goto Implementation")
        map("<leader>q", vim.lsp.buf.code_action, "Code Action", { "n", "x" })
        map("<leader>rn", vim.lsp.buf.rename, "Rename")
      end,
    })

    vim.diagnostic.config {
      severity_sort = true,
      float = { border = "single", max_width = 80 },
      underline = true,
      focusable = true,
      virtual_text = {
        prefix = "●",
        spacing = 2,
      },
    }
    map("n", "K", vim.diagnostic.open_float, { desc = "Open Diagnostics in Float" })
    map("n", "S", function()
      vim.lsp.buf.hover {
        border = "single", -- solid
        max_width = 80,
        focusable = false,
        silent = true,
      }
    end, { desc = "show documentation", buffer = buf })

    local servers = {
      gopls = {},

      lua_ls = {},

      ts_ls = {},
      html = {},
      cssls = {},
      tailwindcss = {},

      pyright = {},

      jsonls = {},
    }

    local original_capabilities = vim.lsp.protocol.make_client_capabilities()
    local capabilities = require("blink.cmp").get_lsp_capabilities(original_capabilities)

    -- local signatureHelp = vim.lsp.buf.signature_help
    -- vim.lsp.buf.signature_help = function()
    --   return signatureHelp {
    --     title = "Test",
    --     title_pos = "left",
    --     border = "single",
    --     max_width = 80,
    --     focusable = false,
    --     silent = true,
    --   }
    -- end
    vim.lsp.buf.signature_help = function() end

    local ensure_installed = vim.tbl_keys(servers or {})
    require("mason-tool-installer").setup { ensure_installed = ensure_installed }

    require("mason-lspconfig").setup {
      ensure_installed = {},
      automatic_installation = false,
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
          vim.lsp.config(server_name, server)
        end,
      },
    }
  end,
}
