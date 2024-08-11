return {
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
  },
}
