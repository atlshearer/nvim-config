return {
    {
        "EdenEast/nightfox.nvim",
        lazy = false,
        priority = 1000,
        config = function(_, opts)
            require("nightfox").setup(opts)

            vim.cmd([[colorscheme nightfox]])
        end,
    }
}
