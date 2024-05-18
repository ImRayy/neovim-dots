return {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            debug = false,
            sources = {
                require("none-ls.diagnostics.eslint"),
                require("none-ls.diagnostics.flake8"),
            },
        })
    end,
}
