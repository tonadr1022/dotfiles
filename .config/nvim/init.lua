if vim.g.vscode then
require 'tony.core.options'
require 'tony.core.keymaps'
require 'tony.core.autocmds'
else
require 'tony.core.options'
require 'tony.core.keymaps'
require 'tony.core.autocmds'
require 'tony.lazy'
end
