---@type ChadrcConfig
local M = {}

M.ui = {
  theme = 'rosepine',
  -- transparency = true,
  hl_override = {
    CursorLine = {
      -- bg = "#3c3836" -- gruv
      -- bg = "#414868"
    }
  },
  telescope = {
    style = "bordered"
  },
  tabufline = {
    enabled = false
  },
  statusline = {
    theme="minimal",
    separator_style = "round",
  }
}
M.plugins = "custom.plugins"
M.mappings = require "custom.pluginMappings"

return M
