return {
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
