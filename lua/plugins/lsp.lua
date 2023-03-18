return {
    "folke/neodev.nvim",
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "sumneko_lua",
                "rust_analyzer",
            }
        }
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("lspconfig").lua_ls.setup({
                on_attach = function()
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        callback = function()
                            vim.lsp.buf.format()
                        end
                    })
                end,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" }
                        },
                        completion = {
                            callSnippet = "Replace"
                        }
                    }
                }
            })

            require("lspconfig").tsserver.setup({
                filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
                cmd = { "typescript-language-server", "--stdio" }
            })

            require("lspconfig").eslint.setup({
                on_attach = function(_, bufnr)
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = bufnr,
                        command = "EslintFixAll",
                    })
                end
            })

            require("lspconfig").texlab.setup({
                texlab = {
                    build = {
                        onSave = true
                    }
                }
            })
        end
    },
    {
        "j-hui/fidget.nvim",
        opts = {}
    }
}
