return {
  {
    "williamboman/mason-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      ensure_installed = require("utils.lsp").ensure_installed.servers,
      automatic_installation = true,
    },
    dependencies = {
      {
        "williamboman/mason.nvim",
        event = { "BufReadPre", "BufNewFile" },
        cmd = { "Mason" },
        opts = {
          ui = {
            icons = {
              package_pending = " ",
              package_installed = "󰄳 ",
              package_uninstalled = " 󰚌",
            },

            keymaps = {
              toggle_server_expand = "<CR>",
              install_server = "i",
              update_server = "u",
              check_server_version = "c",
              update_all_servers = "U",
              check_outdated_servers = "C",
              uninstall_server = "X",
              cancel_installation = "<C-c>",
            },
          },

          max_concurrent_installers = 10,
        },
      },
    },
  },
}
