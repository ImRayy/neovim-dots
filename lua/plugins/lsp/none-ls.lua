return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local null_ls = require("null-ls")
        local formatting = null_ls.builtins.formatting
        local diagnostics = null_ls.builtins.diagnostics
        local completion = null_ls.builtins.completion


        null_ls.setup({
            debug = false,
            sources = {
                formatting.prettier,
                formatting.stylua,
                formatting.black.with({ extra_args = { "--fast" } }),
                completion.spell,
                require("none-ls.diagnostics.eslint"),
                require("none-ls.diagnostics.flake8"),
            },
        })
    end,
}
