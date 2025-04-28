return {
  {
    "echasnovski/mini.files",
    version = "*",
    keys = {
      {
        "<c-n>",
        function()
          local MiniFiles = require("mini.files")
          if not MiniFiles.close() then
            MiniFiles.open(vim.api.nvim_buf_get_name(0), true)
          end
        end,
        mode = "n",
      },
    },
    opts = {
      options = {
        permanent_delete = true,
      },

      windows = {
        preview = false,
        width_focus = 30,
        width_preview = 30,
      },
    },
  },
}
