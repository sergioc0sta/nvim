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
        cpplint = {
          prepend_args = {
            "--filter=-legal/copyright",
          },
        },
        eslint_d = {
          condition = function()
            return vim.fn.executable("eslint_d") == 1
          end,
          parser = function(output, bufnr)
            local json = output:match("^.-(%[[%s%S]*)$")
            if not json then
              return {}
            end

            local result = require("lint.linters.eslint").parser(json, bufnr)
            for _, diagnostic in ipairs(result) do
              diagnostic.source = "eslint_d"
            end
            return result
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
