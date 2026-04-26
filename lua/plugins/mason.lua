return {
  {
    "mason.nvim",
    opts = {
      ensure_installed = {
        -- LSP
        "lua-language-server",
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "tailwindcss-language-server",
        "vue-language-server",
        "gopls",
        "clangd",
        "protols",
        "rust-analyzer",
        "intelephense",
        "sqls",
        "postgres-language-server",
        "zls",

        -- Formatters
        "stylua",
        "prettier",
        "clang-format",
        "goimports",
        "gofumpt",
        "shfmt",
        "black",
        "isort",
        "sql-formatter",

        -- Linters
        "eslint_d",
        "cpplint",
        "golangci-lint",
        "protolint",
        "standardrb",
        "shellcheck",
        "pydocstyle",

        -- DAP
        "cpptools",
        "delve",
        "go-debug-adapter",
        "js-debug-adapter",
      },
    },
  },
}
