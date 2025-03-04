return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
  {

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
  },
}
