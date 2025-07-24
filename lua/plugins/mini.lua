return {
  -- Autopairs
  {
    event = "InsertEnter",
    "echasnovski/mini.pairs",
    version = "*",
    opts = {},
  },

  -- Autohighlight word under cursor
  {
    "echasnovski/mini.cursorword",
    branch = "stable",
    opts = {},
  },

  -- Fast and feature-rich surround actions
  {
    "echasnovski/mini.surround",
    events = { "BufWritePost", "BufReadPost", "InsertLeave" },
    version = "*",
    opts = {
      mappings = {
        add = "gsa", -- Add surrounding in Normal and Visual modes
        delete = "gsd", -- Delete surrounding
        find = "gsf", -- Find surrounding (to the right)
        find_left = "gsF", -- Find surrounding (to the left)
        highlight = "gsh", -- Highlight surrounding
        replace = "gsr", -- Replace surrounding
        update_n_lines = "gsn", -- Update `n_lines`
      },
    },
  },

  -- Visualize and work with indent scope
  {
    "echasnovski/mini.indentscope",
    event = "LspAttach",
    version = false,
    opts = {
      symbol = "│",
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "alpha",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },

  -- Move any selection in any direction
  {
    "echasnovski/mini.move",
    event = "VeryLazy",
    opts = {},
  },

  -- To split and join arguments
  {
    "echasnovski/mini.splitjoin",
    event = "LspAttach",
    version = "*",
    opts = { mappings = { toggle = "gs" } },
  },
}
