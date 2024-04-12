-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
map("n", "<Esc>", "<cmd>nohlsearch<CR>")
map("n", "<C-c>", "<cmd>nohlsearch<CR>")
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
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
-- better line joining
map("n", "J", "mzJ`z")
-- delete without yank
-- map("n", ";d", '"_d', { desc = "Delete without yank" })
-- map("v", ";d", '"_d', { desc = "Delete without yank" })
-- Window management
map("n", "<leader>vv", ":vsplit<CR>", { noremap = true, silent = true, desc = "Vertical Split" })
map("n", "<leader>vh", ":hsplit<CR>", { noremap = true, silent = true, desc = "Horizontal Split" })

--vim.api.nvim_set_keymap('n', '<leader>h', ':split<CR>', { noremap = true, silent = true, desc = "Horizontal Split" })
-- map("n", "<leader>w", ":close<CR>", { noremap = true, silent = true, desc = "Close Window" })
map("n", "<leader>fw", ":wa | only<CR>", { noremap = true, silent = true })
map("n", "<leader>rr", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
map("i", "∑", "<Esc>:w<CR>", { desc = "Write buffer" })
map("n", "∑", ":w<CR>", { desc = "Write buffer" })
map("v", "∑", ":w<CR>", { desc = "Write buffer" })
-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
map("n", "<leader>pv", ":Ex<CR>", { desc = "Exit to netrw" })
map("i", "kj", "<Esc>")
map("v", "kj", "<Esc>")
-- vim.keymap.set("n", ";rw", "<cmd>%bd|e#<cr>", { desc = "Close all buffers but the current one" }) -- https://stackoverflow.com/a/42071865/516188
-- open macos finder
map("n", "<leader>of", ":silent !open .<CR>", { desc = "Open MacOS Finder" })
