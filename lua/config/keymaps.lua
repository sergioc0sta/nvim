-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("n", ";", ":", { desc = "Command Mode" })
map("i", "jk", "<Esc>", { desc = "Escape Insert Mode" })

map("n", "<leader>fr", function()
  LazyVim.format({ force = true })
end, { desc = "Format" })

map("n", "<leader>co", "<cmd>Copilot panel<cr>", { desc = "Copilot Panel" })
map("n", "<leader>w", "<cmd>write<cr>", { desc = "Save File" })
map("n", "<leader>q", "<cmd>quit<cr>", { desc = "Quit" })
map("n", "<leader>wq", "<cmd>wq<cr>", { desc = "Save and Quit" })
map("n", "<leader>b", "<cmd>Neotree toggle position=right<cr>", { desc = "Toggle Tree" })
map("n", "<leader>sl", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader>sh", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
map("n", "<leader>r", "<cmd>redo<cr>", { desc = "Redo" })
map({ "n", "t" }, "<leader>ot", function()
  Snacks.terminal.focus(vim.o.shell, { cwd = LazyVim.root() })
end, { desc = "Terminal (Floating)" })
map("n", "<leader>ll", function()
  require("lint").try_lint()
end, { desc = "Lint Current File" })

map("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })
map("n", "<leader>dc", function()
  require("dap").continue()
end, { desc = "Start or Continue Debugger" })
map("n", "<leader>dr", function()
  require("dap").repl.open()
end, { desc = "Open Debugger REPL" })
map("n", "<leader>du", function()
  require("dapui").toggle()
end, { desc = "Toggle Debugger UI" })
map("n", "<leader>tg", function()
  require("dap-go").debug_test()
end, { desc = "Debug Go Test" })
map("n", "<leader>tc", function()
  local dap = require("dap")
  local configs = dap.configurations.c or {}
  if #configs > 0 then
    dap.run(configs[1])
  else
    vim.notify("DAP C/C++ not configured (cpptools missing)", vim.log.levels.WARN)
  end
end, { desc = "Debug C/C++ (launch executable)" })

map("n", "<leader>go", function()
  vim.cmd("diffget //2")
end, { desc = "Accept Ours" })

map("n", "<leader>gt", function()
  vim.cmd("diffget //3")
end, { desc = "Accept Theirs" })
