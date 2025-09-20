return {
  -- Plugins principais
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "leoluz/nvim-dap-go",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      require "configs.dap"
    end,
  },
  {
    "microsoft/vscode-js-debug",
    lazy = true,
    build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
  },
  {
    "stevearc/conform.nvim",
    config = function()
      require "configs.conform"
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = {
        enable = true,
      },
      view = {
        side = "right",
        width = 30,
        preserve_window_proportions = true,
      },
      renderer = {
        highlight_git = true,
        icons = {
          show = {
            git = true,
          },
        },
      },
    },
  },
  {
    "andrewferrier/debugprint.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    commit = "29be0919b91fb59eca9e90690d76014233392bef",
    config = function()
      -- CORES CORRIGIDAS (formato hexadecimal válido: 6 ou 8 dígitos)
      local highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
      }
      
      local hooks = require "ibl.hooks"
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
      end)

      vim.g.rainbow_delimiters = { highlight = highlight }
      require("ibl").setup {
        scope = {
          highlight = highlight,
          show_start = false,
          show_end = false,
        }
      }
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "prettier",
        "eslint_d",
        "dart-debug-adapter",
        "gopls",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "c",
        "go",
        "markdown",
        "markdown_inline",
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    config = function()
      local lint = require "lint"
      lint.linters_by_ft = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        go = {"golangcilint"},
        ruby = { "standardrb" },
      }

      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })

      vim.keymap.set("n", "<leader>ll", function()
        lint.try_lint()
      end, { desc = "Trigger linting for current file" })
    end,
  },
  {
    "sbdchd/neoformat",
    cmd = "Neoformat",
  },
  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
  },
{
  "mrbeardad/nvim-multi-cursor",
  dependencies = { { "folke/flash.nvim", opts = {} } },
  keys = {
    -- Adiciona cursores para baixo e para cima
    {
      "<C-j>",
      function()
        require("nvim-multi-cursor").toggle_cursor_downward()
      end,
      mode = { "n" },
      desc = "Adicionar cursor para baixo",
    },
    {
      "<C-k>",
      function()
        require("nvim-multi-cursor").toggle_cursor_upward()
      end,
      mode = { "n" },
      desc = "Adicionar cursor para cima",
    },
    -- Atalho para alternar cursor na posição atual (você pode usar <Leader>m aqui)
    {
      "<Leader>m",
      function()
        require("nvim-multi-cursor").toggle_cursor_at_curpos()
      end,
      mode = { "n" },
      desc = "Alternar cursor na posição atual",
    },
    -- Seleção baseada em flash (busca interativa)
    {
      "<Leader>ms",
      function()
        require("nvim-multi-cursor").toggle_cursor_by_flash()
      end,
      mode = { "n" },
      desc = "Selecionar regiões e alternar cursores (flash)",
    },
    -- Seleciona todas as ocorrências da palavra sob o cursor
    {
      "<Leader>mw",
      function()
        require("nvim-multi-cursor").toggle_cursor_by_flash(vim.fn.expand("<cword>"))
      end,
      mode = { "n" },
      desc = "Selecionar todas as ocorrências da palavra",
    },
  },
  opts = {
    hl_group = "IncSearch", -- destaque dos cursores
  },
},
  {
    "rhysd/conflict-marker.vim",
    lazy = false,
  },
}
