-- return { -- You can easily change to a different colorscheme.
--   -- -- Change the name of the colorscheme plugin below, and then
--   -- -- change the command in the config to whatever the name of that colorscheme is.
--   -- --
--   -- -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
--   "folke/tokyonight.nvim",
--   config = function()
--     require("tokyonight").setup({
--       -- your configuration comes here
--       -- or leave it empty to use the default settings
--       style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
--       transparent = true, -- Enable this to disable setting the background color
--       terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
--       styles = {
--         -- Style to be applied to different syntax groups
--         -- Value is any valid attr-list value for `:help nvim_set_hl`
--         comments = { italic = false },
--         keywords = { italic = false },
--         -- Background styles. Can be "dark", "transparent" or "normal"
--         sidebars = "dark", -- style for sidebars, see below
--         floats = "dark", -- style for floating windows
--       },
--       hide_inactive_statusline = true,
--       on_colors = function(colors)
--         colors.error = "#ff0000"
--       end,
--       on_highlights = function(hl, c)
--         local prompt = "#2d3149"
--         hl.TelescopeNormal = {
--           bg = c.black,
--           fg = c.fg_dark,
--         }
--         hl.TelescopeBorder = {
--           bg = c.bg_dark,
--           fg = c.bg_dark,
--         }
--         hl.TelescopePromptNormal = {
--           bg = prompt,
--         }
--         hl.TelescopePromptBorder = {
--           bg = prompt,
--           fg = prompt,
--         }
--         hl.TelescopePromptTitle = {
--           bg = prompt,
--           fg = prompt,
--         }
--         hl.TelescopePreviewTitle = {
--           bg = c.bg_dark,
--           fg = c.bg_dark,
--         }
--         hl.TelescopeResultsTitle = {
--           bg = c.bg_dark,
--           fg = c.bg_dark,
--         }
--       end,
--     })
--   end,
--
--   -- 'rose-pine/neovim',
--   -- 'bluz71/vim-moonfly-colors',
--   priority = 1000, -- Make sure to load this before all the other start plugins.
--   init = function()
--     -- Load the colorscheme here.
--     -- Like many other themes, this one has different styles, and you could load
--     -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
--     vim.cmd.colorscheme("tokyonight-night")
--     vim.cmd("hi LineNr guifg=#838c9c")
--     -- vim.cmd.colorscheme 'moonfly'
--     -- vim.cmd.colorscheme 'rose-pine'
--   end,
-- }
--
return {
  "folke/tokyonight.nvim",
  opts = {
    transparent = true,
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
  },
}
