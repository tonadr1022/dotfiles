return { -- You can easily change to a different colorscheme.
  -- -- Change the name of the colorscheme plugin below, and then
  -- -- change the command in the config to whatever the name of that colorscheme is.
  -- --
  -- -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  "folke/tokyonight.nvim",
  config = function()
    require("tokyonight").setup({
      -- your configuration comes here
      -- or leave it empty to use the default settings
      style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
      transparent = true, -- Enable this to disable setting the background color
      terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        -- comments = { italic = false },
        -- keywords = { italic = false },
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "transparent", -- style for sidebars, see below
        floats = "transparent", -- style for floating windows
      },
      hide_inactive_statusline = true,
      on_colors = function(colors)
        colors.error = "#ff0000"
      end,
      on_highlights = function(hl, c)
        local prompt = "#2d3149"
        hl.TelescopeNormal = {
          bg = c.black,
          fg = c.fg_dark,
        }
        hl.TelescopeBorder = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopePromptNormal = {
          bg = prompt,
        }
        hl.TelescopePromptBorder = {
          bg = prompt,
          fg = prompt,
        }
        hl.TelescopePromptTitle = {
          bg = prompt,
          fg = prompt,
        }
        hl.TelescopePreviewTitle = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopeResultsTitle = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.LineNr = {
          fg = "#838c9c",
        }
        hl.CursorLineNr = {
          fg = "#ffffff",
        }
      end,
    })
  end,
}
