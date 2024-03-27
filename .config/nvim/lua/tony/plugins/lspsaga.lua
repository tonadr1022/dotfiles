return {
  'nvimdev/lspsaga.nvim',
  lazy = 'VeryLazy',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('lspsaga').setup({

    })
  end,
}
