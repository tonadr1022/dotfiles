return {
  'nvim-tree/nvim-tree.lua',
  enabled = true,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local nvimtree = require 'nvim-tree'
    -- vim.g.loaded_netrw = 1
    -- vim.g.loaded_netrwPlugin = 1
    vim.cmd [[ highlight NvimTreeIndentMarker guifg=#3FC5ff ]]

    nvimtree.setup {
      actions = {
        open_file = {
          quit_on_open = true,
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { '.DS_Store', '.git' },
      },
      renderer = {
        icons = {
          show = {
            git = false,
          },
        },
      },
    }
    local keymap = vim.keymap
    -- keymap.set('n', '<leader>ee', '<cmd>NvimTreeToggle<CR>')
    -- keymap.set('n', '<leader>ef', '<cmd>NvimTreeFindFileToggle<CR>')
    -- keymap.set('n', '<leader>ec', '<cmd>NvimTreeCollapse<CR>')
    -- keymap.set('n', '<leader>er', '<cmd>NvimTreeRefresh<CR>')
    -- keymap.set('n', '<leader>eo', '<cmd>NvimTreeOpen<CR>')
    keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>')
  end,
}
