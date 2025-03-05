-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true })
map("n", "<C-c>", "<cmd>nohlsearch<CR>", { silent = true })
map({ "i", "v" }, "<C-c>", "<Esc>", { noremap = true, silent = true })
map("n", "<leader>;", ":")
--paging cursor center
map("n", "<C-d>", "<C-d>zz")
map("v", "<C-d>", "<C-d>zz")
-- search selection cursor center
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
-- Diagnostic keymaps
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
-- move visual selection
-- map("v", "J", ":m '>+1<CR>gv=gv")
-- map("v", "K", ":m '<-2<CR>gv=gv")
-- better line joining
-- map("n", "J", "mzJ`z", { noremap = true, silent = true })
-- delete without yank
-- map("n", ";d", '"_d', { desc = "Delete without yank" })
-- map("v", ";d", '"_d', { desc = "Delete without yank" })
-- Window management
map("n", "<leader>vv", ":vsplit<CR>", { noremap = true, silent = true, desc = "Vertical Split" })
map("n", "<leader>vh", ":split<CR>", { noremap = true, silent = true, desc = "Horizontal Split" })

--vim.api.nvim_set_keymap('n', '<leader>h', ':split<CR>', { noremap = true, silent = true, desc = "Horizontal Split" })
-- map("n", "<leader>w", ":close<CR>", { noremap = true, silent = true, desc = "Close Window" })
map("n", "<leader>fw", ":wa | only<CR>", { noremap = true, silent = true })
map("n", "<leader>rr", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
map({ "n", "v" }, "<leader>sb", "<cmd>FzfLua grep_curbuf<cr>", { desc = "Buffer" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
vim.keymap.del({ "n", "v" }, "<C-F>")
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
