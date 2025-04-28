return {
  -- Work with diff hunks. Part of 'mini.nvim' library.
  {
    "echasnovski/mini.diff",
    cond = function()
      return vim.fs.find(".git", { upward = true }) ~= nil
    end,
    event = "BufReadPre",
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

  -- Git interface for Neovim, inspired by Magit
  {
    "NeogitOrg/neogit",
    cmd = "Neogit",
    lazy = true,
    dependencies = {
      "sindrets/diffview.nvim",
    },
    config = true,
  },
}
