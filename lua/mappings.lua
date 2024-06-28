require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>pr", "<cmd>Neoformat<CR>", { desc = "Format" })
map("n", "<leader>co", "<cmd> Copilot panel <CR>", { desc = "CopilotePanell" })
map("n", "<leader>w", "<cmd> w <CR>", { desc = "Save file" })
map("n", "<leader>q", "<cmd> q <CR>", { desc = "Exit file" })
map("n", "<leader>wq", "<cmd> wq <CR>", { desc = "Exit and save" })
map("n", "<leader>b", "<cmd> NvimTreeToggle <CR>", { desc = "Toggle Tree" })
map("n", "<leader>sl", "<cmd> tabNext <CR>", { desc = "Next tab" })
map("n", "<leader>sh", "<cmd> tabprevious <CR>", { desc = "Previoues tab" })
map("n", "<leader>r", "<cmd> redo <cr>", { desc = "rendo" })-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
