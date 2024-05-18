return {

	-- Neotree
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
		keys = {
			{ "<c-n>", "<cmd>Neotree toggle reveal_force_cwd<cr>", mode = "n" },
		},
		opts = {
			close_if_last_window = true,
			popup_border_style = "rounded",
			enable_diagnostics = false,
			default_component_configs = {
				indent = {
					padding = 0,
					with_expanders = false,
				},
				icon = {
					folder_closed = "",
					folder_open = "",
					folder_empty = "",
					default = "",
				},
				git_status = {
					symbols = {
						added = "",
						deleted = "",
						modified = "",
						renamed = "➜",
						untracked = "★",
						ignored = "◌",
						unstaged = "✗",
						staged = "✓",
						conflict = "",
					},
				},
			},
			window = {
				width = 25,
				mappings = {
					["o"] = "open",
				},
			},
			filesystem = {
				filtered_items = {
					visible = false,
					hide_dotfiles = true,
					hide_gitignored = false,
					hide_by_name = {
						".DS_Store",
						"thumbs.db",
						"node_modules",
						"__pycache__",
					},
				},
				-- follow_current_file = true,
				hijack_netrw_behavior = "open_current",
				use_libuv_file_watcher = true,
			},
			git_status = {
				window = {
					position = "float",
				},
			},
			event_handlers = {
				{
					event = "neo_tree_buffer_enter",
					handler = function(_)
						vim.opt_local.signcolumn = "auto"
					end,
				},
			},
		},
	},

	-- Buffer line
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		after = "catppuccin",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		keys = {
			{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
			{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
			{ "<S-c>", "<cmd>BufferLinePickClose<cr>", desc = "Pick & close Buffer" },
		},

		opts = {
			highlights = require("catppuccin.groups.integrations.bufferline").get({
				styles = { "italic", "bold" },
				custom = {
					all = {
						fill = { bg = "" },
					},
				},
			}),
			options = {
				diagnostics = "nvim_lsp",
				modified_icon = "●",
				show_close_icon = false,
				show_buffer_close_icons = false,
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						highlight = "Directory",
						separator = "",
					},
				},
			},
		},
	},

	-- Session manager
	{
		"rmagatti/auto-session",
		opts = {
			auto_session_root_dir = os.getenv("HOME") .. "/" .. ".neovim_sessions/",
			auto_session_enable_last_session = false,
			auto_session_create_enabled = false,
			auto_session_suppress_dirs = { "~/", "~/Downloads/", "/" },
			session_lens = {
				buftypes_to_ignore = {},
				load_on_setup = true,
				theme_conf = { border = true },
				prompt_title = "Projects",
			},
		},
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		module = "nvim-treesitter",
		version = false,
		build = ":TSUpdate",
		event = { "VeryLazy" },
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		opts = {
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},

			indent = {
				enable = true,
			},

			autotag = {
				enable = true,
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},

	-- Automatically add closing tags for HTML and JSX
	{
		"windwp/nvim-ts-autotag",
		opts = {},
	},

	-- Indent blankline
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		commit = "29be0919b91fb59eca9e90690d76014233392bef",
		opts = {
			exclude = {
				buftypes = { "terminal" },
			},
			indent = {
				tab_char = { "." },
			},
		},
	},

	-- Move any selection in any direction
	{
		"echasnovski/mini.move",
		event = "VeryLazy",
		opts = {},
	},
}
