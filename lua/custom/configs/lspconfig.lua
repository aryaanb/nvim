local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

-- lspconfig.emmet_ls.setup({
--   -- on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue" },
--   init_options = {
--     html = {
--       options = {
--         -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
--         ["bem.enabled"] = true,
--       },
--     },
--   }
-- })

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
})

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
  }
  vim.lsp.buf.execute_command(params)
end

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true,
    }
  },

  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports",
    }
  }
}

lspconfig.tailwindcss.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})


lspconfig.eslint.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.cssls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.emmet_language_server.setup({
  filetypes = { "css", "eruby", "html", "javascript", "typescript", "javascriptreact", "less", "sass", "scss", "pug", "typescriptreact" },
  -- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
  -- **Note:** only the options listed in the table are supported.
  init_options = {
    ---@type table<string, string>
    includeLanguages = {},
    --- @type string[]
    excludeLanguages = {},
    --- @type string[]
    extensionsPath = {},
    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
    preferences = {},
    --- @type boolean Defaults to `true`
    showAbbreviationSuggestions = true,
    --- @type "always" | "never" Defaults to `"always"`
    showExpandedAbbreviation = "always",
    --- @type boolean Defaults to `false`
    showSuggestionsAsSnippets = false,
    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
    syntaxProfiles = {},
    --- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
    variables = {},
  },
})
