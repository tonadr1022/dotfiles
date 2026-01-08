-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- ----------------------------- JAI --------------------------
vim.filetype.add({ extension = { jai = "jai" } })
-- Error format for compiler message recognition
local jai = [[%f:%l\,%v: %t%\a\*:%m]]
vim.o.errorformat = jai .. "," .. vim.o.errorformat
-- Install to path: https://github.com/SogoCZE/Jails.git
vim.lsp.config.jails = {
  cmd = { "jails" },
  root_markers = { ".git", "build.jai" },
  filetypes = { "jai" },
}
vim.lsp.enable({ "jails" })

-- Treesitter jai
vim.api.nvim_create_autocmd("User", {
  pattern = "TSUpdate",
  callback = function()
    require("nvim-treesitter.parsers").jai = {
      tier = 0,
      install_info = {
        url = "https://github.com/constantitus/tree-sitter-jai",
        files = { "src/parser.c", "src/scanner.c" },
        revision = "9d6fa4a91fbb2a7d7ff69e688c4d2ff5bed45695", -- commit hash for revision to check out; HEAD if missing
        branch = "main",
        queries = "queries", -- also install queries from given directory
      },
      filetype = "jai",
      filetype_to_parsername = "jai",
    }
  end,
})
-- ----------------------------- END JAI --------------------------

vim.cmd([[
  augroup GoSettings
    autocmd!
    autocmd FileType go setlocal tabstop=4 shiftwidth=4 expandtab smarttab
  augroup END
]])
