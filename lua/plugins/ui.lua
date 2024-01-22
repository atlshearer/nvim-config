return {
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("nvim-tree").setup({
                view = {
                    width = 50
                },
                renderer = {
                    group_empty = true
                },
                git = {
                    timeout = 6000
                }
            })
        end
    },
    {
        "imNel/monorepo.nvim",
        config = function()
            require("monorepo").setup({
                -- Your config here!
            })
        end,
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    },
    {
        "nvim-lualine/lualine.nvim",
        opts = {
            options = {
                -- ignore_focus = {"NvimTree", "packer", "[No Name]"},
                disabled_filetypes = {
                    --    "NvimTree", "packer", "[No Name]"
                    -- winbar = { "NvimTree" },
                    statusline = {
                        "NvimTree"
                    }
                },
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = {
                    {
                        'filename',
                        path = 1,
                    }
                },
                lualine_x = { 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {
                    {
                        'filename',
                        path = 1,
                    }
                },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
            },
        }
    },
    {
        "folke/drop.nvim",
        event = "VimEnter",
        opts = {
            theme = "snow",
            screensaver = 1000 * 60 * 1,
            max = 100,
            interval = 1000,
        }
    },
    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup({})
        end
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && npm install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
            vim.g.mkdp_auto_start = 1
            vim.g.mkdp_auto_close = 0
            vim.g.mkdp_combine_preview = 1
        end,
        ft = { "markdown" }
    }
}
