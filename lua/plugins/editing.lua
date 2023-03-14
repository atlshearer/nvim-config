return {
    -- Completion Framework
    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require("cmp")

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
                    ['<CR>'] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Insert,
                        select = true,
                    })
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
                    format = function(entry, item)
                        local menu_icon = {
                            nvim_lsp = 'λ',
                            buffer = 'Ω',
                            path = '🖫',
                        }
                        item.menu = menu_icon[entry.source.name]
                        return item
                    end,
                },
            })
        end,
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
