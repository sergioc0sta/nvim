require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>fr", "<cmd>Neoformat<CR>", { desc = "Format" })
map("n", "<leader>co", "<cmd> Copilot panel <CR>", { desc = "CopilotePanell" })
map("n", "<leader>w", "<cmd> w <CR>", { desc = "Save file" })
map("n", "<leader>q", "<cmd> q <CR>", { desc = "Exit file" })
map("n", "<leader>wq", "<cmd> wq <CR>", { desc = "Exit and save" })
map("n", "<leader>b", "<cmd> NvimTreeToggle <CR>", { desc = "Toggle Tree" })
map("n", "<leader>sl", "<cmd> tabNext <CR>", { desc = "Next tab" })
map("n", "<leader>sh", "<cmd> tabprevious <CR>", { desc = "Previoues tab" })
map("n", "<leader>r", "<cmd> redo <cr>", { desc = "rendo" })-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", "<leader>db", "<cmd> lua require'dap'.toggle_breakpoint() <CR>", { desc = "Add breakpoint at line" })
map("n", "<leader>dc", "<cmd> lua require'dap'.continue() <CR>", { desc = "Start or continue the debugger" })
map("n", "<leader>dr", "<cmd> lua require'dap'.repl.open() <CR>", { desc = "Open debugger REPL" })
map("n", "<leader>du", "<cmd> lua require'dapui'.toggle() <CR>", { desc = "Toggle debugger UI" })
map("n", "<leader>td", "<cmd> lua require('dap-go').debug_test() <CR>", { desc = "Debug Go test" })
