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
              analyses = {
                unusedparams = true,
                shadow = true,
              },
              staticcheck = true,
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
        clangd = function()
          Snacks.util.lsp.on({ name = "clangd" }, function(_, client)
            client.server_capabilities.signatureHelpProvider = false
          end)
        end,
      },
    },
  },
}
