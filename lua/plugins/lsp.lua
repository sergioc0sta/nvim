local function root_resolver(patterns)
  return function(fname)
    local root = vim.fs.root(fname, patterns)
    return root
  end
end

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      folds = {
        enabled = false,
      },
      servers = {
        html = {},
        cssls = {},
        ts_ls = {},
        gopls = {
          cmd = { "gopls" },
          filetypes = { "go", "gomod", "gowork", "gotmpl" },
          root_dir = root_resolver({ "go.work", "go.mod", ".git" }),
          settings = {
            gopls = {
              gofumpt = true,
              codelenses = {
                gc_details = false,
                generate = true,
                regenerate_cgo = true,
                run_govulncheck = true,
                test = true,
                tidy = true,
                upgrade_dependency = true,
                vendor = true,
              },
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
              analyses = {
                nilness = true,
                unusedparams = true,
                unusedwrite = true,
                useany = true,
                shadow = true,
              },
              usePlaceholders = true,
              completeUnimported = true,
              staticcheck = true,
              directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
              semanticTokens = true,
            },
          },
        },
        clangd = {
        },
        protols = {
          filetypes = { "proto" },
        },
      },
      setup = {
        gopls = function()
          Snacks.util.lsp.on({ name = "gopls" }, function(_, client)
            if not client.server_capabilities.semanticTokensProvider then
              local semantic = client.config.capabilities.textDocument.semanticTokens
              client.server_capabilities.semanticTokensProvider = {
                full = true,
                legend = {
                  tokenTypes = semantic.tokenTypes,
                  tokenModifiers = semantic.tokenModifiers,
                },
                range = true,
              }
            end
          end)
        end,
        clangd = function()
          Snacks.util.lsp.on({ name = "clangd" }, function(_, client)
            client.server_capabilities.signatureHelpProvider = false
          end)
        end,
      },
    },
  },
}
