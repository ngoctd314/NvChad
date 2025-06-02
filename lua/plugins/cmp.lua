dofile(vim.g.base46_cache .. "blink")

local ui = require("nvconfig").ui.cmp
local atom_styled = ui.style == "atom" or ui.style == "atom_colored"

local menu_cols
if atom_styled or ui.icons_left then
  menu_cols = { { "kind_icon" }, { "label" }, { "kind" } }
else
  menu_cols = { { "label" }, { "kind_icon" }, { "kind" } }
end

return {
  {
    "hrsh7th/nvim-cmp",
    enabled = false,
  },
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
          window = { border = atom_styled and "none" or "single" },
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
          border = atom_styled and "none" or "single",
          draw = {
            columns = menu_cols,
            components = {
              kind_icon = {
                text = function(ctx)
                  local icons = require "nvchad.icons.lspkind"
                  local icon = (icons[ctx.kind] or "󰈚")

                  if atom_styled then
                    icon = " " .. icon .. " "
                  end

                  return icon
                end,
              },

              kind = {
                highlight = function(ctx)
                  return atom_styled and "comment" or ctx.kind
                end,
              },
            },
          },
        },
      },
      signature = {
        enabled = true,
        window = {
          show_documentation = true,
          border = atom_styled and "none" or "single",
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
