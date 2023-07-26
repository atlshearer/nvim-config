return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-telescope/telescope-file-browser.nvim",
            "nvim-lua/plenary.nvim",
        },
        config = function()
            local telescope = require("telescope")

            telescope.setup()
            telescope.load_extension("file_browser")

            local builtin = require("telescope.builtin")

            vim.keymap.set("n", "<leader>f0", builtin.builtin, { desc = "List Telescope Builtins" })
            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
            vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Help" })
            vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Find Symbols" })
            vim.keymap.set("n", "<leader>fw", builtin.lsp_dynamic_workspace_symbols, { desc = "Find Workspace Symbols" })
        end,
    }
}
