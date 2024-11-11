return {

  -- Neotree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<c-n>", "<cmd>Neotree toggle reveal_force_cwd<cr>", mode = "n" },
    },
    opts = {
      close_if_last_window = true,
      popup_border_style = "rounded",
      enable_diagnostics = false,
      default_component_configs = {
        indent = {
          padding = 0,
          with_expanders = false,
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
          default = "",
        },
        git_status = {
          symbols = {
            added = "",
            deleted = "",
            modified = "",
            renamed = "➜",
            untracked = "★",
            ignored = "◌",
            unstaged = "✗",
            staged = "✓",
            conflict = "",
          },
        },
      },
      window = {
        width = 25,
        mappings = {
          ["o"] = "open",
        },
      },
      filesystem = {
        filtered_items = {
          visible = false,
          hide_dotfiles = true,
          hide_gitignored = false,
          hide_by_name = {
            ".DS_Store",
            "thumbs.db",
            "node_modules",
            "__pycache__",
          },
        },
        -- follow_current_file = true,
        hijack_netrw_behavior = "open_current",
        use_libuv_file_watcher = true,
      },
      git_status = {
        window = {
          position = "float",
        },
      },
      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function(_)
            vim.opt_local.signcolumn = "auto"
          end,
        },
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
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo Tree",
            highlight = "Directory",
            text_align = "left",
          },
        },
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
