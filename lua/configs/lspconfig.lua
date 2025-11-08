require("nvchad.configs.lspconfig").defaults()

local nvlsp = require "nvchad.configs.lspconfig"
local has_modern_lsp = vim.fn.has "nvim-0.11" == 1 and vim.lsp and vim.lsp.config and vim.lsp.enable
local legacy_lspconfig = not has_modern_lsp and require "lspconfig" or nil

local base = {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

local function configure_server(name, opts)
  local config = vim.tbl_deep_extend("force", {}, base, opts or {})

  if has_modern_lsp then
    vim.lsp.config(name, config)
    vim.lsp.enable(name)
    return
  end

  legacy_lspconfig[name].setup(config)
end

local function make_root_resolver(resolver)
  return function(arg, on_dir)
    local path = arg
    if type(arg) == "number" then
      path = vim.api.nvim_buf_get_name(arg)
    end

    if not path or path == "" then
      path = vim.loop.cwd()
    end

    local root = resolver(path)
    if type(on_dir) == "function" then
      if root then
        on_dir(root)
      end
      return
    end

    return root
  end
end

local go_root_dir = make_root_resolver(function(fname)
  return vim.fs.root(fname, { "go.work", "go.mod", ".git" })
end)

for _, server in ipairs { "html", "cssls" } do
  configure_server(server)
end

configure_server "ts_ls"

configure_server("gopls", {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = go_root_dir,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    },
  },
})

configure_server("clangd", {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    if type(nvlsp.on_attach) == "function" then
      nvlsp.on_attach(client, bufnr)
    end
  end,
})

configure_server("protols", {
  filetypes = { "proto" },
})
