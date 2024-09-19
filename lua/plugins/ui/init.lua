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
      background_colour = "#000000",
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
    -- enabled = vim.g.neovide == nil, -- if current editor is neovide then disable
    enabled = false,
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
      presets = {
        inc_rename = true,
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
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
        lualine_x = {
          {
            require("noice").api.statusline.mode.get,
            cond = require("noice").api.statusline.mode.has,
          },
          "filetype",
        },
        lualine_y = { "location" },
        lualine_z = { "progress" },
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
}
