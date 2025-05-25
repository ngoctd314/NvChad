return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
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
      },
    },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
      },
      window = {
        mappings = {
          ["f"] = "noop",
        },
      },
      follow_current_file = {
        enabled = true,
        leave_dirs_open = true, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
      },
    },
  },
}
