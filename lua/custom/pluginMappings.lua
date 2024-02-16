local M = {}
M.gopher = {
  plugin = true,
  n = {
    ["<leader>gsj"] = {
      "<cmd> GoTagAdd json <CR>",
      "Add json struct tags"
    },
    ["<leader>gie"] = {
      "<cmd> GoIfErr <CR>",
      "Add if err block"
    }
  }
}
M.general = {
  n = {
    -- ...
    ["<leader>tt"] = {
      function()
        require("base46").toggle_transparency()
      end,
      "Toggle transparency",
    },
  },
}

return M
