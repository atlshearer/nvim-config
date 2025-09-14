return {
    -- Completion Framework
    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require("cmp")
            local lspkind = require("lspkind")

            cmp.setup({
                -- Enable LSP snippets
                snippet = {
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body)
                    end,
                },
                mapping = {
                    ['<C-p>'] = cmp.mapping.select_prev_item(),
                    ['<C-n>'] = cmp.mapping.select_next_item(),
                    -- Add tab support
                    -- ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                    -- ['<Tab>'] = cmp.mapping.select_next_item(),
                    ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.close(),
                    ["<CR>"] = cmp.mapping({
                        i = function(fallback)
                            if cmp.visible() and cmp.get_active_entry() then
                                cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                            else
                                fallback()
                            end
                        end,
                        s = cmp.mapping.confirm({ select = true }),
                        c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
                    }),
                },
                -- Installed sources:
                sources = {
                    { name = 'nvim_lsp' },                -- from language server
                    { name = 'nvim_lsp_signature_help' }, -- display function signatures with current parameter emphasized
                    { name = 'nvim_lua' },                -- complete neovim's Lua runtime API such vim.lsp.*
                    { name = 'vsnip' },                   -- nvim-cmp source for vim-vsnip
                    { name = 'path' },                    -- file paths
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                formatting = {
                    fields = { 'menu', 'abbr', 'kind' },
                    -- format = function(entry, item)
                    --     local menu_icon = {
                    --         nvim_lsp = 'λ',
                    --         buffer = 'Ω',
                    --         path = '🖫',
                    --     }
                    --     item.menu = menu_icon[entry.source.name]
                    --     return item
                    -- end,
                    format = lspkind.cmp_format({
                        mode = 'symbol_text',  -- show only symbol annotations
                        maxwidth = 50,         -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                        ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                        -- The function below will be called before any actual modifications from lspkind
                        -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
                        before = function(_, vim_item)
                            return vim_item
                        end
                    })
                },
            })
        end,
        dependencies = {
            "onsails/lspkind.nvim",
        }
    },
    -- LSP source
    'hrsh7th/cmp-nvim-lsp',
    -- Snippets source
    'hrsh7th/cmp-vsnip',
    -- Path source
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    -- Yes
    "hrsh7th/vim-vsnip",

    -- "github/copilot.vim",

    -- Automatically adding brackets
    {
        "windwp/nvim-autopairs",
        opts = {}
    },

    -- Commenting and uncommenting
    {
        "numToStr/Comment.nvim",
        opts = {}
    },
}
