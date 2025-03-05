return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      terminal = {
        win = {
          position = "float",
        },
      },
      dashboard = {
        preset = {
          header = [[
███╗   ███╗██╗██╗   ██╗ ██████╗ ███████╗███╗   ██╗
████╗ ████║██║██║   ██║██╔═══██╗██╔════╝████╗  ██║
██╔████╔██║██║██║   ██║██║   ██║█████╗  ██╔██╗ ██║
██║╚██╔╝██║██║╚██╗ ██╔╝██║   ██║██╔══╝  ██║╚██╗██║
██║ ╚═╝ ██║██║ ╚████╔╝ ╚██████╔╝███████╗██║ ╚████║
╚═╝     ╚═╝╚═╝  ╚═══╝   ╚═════╝ ╚══════╝╚═╝  ╚═══╝
]],
        },
      },
      scroll = { enabled = false },
      indent = { enabled = false },
      dim = { enabled = false },
    },
  },
}
