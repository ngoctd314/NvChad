return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- {
    --   "antosha417/nvim-lsp-file-operations",
    --   dependencies = {
    --     "nvim-lua/plenary.nvim",
    --     "nvim-neo-tree/neo-tree.nvim", -- makes sure that this loads after Neo-tree.
    --   },
    --   config = function()
    --     require("lsp-file-operations").setup()
    --   end,
    -- },
    {
      "s1n7ax/nvim-window-picker", -- for open_with_window_picker keymaps
      version = "2.*",
      config = function()
        require("window-picker").setup {
          filter_rules = {
            include_current_win = false,
            autoselect_one = true,
            -- filter using buffer options
            bo = {
              -- if the file type is one of following, the window will be ignored
              filetype = { "neo-tree", "neo-tree-popup", "notify" },
              -- if the buffer type is one of following, the window will be ignored
              buftype = { "terminal", "quickfix" },
            },
          },
        }
      end,
    },
  },
  lazy = false, -- neo-tree will lazily load itself
  ---@module "neo-tree"
  ---@type neotree.Config?
  opts = {
    -- fill any relevant options here
    enable_git_status = false,
    enable_diagnostics = false,
    hide_root_node = true,
    open_files_in_last_window = false,
    popup_border_style = "NC", -- "NC", "double", "rounded", "single", "solid", (or "" to use 'winborder' on Neovim v0.11+)
    window = {
      mappings = {
        ["<space>"] = "noop",
        ["Z"] = "expand_all_nodes",
        ["c"] = {
          "copy",
          config = {
            show_path = "absolute", -- "none", "relative", "absolute"
          },
        },
        ["Y"] = {
          function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            vim.fn.setreg("+", path, "c")
          end,
          desc = "Copy Path to Clipboard",
        },
      },
    },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
      },
      window = {
        mappings = {
          ["f"] = "noop",
        },
      },
      bind_to_cwd = false,
      use_libuv_file_watcher = true,
      follow_current_file = {
        enabled = true,
        leave_dirs_open = true, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
      },
    },
  },
}
