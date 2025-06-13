-- require "nvchad.mappings"

local map = vim.keymap.set

map("n", "<leader>h", "<C-w>h")
map("n", "<leader>l", "<C-w>l")
map("n", "<leader>j", "<C-w>j")
map("n", "<leader>k", "<C-w>k")
map("n", "<C-k>", "<C-u>")
map("n", "<C-j>", "<C-d>")
map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Neotree toggle" })

map("n", "U", "<cmd>redo<cr>", { desc = "Redo" })
map("n", "P", "<cmd>b#<cr>", { desc = "Switch oldfiles" })

map("n", "G", "Gzz", { desc = "Auto zz with G" })
map("n", "*", "*N", { desc = "Highlights" })

map("n", "<leader>q", function()
  vim.lsp.buf.code_action {}
end, { desc = "Quick fix" })

map("n", "L", "<cmd>bnext<cr>", { desc = "Buffer next" })
map("n", "H", "<cmd>bprevious<cr>", { desc = "Buffer previous" })

local builtin = require "telescope.builtin"
map("n", "<leader>fa", function()
  builtin.find_files {
    prompt_title = "",
    preview_title = "",
    follow = true,
    no_ignore = true,
    hidden = true,
  }
end, { desc = "telescope find all files" })

map("n", "<leader>ff", function()
  builtin.find_files {}
end, { desc = "telescope find files" })

map("n", "<leader>fb", function()
  builtin.buffers {
    sort_lastused = true,
  }
end, { desc = "Telescope buffers" })

map("n", "<leader>fg", function()
  builtin.live_grep {}
end, { desc = "Telescope live grep" })

map("n", "<leader>fs", function()
  require("telescope").extensions.aerial.aerial {}
end, { desc = "Symbols" })

map("n", "<leader>fz", function()
  builtin.current_buffer_fuzzy_find {}
end, { desc = "Current buffer" })

map("n", "<leader>fd", function()
  builtin.diagnostics {
    sort_by = "severity",
  }
end, { desc = "diagnostics" })

map("n", "<leader>fe", function()
  require("telescope").extensions.file_browser.file_browser {
    path = "%:p:h",
    select_buffer = true,
    initial_mode = "normal",
  }
end)

map("n", "<leader>fo", function()
  builtin.oldfiles {
    sort_lastused = true,
    only_cwd = true,
  }
end, { desc = "Telescope oldfiles" })

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

map("v", "<leader>r", "<cmd>SnipRun<cr>", { desc = "Run code" })

-- local nomap = vim.keymap.del
-- nomap("i", "<C-b>")
-- nomap("i", "<C-e>")
-- nomap("i", "<C-h>")
-- nomap("i", "<C-l>")
-- nomap("i", "<C-j>")
-- nomap("i", "<C-k>")
-- nomap("n", "<C-h>")
-- nomap("n", "<C-l>")
-- nomap("n", "<Esc>")
-- nomap("n", "<C-s>")
-- nomap("n", "<C-c>")
-- nomap("n", "<leader>n")
-- nomap("n", "<leader>rn")
-- nomap("n", "<leader>ch")
-- nomap({ "n", "x" }, "<leader>fm")
-- nomap("n", "<leader>ds")
-- nomap("n", "<leader>b")
-- nomap("n", "<tab>")
-- nomap("n", "<S-tab>")
-- nomap("n", "<leader>x")
-- nomap("n", "<leader>/")
-- nomap("v", "<leader>/")
-- nomap("n", "<C-n>")
-- nomap("n", "<leader>fw")
-- nomap("n", "<leader>fh")
-- nomap("n", "<leader>ma")
-- nomap("n", "<leader>cm")
-- nomap("n", "<leader>gt")
-- nomap("n", "<leader>pt")
-- nomap("n", "<leader>th")
-- nomap("n", "<leader>v")
-- nomap({ "n", "t" }, "<A-v>")
-- nomap({ "n", "t" }, "<A-h>")
-- nomap({ "n", "t" }, "<A-i>")
-- nomap("n", "<leader>wK")
-- nomap("n", "<leader>wk")
--
