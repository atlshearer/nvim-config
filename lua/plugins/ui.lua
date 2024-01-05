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
        "romgrk/barbar.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            -- Move buffer tabs over for file tree
            local nvim_tree_events = require('nvim-tree.events')
            local bufferline_api = require('bufferline.api')

            local function get_tree_size()
                return require 'nvim-tree.view'.View.width
            end

            nvim_tree_events.subscribe('TreeOpen', function()
                bufferline_api.set_offset(get_tree_size())
            end)

            nvim_tree_events.subscribe('Resize', function()
                bufferline_api.set_offset(get_tree_size())
            end)

            nvim_tree_events.subscribe('TreeClose', function()
                bufferline_api.set_offset(0)
            end)
        end
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
}
