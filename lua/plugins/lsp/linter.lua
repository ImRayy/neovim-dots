return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		events = { "BufWritePost", "BufReadPost", "InsertLeave" },
		linters_by_ft = {
			astro = { "eslint_d" },
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			css = { "stylelint" },
			scss = { "stylelint" },
			fish = { "fish" },
			bash = { "shellcheck" },
			markdown = { "markdownlint" },
		},
		linters = {
			eslint_d = {
				args = {
					"--no-warn-ignored",
					"--format",
					"json",
					"--stdin",
					"--stdin-filename",
					function()
						return vim.api.nvim_buf_get_name(0)
					end,
				},
			},
		},
	},

	config = function(_, opts)
		local lint = require("lint")

		lint.linters_by_ft = opts.linters_by_ft
		lint.linters = opts.linters

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd(opts.events, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
