> [!NOTE]  
> This is a rewrite of my [neovim](https://github.com/ImRayy/dotfiles/tree/master/.config/nvim) config. Functionality is unchanged, but the file structure and plugins have been reorganized. 

## 🖼️ Screenshots

| ![image-06](https://ik.imagekit.io/rayshold/dotfiles/_config/nvim/neovim-06.webp?updatedAt=1704005666751) |
| ----- |

| ![image-07](https://ik.imagekit.io/rayshold/dotfiles/_config/nvim/neovim-07.webp?updatedAt=1704004269358) | ![image-08](https://ik.imagekit.io/rayshold/dotfiles/_config/nvim/neovim-08.webp?updatedAt=1704005633616) | ![image-05](https://ik.imagekit.io/rayshold/dotfiles/_config/nvim/neovim-05.webp?updatedAt=1704005650274) |
| ----- | ----- | ----- |

## 🧩 Plugins

- 📦️ [lazy.nvim](https://github.com/folke/lazy.nvim) as package manager
- ⚡️ Startup screen [alpha-nvim](https://github.com/goolord/alpha-nvim)
- 🚨 For linting [none-ls.nvim](https://github.com/nvimtools/none-ls.nvim)
- 🔭 Fuzzy finder [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- 🦄 [nvim-notify](https://github.com/rcarriga/nvim-notify) for notifications & [noice.nvim](https://github.com/folke/noice.nvim) for other UI related stuff
- 🗃️ File system browser [neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)
- 📈 Buffer manager [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) & Status bar [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- 💡 Neovim LSP configuration with [mason.nvim](https://github.com/williamboman/mason.nvim), [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) & [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- 📄 Code formatting with [conform.nvim](https://github.com/stevearc/conform.nvim)
- 🦆 Snippets with [LuaSnip](https://github.com/L3MON4D3/LuaSnip) & [friendly snippets](https://github.com/rafamadriz/friendly-snippets)
- 📏 Indent blanklines with [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)

## ⌨️  Keybindings

**General**
| Function | Keys |
| -------------------- | ----------- |
| Move line/lines down | Ctrl + j    |
| Move line/lines up   | Ctrl + k    |
| Find files           | Leader + ff |
| Live grep            | Leader + bf |
| Help tags            | Leader + fh |
| Toggle neotree       | Ctrl + n    |
| Manually Format Code | Space + f   |
| Spell check          | Leader + s  |
| Projcet jump window  | Ctrl + s    |

**Buffer**
| Function                | Keys       |
| ----------------------- | ---------- |
| Buffer previous         | Shift + h  |
| Buffer next             | Shift + l  |
| Buffer close            | Shift + c  |

## 🧑‍💻 Few useful Cmds

| Function                | Cmd                 |
| ----------------------- | ------------------- |
| Enable auto formatting  | FormatOnSaveEnable  |
| Disable auto formatting | FormatOnSaveDisable |
| Save session            | SessionSave         |
| Delete session          | SessionDelete       |

## ✨ Credits

- [numToStr's dotfile](https://github.com/numToStr/dotfiles/tree/master/neovim/.config/nvim) - initial reference
- [NvChad](https://github.com/NvChad/NvChad) - file structure
- [CosmicNvim](https://github.com/CosmicNvim/CosmicNvim) - keybindings
- [sadiksaifi's dotfiles](https://github.com/sadiksaifi/nvim) - LSP reference
- [LazyVim](https://github.com/LazyVim/LazyVim) - lazy.nvim related reference
