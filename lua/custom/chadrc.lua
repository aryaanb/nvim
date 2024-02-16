---@type ChadrcConfig
local M = {}

M.ui = {
  theme = 'tokyodark',
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
}
M.plugins = "custom.plugins"
M.mappings = require "custom.pluginMappings"

return M
