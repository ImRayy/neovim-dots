require("core.lazy")
require("core.options")
require("core.keybindings")
require("core.cmds")
require("core.gui")

-- Colorscheme
vim.cmd.colorscheme("tokyonight-night")

-- Remove or enable if not using lsp_lines.nvim at `lsp/init.lua`; line :32
vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = { only_current_line = false, highlight_whole_line = false },
})
