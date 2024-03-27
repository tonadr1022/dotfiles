require 'tony.core.options'
require 'tony.core.keymaps'
require 'tony.lazy'

if vim.g.vscode then
  vim.cmd [[source $HOME/.config/nvim/vscode/settings.vim]]
  -- Optional plugin
  -- vim.cmd[[source $HOME/.config/nvim/vscode/easymotion-config.vim]]
else
end
