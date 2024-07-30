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
    opts = {},
  },

  -- Highlight patterns in text. Part of 'mini.nvim' library.
  {
    "echasnovski/mini.hipatterns",
    version = "*",
    opts = {
      highlighters = {
        -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
        fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
        hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
        todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
        note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
      },
    },
  },
}
