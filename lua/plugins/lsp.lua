return {
    "folke/neodev.nvim",
    {
        "williamboman/mason.nvim",
        opts = {},
        run = ":MasonUpdate"
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim"
        },
        opts = {
            ensure_installed = {
                "lua_ls",
                "ts_ls",
                -- "eslint",
                "cssls",
                "texlab",
                "gradle_ls",
                "kotlin_language_server",
                "sqlls",
                "rust_analyzer",
                "marksman",
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

            require("lspconfig").ts_ls.setup({
                filetypes = { "javascript", "typescript", "typescriptreact", "typescript.tsx" },
                cmd = { "typescript-language-server", "--stdio" },
            })

            require("lspconfig").eslint.setup({
                on_attach = function(_, bufnr)
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = bufnr,
                        command = "EslintFixAll",
                    })
                end
            })

            require("lspconfig").cssls.setup({})

            require("lspconfig").texlab.setup({
                texlab = {
                    build = {
                        onSave = true
                    }
                }
            })

            require("lspconfig").gradle_ls.setup({
                filetypes = { "groovy", "kotlin" }
            })

            require("lspconfig").kotlin_language_server.setup({
                on_attach = function(_, bufnr)
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        callback = function()
                            vim.lsp.buf.format()
                        end
                    })
                end
            })

            require("lspconfig").sqlls.setup({
                on_attach = function()
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        callback = function()
                            vim.lsp.buf.format()
                        end
                    })
                end
            })

            require("lspconfig").marksman.setup({
                on_attach = function()
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        callback = function()
                            -- vim.lsp.buf.format()
                        end
                    })
                end
            })
        end
    },
    {
        "simrat39/rust-tools.nvim",
        opts = {
            server = {
                on_attach = function()
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        callback = function()
                            vim.lsp.buf.format()
                        end
                    })
                end
            }
        }
    },
    {
        "j-hui/fidget.nvim",
        opts = {}
    }
}
