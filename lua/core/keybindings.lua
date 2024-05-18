local function map(m, k, v, opts)
	vim.keymap.set(m, k, v, vim.tbl_deep_extend("force", { silent = true, noremap = true }, opts or {}))
end

-- General Settings
map("n", "*", "*N", { desc = "Fix * (Keep the cursor position, don't move to next match)" })
map("n", "<C-Q>", ":q!<CR>", { desc = "Quit neovim" })
map("i", "<C-Backspace>", "<C-W>", { noremap = true, desc = "Delete a word" })

-- Spell check
map("n", "<leader>s", ":setlocal spell spelllang=en_us<CR>", { desc = "Turn on spell check" })

-- Session Manager
map("n", "<C-s>", require("auto-session.session-lens").search_session, { desc = "Project hop" })

-- Formatter
map("n", "<Space>f", function()
	local status_ok, format = pcall(require, "conform")
	if not status_ok then
		return
	end
	format.format({ async = true, lsp_fallback = true })
end, { desc = "Format code" })

-- Switch panes
map("n", "<C-k>", ":wincmd k<CR>")
map("n", "<C-j>", ":wincmd j<CR>")
map("n", "<C-h>", ":wincmd h<CR>")
map("n", "<C-l>", ":wincmd l<CR>")
