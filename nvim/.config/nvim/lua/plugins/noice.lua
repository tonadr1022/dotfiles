-- lazy.nvim
return {
  "folke/noice.nvim",
  opts = {
    cmdline = {
      enabled = "true",
      view = "cmdline",
    },
    messages = {
      enabled = false,
    },
    lsp = {
      enabled = false,
      message = {
        enabled = false,
      },
    },
  },
}
