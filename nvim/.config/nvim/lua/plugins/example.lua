return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
  { "lukas-reineke/indent-blankline.nvim", enabled = false },
  { "nvim-lualine/lualine.nvim", enabled = false },
  { "akinsho/bufferline.nvim", enabled = false },
  { "echasnovski/mini.indentscope", enabled = false },
  { "folke/flash.nvim", enabled = false },
  {
    "telescope.nvim",
    opts = {
      defaults = {
        file_ignore_patterns = { "dep" },
      },
    },
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    keys = {
      {
        "<leader>/",
        function()
          require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
            previewer = false,
          }))
        end,
        desc = "Fuzzily search current buffer",
      },
      {
        "<leader>rn",
        vim.lsp.buf.rename,
        desc = "[R]e[n]ame file",
      },
    },
  },

  -- fix clangd offset encoding
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = { glsl_analyzer = {} },
      setup = {},
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    },
  },
  { "nvim-treesitter/nvim-treesitter-context", enabled = false },
  { "nvim-treesitter/nvim-treesitter-textobjects", enabled = false },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
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
