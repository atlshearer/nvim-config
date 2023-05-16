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
                }
            })
        end
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
    {
        "folke/todo-comments.nvim",
        lazy = false,
        requires = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("todo-comments").setup({
                signs = true,      -- show icons in the signs column
                sign_priority = 8, -- sign priority
                -- keywords recognized as todo comments
                keywords = {
                    FIX = {
                        icon = " ",                              -- icon used for the sign, and in search results
                        color = "error",                            -- can be a hex color, or a named color (see below)
                        alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
                        -- signs = false, -- configure signs for some keywords individually
                    },
                    TODO = { icon = " ", color = "info" },
                    HACK = { icon = " ", color = "warning" },
                    WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
                    PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
                    NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
                    TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
                    LOGMA = { icon = " ", color = "hint", alt = { "INFO" } },
                },
                gui_style = {
                    fg = "NONE",       -- The gui style to use for the fg highlight group.
                    bg = "BOLD",       -- The gui style to use for the bg highlight group.
                },
                merge_keywords = true, -- when true, custom keywords will be merged with the defaults
                -- highlighting of the line containing the todo comment
                -- * before: highlights before the keyword (typically comment characters)
                -- * keyword: highlights of the keyword
                -- * after: highlights after the keyword (todo text)
                highlight = {
                    multiline = true,                              -- enable multine todo comments
                    multiline_pattern = "^.",                      -- lua pattern to match the next multiline from the start of the matched keyword
                    multiline_context = 10,                        -- extra lines that will be re-evaluated when changing a line
                    before = "",                                   -- "fg" or "bg" or empty
                    keyword = "wide",                              -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
                    after = "fg",                                  -- "fg" or "bg" or empty
                    -- pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
                    pattern = { [[.*<(KEYWORDS)\s*]], [[LOGMA]] }, -- pattern or table of patterns, used for highlighting (vim regex)
                    comments_only = true,                          -- uses treesitter to match keywords in comments only
                    max_line_len = 400,                            -- ignore lines longer than this
                    exclude = {},                                  -- list of file types to exclude highlighting
                },
                -- list of named colors where we try to extract the guifg from the
                -- list of highlight groups or use the hex color if hl not found as a fallback
                colors = {
                    error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
                    warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
                    info = { "DiagnosticInfo", "#2563EB" },
                    hint = { "DiagnosticHint", "#10B981" },
                    default = { "Identifier", "#7C3AED" },
                    test = { "Identifier", "#FF00FF" }
                },
                search = {
                    command = "rg",
                    args = {
                        "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                    },
                    -- regex that will be used to match keywords.
                    -- don't replace the (KEYWORDS) placeholder
                    -- pattern = [[\b(KEYWORDS):]], -- ripgrep regex
                    pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
                },
            })
        end
    }
}
