return {
  -- { "nvim-lualine/lualine.nvim", enabled = false },
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "]b", false },
      { "<S-C-Tab>", "<Cmd>BufferLineCyclePrev<cr>", desc = "Previous Buffer" },
      { "<C-Tab>", "<Cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    },
  },
  { "folke/flash.nvim", enabled = false },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        glsl_analyzer = {},
        clangd = {
          filetypes = { "h", "hpp", "c", "cpp", "objc", "objcpp", "cuda", "proto" },
        },
      },
      setup = {},
    },
  },
  { "nvim-treesitter/nvim-treesitter-context", enabled = false },
  { "nvim-treesitter/nvim-treesitter-textobjects", enabled = false },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "objc",
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "glsl",
        "hlsl",
      },
    },
  },
}
