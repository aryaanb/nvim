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
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = { "go", "python", "javascript" },
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
}

return plugins
