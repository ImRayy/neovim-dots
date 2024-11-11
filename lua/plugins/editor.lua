return {

  {
    "echasnovski/mini.files",
    version = "*",
    keys = {
      {
        "<c-n>",
        function()
          local MiniFiles = require("mini.files")
          if not MiniFiles.close() then
            MiniFiles.open(vim.api.nvim_buf_get_name(0), true)
          end
        end,
        mode = "n",
      },
    },
    opts = {
      options = {
        permanent_delete = true,
      },

      windows = {
        preview = false,
        width_focus = 30,
        width_preview = 30,
      },
    },
  },

  -- Buffer line
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = "nvim-tree/nvim-web-devicons",
    keys = {
      { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
      { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
      { "<S-c>", "<cmd>BufferLinePickClose<cr>", desc = "Pick & close Buffer" },
    },

    opts = {
      options = {
        diagnostics = "nvim_lsp",
        modified_icon = "●",
        show_close_icon = false,
        show_buffer_close_icons = false,
        always_show_bufferline = false,
      },
    },
  },

  -- Session manager
  {
    "rmagatti/auto-session",
    opts = {
      auto_session_root_dir = os.getenv("HOME") .. "/" .. ".neovim_sessions/",
      auto_session_enable_last_session = false,
      auto_session_create_enabled = false,
      auto_session_suppress_dirs = { "~/", "~/Downloads/", "/" },
      session_lens = {
        buftypes_to_ignore = {},
        load_on_setup = true,
        theme_conf = { border = true },
        prompt_title = "Projects",
      },
    },
  },

  -- Automatically add closing tags for HTML and JSX
  {
    "windwp/nvim-ts-autotag",
    opts = {},
  },

  -- Visualize and work with indent scope
  {
    "echasnovski/mini.indentscope",
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

  -- Indent blankline
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    commit = "29be0919b91fb59eca9e90690d76014233392bef",
    opts = {
      scope = {
        enabled = false,
      },
      exclude = {
        buftypes = { "terminal" },
      },
      indent = {
        char = "│",
        tab_char = { "." },
      },
    },
  },

  -- Navigate your code with search labels, enhanced character motions
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
        -- stylua: ignore
        keys = {
          { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
          { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
          { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
          { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
          { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
  },

  -- Move any selection in any direction
  {
    "echasnovski/mini.move",
    event = "VeryLazy",
    opts = {},
  },

  -- Find Nerd Glyphs Easily 🤓🔭
  {
    "2kabhishek/nerdy.nvim",
    cmd = "Nerdy",
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },

  -- Incremental LSP renaming based on Neoviml's command-preview feature
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = function()
      require("inc_rename").setup()
    end,
  },

  -- SQL stuff
  {
    "kristijanhusak/vim-dadbod-ui",
    cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
    dependencies = { "tpope/vim-dadbod" },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
    end,
    keys = {
      { "<leader>d", "<cmd>tabnew<cr><cmd>DBUI<cr>", mode = "n" },
      { "<a-d>", "<cmd>DBUIToggle<cr><cmd>Neotree close<cr>", mode = "n" },
    },
  },

  -- Dims inactive portions of the code you're editing using TreeSitter.
  {
    "folke/zen-mode.nvim",
    -- cmd = "ZenMode",
    dependencies = { "folke/twilight.nvim" },
    opts = {
      plugins = {
        kitty = {
          enabled = true,
          font = "+2",
        },
        neovide = {
          enabled = true,
          scale = 1.2,
          disable_animations = {
            neovide_animation_length = 0.15,
            neovide_cursor_animate_command_line = true,
            neovide_scroll_animation_length = 0.3,
            neovide_position_animation_length = 0.15,
            neovide_cursor_animation_length = 0.12,
            neovide_cursor_vfx_mode = "ripple",
          },
        },
      },
    },
  },

  -- Handful of tweaks needed to smooth the path to writing prose
  {
    "preservim/vim-pencil",
    cmd = "Pencil",
    config = function() end,
  },
}
