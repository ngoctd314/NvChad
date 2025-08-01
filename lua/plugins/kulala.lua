function vim.getVisualSelection()
  vim.cmd 'noau normal! "vy"'
  local text = vim.fn.getreg "v"
  vim.fn.setreg("v", {})

  return text
end

return {
  "mistweaverco/kulala.nvim",
  ft = { "http", "rest" },
  opts = {
    -- your configuration comes here
    global_keymaps = {
      ["Send request"] = { -- sets global mapping
        "<CR>",
        function()
          require("kulala").run()
        end,
        mode = { "n", "v" }, -- optional mode, default is n
        desc = "Send request", -- optional description, otherwise inferred from the key
      },
    },
    kulala_keymaps = {
      ["Show verbose"] = false, -- set false to disable
    },
    ui = {
      pickers = {
        snacks = {},
      },
    },
  },
}
