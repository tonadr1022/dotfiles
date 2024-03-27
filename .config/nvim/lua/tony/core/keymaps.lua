local map = vim.keymap.set
map('n', '<Esc>', '<cmd>nohlsearch<CR>')
map('n', '<C-c>', '<cmd>nohlsearch<CR>')
map('n', '<leader>;', ':')
map('i', 'kj', '<Esc>')
map('v', 'kj', '<Esc>')
--paging cursor center
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-d>', '<C-d>zz')
-- search selection cursor center
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
map('n', '<leader>rr', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
map('i', '∑', '<Esc>:w<CR>', { desc = 'Write buffer' })
map('n', '∑', ':w<CR>', { desc = 'Write buffer' })
-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
map('n', '<leader>pv', ':Ex<CR>', { desc = 'Exit to netrw' })

-- move visual selection
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

-- better line joining
map('n', 'J', 'mzJ`z')
-- delete without yank
map('n', '<leader>d', '"_d', { desc = 'Delete without yank' })
map('v', '<leader>d', '"_d', { desc = 'Delete without yank' })

-- map("n", '<leader>f', function()
--   vim.lsp.buf.format()
-- end)

-- Window management
map('n', '<leader>v', ':vsplit<CR>', { noremap = true, silent = true, desc = "Vertical Split" })
--vim.api.nvim_set_keymap('n', '<leader>h', ':split<CR>', { noremap = true, silent = true, desc = "Horizontal Split" })
map('n', '<leader>w', ':close<CR>', { noremap = true, silent = true, desc = "Close Window" })
map('n', '<leader>fw', ':wa | only<CR>', { noremap = true, silent = true })
map('n', ';c', ':!', { noremap = true, silent = true })
