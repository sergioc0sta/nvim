-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

vim.g.autoformat = false
vim.g.snacks_animate = false

opt.foldmethod = "expr"
opt.foldexpr = "v:lua.LazyVim.treesitter.foldexpr()"
opt.foldcolumn = "1"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.relativenumber = true
opt.colorcolumn = "120"
opt.wrap = true
opt.textwidth = 120
opt.smoothscroll = false
opt.fillchars = {
  eob = " ",
  fold = " ",
  foldopen = "",
  foldsep = " ",
  foldclose = "",
  diff = "╱",
}
