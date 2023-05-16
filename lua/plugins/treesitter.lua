return {
    { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },

    {
        "mfussenegger/nvim-treehopper",
        keys = { { "m", mode = { "o", "x" } } },
        config = function()
            vim.cmd([[
        omap     <silent> m :<C-U>lua require('tsht').nodes()<CR>
        xnoremap <silent> m :lua require('tsht').nodes()<CR>
      ]])
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter-context",
        event = "BufReadPre",
        config = true,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "astro",
                    "bash",
                    "c",
                    "cmake",
                    -- "comment", -- comments are slowing down TS bigtime, so disable for now
                    "cpp",
                    "css",
                    "diff",
                    "fish",
                    "gitignore",
                    "go",
                    "graphql",
                    -- "help",
                    "html",
                    "http",
                    "java",
                    "javascript",
                    "jsdoc",
                    "jsonc",
                    "kotlin",
                    "latex",
                    "lua",
                    "markdown",
                    "markdown_inline",
                    "meson",
                    "ninja",
                    "nix",
                    "norg",
                    "org",
                    "php",
                    "python",
                    "query",
                    "regex",
                    "rust",
                    "scss",
                    "sql",
                    "svelte",
                    "teal",
                    "toml",
                    "tsx",
                    "typescript",
                    "vhs",
                    "vim",
                    "vue",
                    "wgsl",
                    "yaml",
                    -- "wgsl",
                    "json",
                    -- "markdown",
                },
                matchup = {
                    enable = true,
                },
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false
                },
                rainbow = {
                    enable = true,
                    extended_mode = true,
                    max_file_lines = nil,
                }
            })
        end
    },
    "HiPhish/nvim-ts-rainbow2"
}
