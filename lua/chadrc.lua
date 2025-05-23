-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

local colors = {
  fg = "#c6c8d1",
  bg550 = "#191919",
  bg500 = "#181818",
  bg450 = "#161616",
  bg400 = "#1e1e1e",
  bg300 = "#222222",
  bg200 = "#272727",
  border = "#393c3d",
  red500 = "#ec6b64",
  red600 = "#ff2852",
  blue500 = "#6d8dad",
  yellow500 = "#d6b676",
}

M.base46 = {
  theme = "gruvchad",
  transparency = true,

  hl_add = {
    AvanteSidebarWinSeparator = { bg = colors.bg500, fg = colors.border },
    AvanteSidebarWinHorizontalSeparator = { bg = colors.bg500, fg = colors.bg500 },
    NeoTreeWinSeparator = { bg = colors.bg500, fg = colors.border },
    NeoTreeCursorLine = { bg = colors.bg300 },
    BlinkCmpMenuBorder = { fg = colors.border },
    BlinkCmpDocBorder = { fg = colors.border },
  },

  hl_override = {
    Normal = { bg = colors.bg500, bold = false },
    St_Mode = { bg = colors.bg500 },
    FloatBorder = { fg = colors.border },
    BlinkCmpMenuBorder = { fg = colors.border },

    -- TelescopePromptNormal = { fg = colors.fg, bg = colors.bg400 },
    -- TelescopePromptPrefix = { bg = colors.bg400 },
    -- TelescopePromptBorder = { fg = colors.bg400, bg = colors.bg400 },
    -- TelescopeNormal = { bg = colors.bg400 },
    -- TelescopeBorder = { fg = colors.bg400, bg = colors.bg400 },
    -- TelescopeSelection = { bg = colors.bg200 },
  },
}

M.nvdash = {
  load_on_startup = true,
  enabled = false,
}
M.ui = {
  telescope = { style = "bordered" }, -- borderless / bordered

  tabufline = {
    enabled = false,
    lazyload = false,
  },
  statusline = {
    theme = "vscode",
    separator_style = "default",
    order = nil,
    modules = nil,
  },
}

return M
