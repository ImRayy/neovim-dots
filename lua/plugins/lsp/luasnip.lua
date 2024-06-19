return {

  "L3MON4D3/LuaSnip",
  event = "InsertEnter",
  keys = {
    {
      "<tab>",
      function()
        return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
      end,
      expr = true,
      silent = true,
      mode = "i",
    },
    {
      "<tab>",
      function()
        require("luasnip").jump(1)
      end,
      mode = "s",
    },
    {
      "<s-tab>",
      function()
        require("luasnip").jump(-1)
      end,
      mode = { "i", "s" },
    },
  },
  opts = function()
    -- For friendly snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    -- For custom snippets
    require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snips" } })

    -- Allow jsx and tsx to use js snippets
    require("luasnip").filetype_extend("javascript", { "javascriptreact", "typescriptreact" })
  end,
  dependencies = {
    {
      "rafamadriz/friendly-snippets",
      event = "CursorHold",
    },
  },
}
