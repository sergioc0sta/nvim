return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        go = { "golangcilint" },
        ruby = { "standardrb" },
        c = { "cpplint" },
        cpp = { "cpplint" },
      },
      linters = {
        eslint_d = {
          condition = function()
            return vim.fn.executable("eslint_d") == 1
          end,
        },
        golangcilint = {
          prepend_args = {
            "--config",
            "/Users/sco/.config/nvim/.golangci.yml",
          },
        },
      },
    },
  },
}
