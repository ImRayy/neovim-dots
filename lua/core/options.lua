local function set_vim_options(options, use_opt)
  local vim_cmd = use_opt and vim.opt or vim.g
  for x, y in pairs(options) do
    vim_cmd[x] = y
  end
end

-- stylua: ignore
local options = {
    termguicolors = true,      -- set term gui colors (most terminals support this)
    timeoutlen = 500,          -- time to wait for a mapped sequence to complete (in milliseconds)
    updatetime = 200,          -- faster completion (4000ms default)
    scrolloff = 8,
    number = true,             -- set numbered lines
    numberwidth = 6,           -- set number column width
    cursorline = true,         -- highlight the current line
    expandtab = true,          -- convert tabs to spaces
    cindent = true,
    textwidth = 300,
    tabstop = 4,               -- insert 2 spaces for a tab
    shiftwidth = 0,            -- the number of spaces inserted for each indentation
    softtabstop = -1,          -- If negative, shiftwidth value is used
    list = true,
    clipboard = "unnamedplus", -- Makes neovim and host OS clipboard play nicely with each other
    ignorecase = true,         -- Case insensitive searching UNLESS /C or capital in search
    smartcase = true,          -- smart case
    backup = false,            -- Undo and backup options
    writebackup = false,       -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    undofile = true,           -- enable persistent undo
    swapfile = false,          -- creates a swapfile
    history = 50,              -- Remember 50 items in commandline history
    splitright = true,         -- Better buffer splitting
    splitbelow = true,
    guifont = "CommitMono Nerd Font:h12.5",
    -- mouse = "a",
    listchars = "trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂",

    -- line wrapping
    wrap = true,
    breakindent = true,
    showbreak = string.rep(" ", 3), -- Make it so that long lines wrap smartly
    linebreak = true
}
set_vim_options(options, true)

-- colorscheme
vim.cmd("colorscheme gruvbox")
