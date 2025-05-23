return {
  -- {
  --   import = "nvchad.blink.lazyspec",
  --   opts = {
  --     keymap = {
  --       preset = "none",
  --
  --       ["<CR>"] = { "accept", "fallback" },
  --       ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
  --       ["<C-j>"] = { "select_next", "fallback" },
  --       ["<C-k>"] = { "select_prev", "fallback" },
  --       ["<Up>"] = { "select_prev", "fallback" },
  --       ["<Down>"] = { "select_next", "fallback" },
  --     },
  --   },
  -- },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    lazy = true,
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    lazy = false,
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },
  {
    "m4xshen/hardtime.nvim",
    lazy = false,
    enabled = false,
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },

      views = {
        popupmenu = {
          scrollbar = false,
        },
      },
    },
  },
}
