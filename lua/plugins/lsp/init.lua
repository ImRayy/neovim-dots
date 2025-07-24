return {
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local mason_lspconfig = require("mason-lspconfig")

      mason_lspconfig.setup_handlers({
        -- default handler for installed servers
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,
      })

      -- Disables warning "undefined global 'vim'"
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      -- lspconfig.cssls.setup({
      --   settings = { css = { validate = false } },
      -- })

      lspconfig.eslint.setup({
        code_actions = {
          enable = true,
          types = { "directive", "problem", "suggestion", "layout" },
        },
        diagnostics = {
          enable = true,
          report_unused_disable_directives = false,
          run_on = "type", -- or `save`
        },
        settings = {
          workingDirectories = { mode = "auto" },
          packageManager = "bun",
        },
      })

      -- LSP wrapper for typescript extension of vscode
      lspconfig.vtsls.setup({
        enableMoveToFileCodeAction = true,
        autoUseWorkspaceTsdk = true,
        experimental = {
          completion = {
            enableServerSideFuzzyMatch = true,
          },
        },
      })

      lspconfig.qmlls.setup({
        cmd = { "qmlls", "-E" },
      })

      lspconfig.astro.setup({})
      lspconfig.nixd.setup({
        cmd = { "nixd" },
        settings = {
          nixd = {
            nixpkgs = {
              expr = "import <nixpkgs> {}",
            },
            options = {
              nixos = {
                expr = '(builtins.getFlake ("git+file://" + toString ./.)).nixosConfigurations.default.options',
              },
              home_manager = {
                expr = '(builtins.getFlake ("git+file://" + toString ./.)).homeConfigurations.ray.options',
              },
            },
          },
        },
      })
    end,
  },

  -- Better built-in LSP experience
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    keys = {
      { "<a-.>", mode = { "n" }, ":Lspsaga ", desc = "Too lazy to type :Lspsaga manually" },
      { "<a-n>", mode = { "n" }, "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Jumpt to next diagnostic" },
      { "<a-p>", mode = { "n" }, "<cmd>Lspsaga diagnostic_jump_prev<cr>", desc = "Jumpt to prev diagnostic" },
      { "<leader>ca", mode = { "n" }, "<cmd>Lspsaga code_action<cr>", desc = "Code action" },
    },
    config = function()
      require("lspsaga").setup({
        symbol_in_winbar = {
          enable = false,
        },
        ui = {
          expand = "",
          collapse = "",
          actionfix = "",
          imp_sign = "",
          diagnostic = "🐞",
        },
        lightbulb = {
          enable = true,
          sign = false,
        },
      })
    end,

    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
}
