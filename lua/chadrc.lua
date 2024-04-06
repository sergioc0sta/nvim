-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "chadracula-evondev",
  statusline = {
    overriden_modules = function(modules)
      table.insert(
        modules,
        2,
        (function()
          local current_dir = vim.fn.getcwd()
          local buffer_path = vim.api.nvim_buf_get_name(0)
          local relative_path = buffer_path:sub(#current_dir + 2)
          return "%#St_LspStatus#" .. relative_path
        end)()
      )
    end,
    theme = "vscode_colored",
    enabled = true,
    options = {
      "encoding",
      "fileformat",
      "filetype",
      "copilot",
    },
  },
  hl_override = {
  	Comment = { italic = true },
  },
  hl_add = {
    NvimTreeOpenedFolderName = { fg = "green", bold = true },
  },
}

return M
