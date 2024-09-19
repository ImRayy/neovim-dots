return {
  -- Autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },

  -- Rainbow parentheses
  {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      require("rainbow-delimiters.setup").setup()
    end,
  },

  -- Tiny plugin to enhance Neovim's native comments
  {
    "folke/ts-comments.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- Autohighlight word under cursor
  {
    "echasnovski/mini.cursorword",
    branch = "stable",
    opts = {},
  },

  -- CSS color highlight
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        css = true,
        virtualtext = "■",
        names = false,
      },
      filetypes = {
        "*",
        "!prompt",
        "!popup",
        html = { mode = "foreground" },
        cmp_docs = { always_update = true },
        css = { names = true },
      },
    },
  },

  -- Highlight, list and search todo comments in your projects
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
}
