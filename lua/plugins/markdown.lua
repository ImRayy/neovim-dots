return {

  -- MarkdownPreview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown", "mdx" }
    end,
    ft = { "markdown", "mdx" },
    keys = {
      { "<a-m>", "<cmd>MarkdownPreview<cr>", mode = "n" },
    },
  },

  -- Improve viewing Markdown files in Neovim
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "norg", "rmd", "org" },
    opts = {
      heading = {
        position = "inline",
        width = "block",
        min_width = 30,
        border = false,
        above = "",
        below = "-",
        icons = { "󰼏 ", "󰼐 ", "󰼑 ", "󰼒 ", "󰼓 ", "󰼔 " },
        sign = false,
        backgrounds = { "" },
      },
      code = {
        sign = false,
        width = "block",
        min_width = 45,
        left_pad = 2,
        right_pad = 4,
      },
      checkbox = {
        unchecked = { icon = "✘" },
        checked = { icon = "󰸞" },
      },
    },
  },

  -- Obsidian 🤝 Neovim for writing and navigating obsidian vaults
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    event = {
      "BufReadPre " .. vim.fn.expand("~") .. "/Documents/Notes/*.md",
      "BufNewFile " .. vim.fn.expand("~") .. "/Documents/Notes/*.md",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "Universal",
          path = "~/Documents/Notes",
        },
      },
      templates = {
        folder = "Template",
        date_format = "%Y-%m-%d-%a",
        time_format = "%H:%M",
      },
      ui = { enable = false },
    },
  },
}
