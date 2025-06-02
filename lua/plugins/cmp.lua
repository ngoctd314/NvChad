local menu_cols = { { "label" }, { "kind_icon" }, { "kind" } }

return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "rafamadriz/friendly-snippets",
      "Kaiser-Yang/blink-cmp-avante",
    },

    version = "1.*",

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = "none",

        ["<CR>"] = { "accept", "fallback" },
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
      },

      appearance = {
        nerd_font_variant = "mono",
      },

      -- (Default) Only show the documentation popup when manually triggered
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 100,
          window = { border = "single" },
        },
        list = {
          selection = {
            preselect = false,
            -- When `true`, inserts the completion item automatically when selecting it
            auto_insert = true,
          },
        },
        menu = {
          scrollbar = false,
          border = "single",
          draw = {
            columns = menu_cols,
            components = {},
          },
        },
      },
      signature = {
        enabled = true,
        window = {
          show_documentation = true,
          border = "single",
        },
      },
      cmdline = {
        keymap = { preset = "inherit" },
        completion = {
          menu = { auto_show = true },
          list = {
            selection = {
              -- When `true`, will automatically select the first item in the completion list
              preselect = false,
              -- When `true`, inserts the completion item automatically when selecting it
              auto_insert = true,
            },
          },
          ghost_text = { enabled = false },
        },
      },

      sources = {
        default = { "avante", "lsp", "path", "snippets", "buffer" },
        providers = {
          avante = {
            module = "blink-cmp-avante",
            name = "Avante",
            opts = {},
          },
        },
      },

      fuzzy = {
        implementation = "prefer_rust_with_warning",
        sorts = {
          "exact",
          -- defaults
          "score",
          "sort_text",
        },
      },
    },
    opts_extend = { "sources.default" },
  },
}
