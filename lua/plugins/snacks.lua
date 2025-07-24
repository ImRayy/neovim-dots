return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    cmd = "Snacks",
    lazy = false,
    opts = {
      picker = {},
      debug = {},
      dim = {},
      explorer = {},
      notifier = {},
      indent = {},
      rename = {},
    },
    keys = {
      { "<leader>e", "<cmd>lua Snacks.explorer()<cr>", mode = "n" },
    },
  },
}
