return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    enabled = false, -- Disable the original Copilot plugin
    event = "InsertEnter",
    config = function()
      require("copilot").setup {
        suggestion = {
          enabled = true,
          auto_trigger = true,
          hide_during_completion = true,
          debounce = 75,
          trigger_on_accept = true,
          keymap = {
            accept = "<Tab>",
          },
        },
        panel = { enabled = false },
        copilot_model = "claude-sonnet-4",
        -- copilot_model = "gpt-4o-copilot", -- or "gpt-3.5-turbo"
      }
    end,
  },
  {
    "github/copilot.vim",
    enabled = true, -- Disable the original Copilot plugin
  },
}
