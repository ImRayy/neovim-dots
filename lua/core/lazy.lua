local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  print("Installing lazy.nvim")
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    { import = "plugins" },
    { import = "plugins.ai" },
    { import = "plugins.lsp" },
    { import = "plugins.navigation" },
    { import = "plugins.ui" },
  },
  install = { colorscheme = { "gruvbox" } },
  checker = { enabled = false },
})
