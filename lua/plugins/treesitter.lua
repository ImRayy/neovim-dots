return {
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    module = "nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "VeryLazy" },
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    opts = {
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      indent = {
        enable = true,
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  -- Treesitter context
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = { mode = "cursor", max_lines = 2 },
  },
}
