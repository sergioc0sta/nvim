return {
  {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    event = "VeryLazy",
    version = "2.*",
    opts = {
      filter_rules = {
        include_current_win = false,
        autoselect_one = true,
        bo = {
          filetype = { "neo-tree", "neo-tree-popup", "notify" },
          buftype = { "terminal", "quickfix" },
        },
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      {
        "<leader>fe",
        function()
          if vim.bo.filetype == "neo-tree" then
            vim.cmd("wincmd p")
          else
            vim.cmd("Neotree focus position=right reveal")
          end
        end,
        desc = "Explorer NeoTree (Root Dir)",
      },
      {
        "<leader>fE",
        function()
          if vim.bo.filetype == "neo-tree" then
            vim.cmd("wincmd p")
          else
            vim.cmd("Neotree focus position=right")
          end
        end,
        desc = "Explorer NeoTree (cwd)",
      },
      {
        "<leader>e",
        function()
          if vim.bo.filetype == "neo-tree" then
            vim.cmd("wincmd p")
          else
            vim.cmd("Neotree focus position=right reveal")
          end
        end,
        desc = "Explorer",
      },
      {
        "<leader>E",
        function()
          if vim.bo.filetype == "neo-tree" then
            vim.cmd("wincmd p")
          else
            vim.cmd("Neotree focus position=right")
          end
        end,
        desc = "Explorer (cwd)",
      },
    },
    opts = {
      window = {
        position = "right",
        mappings = {
          ["w"] = "open_with_window_picker",
          ["<C-x>"] = "split_with_window_picker",
          ["<C-v>"] = "vsplit_with_window_picker",
          ["<tab>"] = "toggle_node",
          ["<space>"] = false,
        },
      },
    },
  },
  {
    "zbirenbaum/copilot.lua",
    opts = {
      panel = {
        enabled = true,
      },
    },
  },
}
