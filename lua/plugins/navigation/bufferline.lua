return {
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    version = "*",
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
}
