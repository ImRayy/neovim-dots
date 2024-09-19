return {
  -- Work with diff hunks. Part of 'mini.nvim' library.
  {
    "echasnovski/mini.diff",
    version = false,
    opts = {
      view = {
        style = "sign",
        signs = {
          add = "┃",
          change = "┃",
          delete = "",
        },
      },
    },
  },

  {

    {
      "NeogitOrg/neogit",
      dependencies = {
        "nvim-lua/plenary.nvim", -- required
        "sindrets/diffview.nvim", -- optional - Diff integration
        "nvim-telescope/telescope.nvim", -- optional
      },
      config = true,
    },
  },
}
