return {
  "NeogitOrg/neogit",
  lazy = true,
  dependencies = {
    -- Only one of these is needed.
    -- "sindrets/diffview.nvim", -- optional
    "esmuellert/codediff.nvim", -- optional

    -- For a custom log pager
    "m00qek/baleia.nvim", -- optional

    -- Only one of these is needed.
    "ibhagwan/fzf-lua", -- optional
  },
  cmd = "Neogit",
  keys = {
    { "<leader>rg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" },
  },
}
