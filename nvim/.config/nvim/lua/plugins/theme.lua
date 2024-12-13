return { -- You can easily change to a different colorscheme.
  -- -- Change the name of the colorscheme plugin below, and then
  -- -- change the command in the config to whatever the name of that colorscheme is.
  -- --
  -- -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  "folke/tokyonight.nvim",
  config = function()
    require("tokyonight").setup({
      style = "night",
      transparent = true,
      terminal_colors = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      hide_inactive_statusline = true,
      on_colors = function(colors)
        colors.error = "#ff0000"
      end,
    })
  end,
}
