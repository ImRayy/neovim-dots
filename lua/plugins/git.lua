return {
  -- For calling lazygit from within neovim.
  {

    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },

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
}
