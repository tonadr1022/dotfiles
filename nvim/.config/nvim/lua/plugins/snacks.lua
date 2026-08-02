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
      lazygit = {
        win = {
          width = 0,
          height = 0,
        },
      },
      dashboard = {
        preset = {
          header = [[
██╗    ██╗██╗  ██╗██╗██████╗     ███╗   ██╗ █████╗ ███████╗    ███╗   ██╗ █████╗ ███████╗
██║    ██║██║  ██║██║██╔══██╗    ████╗  ██║██╔══██╗██╔════╝    ████╗  ██║██╔══██╗██╔════╝
██║ █╗ ██║███████║██║██████╔╝    ██╔██╗ ██║███████║█████╗      ██╔██╗ ██║███████║█████╗  
██║███╗██║██╔══██║██║██╔═══╝     ██║╚██╗██║██╔══██║██╔══╝      ██║╚██╗██║██╔══██║██╔══╝  
╚███╔███╔╝██║  ██║██║██║         ██║ ╚████║██║  ██║███████╗    ██║ ╚████║██║  ██║███████╗
 ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝╚═╝         ╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝    ╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝
                                                                                         
]],
          -- stylua: ignore
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua require('fff').find_files()" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua require('fff').live_grep()" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
      },
      scroll = { enabled = false },
      indent = { enabled = false },
      dim = { enabled = false },
    },
  },
}
