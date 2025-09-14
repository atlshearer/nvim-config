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
            }
        }
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.config('lua_ls', {
                on_attach = function(_, bufnr)
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        bufnr = bufnr,
                        callback = function()
                            vim.lsp.buf.format()
                        end
                    })
                end,
                on_init = function(client)
                    if client.workspace_folders then
                        local path = client.workspace_folders[1].name
                        if
                            path ~= vim.fn.stdpath('config')
                            and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
                        then
                            return
                        end
                    end

                    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                        runtime = {
                            -- Tell the language server which version of Lua you're using (most
                            -- likely LuaJIT in the case of Neovim)
                            version = 'LuaJIT',
                            -- Tell the language server how to find Lua modules same way as Neovim
                            -- (see `:h lua-module-load`)
                            path = {
                                'lua/?.lua',
                                'lua/?/init.lua',
                            },
                        },
                        -- Make the server aware of Neovim runtime files
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                vim.env.VIMRUNTIME
                                -- Depending on the usage, you might want to add additional paths
                                -- here.
                                -- '${3rd}/luv/library'
                                -- '${3rd}/busted/library'
                            }
                            -- Or pull in all of 'runtimepath'.
                            -- NOTE: this is a lot slower and will cause issues when working on
                            -- your own configuration.
                            -- See https://github.com/neovim/nvim-lspconfig/issues/3189
                            -- library = {
                            --   vim.api.nvim_get_runtime_file('', true),
                            -- }
                        }
                    })
                end,
                settings = {
                    Lua = {}
                }
            })

            vim.lsp.enable('ts_ls')

            local base_on_attach = vim.lsp.config.eslint.on_attach
            vim.lsp.config("eslint", {
                on_attach = function(client, bufnr)
                    if not base_on_attach then return end

                    base_on_attach(client, bufnr)
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = bufnr,
                        command = "LspEslintFixAll",
                    })
                end,
            })
        end
    },
    {
        "j-hui/fidget.nvim",
        opts = {}
    },
    {
        "prettier/vim-prettier",
        init = function()
            vim.api.nvim_set_var("prettier#autoformat", 0)
            vim.api.nvim_set_var("prettier#autoformat_require_pragma", 1)
        end
    }
}
