---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "everforest",
}

M.ui = {
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
    theme = "vscode",
    enabled = true,
    options = {
      "encoding",
      "fileformat",
      "filetype",
      "copilot",
    },
  },
  hl_override = {
    Comment = { italic = true},
  },
  hl_add = {
    NvimTreeOpenedFolderName = { fg = "green", bold = true },
  },
}


return M
