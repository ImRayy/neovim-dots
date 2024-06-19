return {
    -- lspconfig
    {
        "neovim/nvim-lspconfig",
        -- event = "LazyFile",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lsp_servers = require("utils.lsp").ensure_installed.servers
            for _, server in pairs(lsp_servers) do
                Opts = {
                    on_attach = nil,
                    capabilities = capabilities,
                }
                server = vim.split(server, "@")[1]
                lspconfig[server].setup(Opts)
            end

            -- Disables warning "undefined global 'vim'"
            lspconfig.lua_ls.setup {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        }
                    }
                }
            }

            lspconfig.eslint.setup {
                settings = {
                    workingDirectories = { mode = "auto" },
                },
            }

            -- LSP wrapper for typescript extension of vscode
            lspconfig.vtsls.setup {
                enableMoveToFileCodeAction = true,
                autoUseWorkspaceTsdk = true,
                experimental = {
                    completion = {
                        enableServerSideFuzzyMatch = true,
                    },
                },
            }

            lspconfig.astro.setup({})
        end

    },

    -- nvim cmp
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        version = false,
        config = function()
            local cmp = require('cmp')
            local icons = {
                Text = "󰉿",
                Method = "󰆧",
                Function = "󰊕",
                Constructor = "",
                Field = "󰜢",
                Variable = "",
                Class = "󰠱",
                Interface = "",
                Module = "",
                Property = "󰜢",
                Unit = "󰑭",
                Value = "󰎠",
                Enum = "",
                Keyword = "󰌋",
                Snippet = "",
                Color = "",
                File = "",
                Reference = "󰿅",
                Folder = "󰉋",
                EnumMember = "",
                Constant = "",
                Struct = "󰙅",
                Event = "",
                Operator = "󰆕",
                TypeParameter = "",
            }

            local aliases = {
                nvim_lsp = "lsp",
                luasnip = "snippet",
            }

            cmp.setup({
                history = true,
                delete_check_events = "TextChanged",
                mapping = cmp.mapping.preset.insert({
                    ["<C-e>"] = cmp.config.disable,
                    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<tab>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                }),
                window = {
                    documentation = cmp.config.window.bordered(),
                },
                sources = cmp.config.sources({
                    { name = "nvim_lsp", max_item_count = 10 },
                    { name = "luasnip",  max_item_count = 10 },
                    { name = "path",     max_item_count = 10 },
                    { name = "buffer",   max_item_count = 10 },
                }),
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                formatting = {
                    format = function(entry, item)
                        -- Kind icons
                        item.kind = string.format("%s %s", icons[item.kind], item.kind)
                        -- Source
                        item.menu = string.format("[%s]", aliases[entry.source.name] or entry.source.name)
                        return item
                    end,
                },
            })
        end,
    },

    { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
    { "hrsh7th/cmp-path",         after = "nvim-cmp" },
    { "hrsh7th/cmp-buffer",       after = "nvim-cmp" },

}
