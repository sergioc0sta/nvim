return {
  {
    "sainnhe/everforest",
    name = "everforest",
    priority = 1000,
    init = function()
      vim.o.background = "dark"
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
  {
    "navarasu/onedark.nvim",
    name = "onedark",
    priority = 1000,
    config = function()
      require("onedark").setup({
        style = "deep",
      })
      vim.cmd.colorscheme("onedark")
    end,
  },
}
