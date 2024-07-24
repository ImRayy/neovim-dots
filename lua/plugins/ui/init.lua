return {
  -- Notify
  {
    "rcarriga/nvim-notify",
    opts = {
      fps = 60,
      timeout = 1000,
      level = 2,
      minimum_width = 50,
      render = "default",
      stages = "fade_in_slide_out",
    },
  },

  -- WhichKey : Shows keybindings
  {
    "folke/which-key.nvim",
    opts = {},
  },

  -- Animations
  {
    "echasnovski/mini.animate",
    recommended = true,
    event = "VeryLazy",
    enabled = vim.g.neovide == nil, -- if current editor is neovide then disable
    opts = function()
      -- don't use animate when scrolling with the mouse
      local mouse_scrolled = false
      for _, scroll in ipairs({ "Up", "Down" }) do
        local key = "<ScrollWheel" .. scroll .. ">"
        vim.keymap.set({ "", "i" }, key, function()
          mouse_scrolled = true
          return key
        end, { expr = true })
      end

      local animate = require("mini.animate")
      return {
        resize = {
          timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
        },
        scroll = {
          timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
          subscroll = animate.gen_subscroll.equal({
            predicate = function(total_scroll)
              if mouse_scrolled then
                mouse_scrolled = false
                return false
              end
              return total_scroll > 1
            end,
          }),
        },
      }
    end,
  },

  -- Noice: Command UI
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    opts = {
      views = {
        cmdline_popup = {
          position = {
            row = 5,
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
          },
        },
        popupmenu = {
          relative = "editor",
          position = {
            row = 8,
            col = "50%",
          },
          size = {
            width = 60,
            height = 10,
          },
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
          win_options = {
            winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
          },
        },
      },
    },
  },

  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        theme = "auto",
        component_separators = "",
        section_separators = "",
        icons_enabled = true,
        globalstatus = true,
      },
      sections = {
        lualine_a = {
          { "mode", color = { gui = "bold" } },
        },
        lualine_b = {
          { "branch" },
          { "diff", colored = false },
        },
        lualine_c = {
          { "filename", file_status = true },
          { "diagnostics" },
        },
        lualine_y = { "progress" },
        lualine_z = {
          { "location", color = { gui = "bold" } },
        },
      },
      tabline = {},
      extensions = { "quickfix", "nvim-tree" },
    },
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", mode = "n" },
      { "<leader>bf", "<cmd>Telescope live_grep<cr>", mode = "n" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", mode = "n" },
    },
  },

  -- Trouble
  {
    "folke/trouble.nvim",
    branch = "dev",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
}
