-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.cmd([[
  augroup GoSettings
    autocmd!
    autocmd FileType go setlocal tabstop=4 shiftwidth=4 expandtab smarttab
  augroup END
]])
