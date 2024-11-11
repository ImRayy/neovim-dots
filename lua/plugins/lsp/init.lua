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

      lspconfig.eslint.setup({
        settings = {
          workingDirectories = { mode = "auto" },
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

    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },

  -- nvim cmp
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    version = false,
    config = function()
      local cmp = require("cmp")
      local icons = {
        Text = "󰉿",
        Method = "󰆧",
        Function = "󰊕",
        Constructor = "",
        Field = "󰜢",
        Variable = "",
        Class = "󰠱",
        Interface = "",
        Module = "",
        Property = "󰜢",
        Unit = "󰑭",
        Value = "󰎠",
        Enum = "",
        Keyword = "󰌋",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "󰿅",
        Folder = "󰉋",
        EnumMember = "",
        Constant = "",
        Struct = "󰙅",
        Event = "",
        Operator = "󰆕",
        TypeParameter = "",
      }

      local aliases = {
        nvim_lsp = "lsp",
        luasnip = "snippet",
      }

      cmp.setup({
        history = true,
        delete_check_events = "TextChanged",
        mapping = cmp.mapping.preset.insert({
          ["<C-e>"] = cmp.config.disable,
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<tab>"] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
        }),
        window = {
          documentation = cmp.config.window.bordered(),
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp", max_item_count = 10, priority = 1000 },
          { name = "luasnip", max_item_count = 10, priority = 750 },
          { name = "vim-dadbod-completion", max_item_count = 10, priority = 700 },
          { name = "buffer", max_item_count = 10, priority = 500 },
          { name = "path", max_item_count = 10, priority = 250 },
        }),
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        formatting = {
          format = function(entry, item)
            -- Kind icons
            item.kind = string.format("%s %s", icons[item.kind], item.kind)
            -- Source
            item.menu = string.format("[%s]", aliases[entry.source.name] or entry.source.name)
            return item
          end,
        },
      })
    end,
  },

  { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
  { "hrsh7th/cmp-path", after = "nvim-cmp" },
  { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
  {
    "kristijanhusak/vim-dadbod-completion",
    ft = { "sql", "mysql", "plsql" },
    after = "nvim-cmp",
  },
}
