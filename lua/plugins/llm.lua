return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    opts = {
      -- add any opts here
      -- for example
      --
      provider = "copilot", -- or "copilot", "openai", "claude"
      -- openai = {
      -- 	endpoint = "https://api.openai.com/v1",
      -- 	model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
      -- 	timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
      -- 	temperature = 0,
      -- 	max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
      -- 	--reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
      -- },
      ---@type AvanteSupportedProvider
      copilot = {
        endpoint = "https://api.githubcopilot.com",
        model = "gpt-4o-2024-08-06",
        proxy = nil, -- [protocol://]host[:port] Use this proxy
        allow_insecure = false, -- Allow insecure server connections
        timeout = 30000, -- Timeout in milliseconds
        temperature = 0,
        max_tokens = 20480,
      },
      claude = {
        endpoint = "https://api.anthropic.com",
        model = "claude-3-7-sonnet-20250219",
        timeout = 30000, -- Timeout in milliseconds
        temperature = 0,
        max_tokens = 20480,
      },
      behaviour = {
        enable_token_counting = true,
      },
      mappings = {
        sidebar = {
          switch_windows = "noop",
          reverse_switch_windows = "noop",
        },
      },
      windows = {
        width = 30, -- default % based on available width in vertical layout
        position = "right",
        sidebar_header = {
          enabled = false, -- true, false to enable/disable the header
          align = "right", -- left, center, right for title
          rounded = false,
        },
        input = {
          prefix = "❯ ",
        },
        edit = {
          start_insert = true, -- Start insert mode when opening the edit window
          border = "rounded", -- border style for the edit window
        },
        ask = {
          floating = false, -- Open the 'AvanteAsk' prompt in a floating window
          start_insert = true, -- Start insert mode when opening the ask window
          border = "rounded", -- border style for the ask window
          ---@type "ours" | "theirs"
          focus_on_apply = "theirs", -- which diff to focus after applying
        },
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "Avante" },
        },
        ft = { "Avante" },
      },
    },
  },
  {
    "github/copilot.vim",
  },
  -- { "augmentcode/augment.vim" },
}
