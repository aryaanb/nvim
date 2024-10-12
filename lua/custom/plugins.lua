local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Golang
        "gopls",
        -- Python
        "black",
        "debugpy",
        "mypy",
        "ruff",
        "pyright",
        -- JavaScript
        "eslint-lsp",
        "js-debug-adapter",
        "prettier",
        "typescript-language-server",
        "emmet-language-server",
        "tailwindcss-language-server",
        "css-lsp",
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = { "go", "python", "javascript", "typescript" },
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
      require("core.utils").load_mappings("gopher")
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
  {
    "theprimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("harpoon"):setup()
    end,
    keys = {
      { "<leader>a", function() require("harpoon"):list():append() end,  desc = "harpoon file", },
      {
        "<leader>ha",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "harpoon quick menu",
      },
      { "<leader>1", function() require("harpoon"):list():select(1) end, desc = "harpoon to file 1", },
      { "<leader>2", function() require("harpoon"):list():select(2) end, desc = "harpoon to file 2", },
      { "<leader>3", function() require("harpoon"):list():select(3) end, desc = "harpoon to file 3", },
      { "<leader>4", function() require("harpoon"):list():select(4) end, desc = "harpoon to file 4", },
      { "<leader>5", function() require("harpoon"):list():select(5) end, desc = "harpoon to file 5", },
    },
  },
}

return plugins
