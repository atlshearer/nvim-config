local nnoremap = require('atlshearer.keymap').nnoremap
local vnoremap = require('atlshearer.keymap').vnoremap

-- Focus File Tree
nnoremap("<leader>pv", "<cmd>NvimTreeFocus<CR>")
nnoremap("<leader>pt", "<cmd>NvimTreeToggle<CR>")
nnoremap("<leader>pr", "<cmd>NvimTreeRefresh<CR>")
nnoremap("<leader>pf", "<cmd>NvimTreeFindFile<CR>")

-- Comment Line
nnoremap("<C-_>", "<Plug>(comment_toggle_linewise_current)")
nnoremap("<C-/>", "<Plug>(comment_toggle_linewise_current)")
nnoremap("<leader>c", "<Plug>(comment_toggle_linewise_current)")
vnoremap("<C-_>", "<Plug>(comment_toggle_linewise_visual)")
vnoremap("<C-/>", "<Plug>(comment_toggle_linewise_visual)")
vnoremap("<leader>c", "<Plug>(comment_toggle_linewise_visual)")

-- Trouble Toggle
nnoremap("<leader>xx", "<cmd>TroubleToggle<CR>")
nnoremap("<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>")

-- Language Server Hotkeys
nnoremap("K", vim.lsp.buf.hover)
nnoremap("<c-k>", vim.lsp.buf.signature_help)
nnoremap("gD", vim.lsp.buf.implementation)
nnoremap("gd", vim.lsp.buf.definition)
nnoremap("gr", vim.lsp.buf.references)
nnoremap("gR", vim.lsp.buf.rename)
nnoremap("ga", vim.lsp.buf.code_action)
nnoremap("g0", vim.lsp.buf.document_symbol)
nnoremap("gW", vim.lsp.buf.workspace_symbol)
nnoremap("1gD", vim.lsp.buf.type_definition)

-- Markdown Preview
vim.keymap.set("n", "<leader>pm", "<Plug>MarkdownPreviewToggle", { desc = "Toggle Markdown Preview" })

-- Buffer Management
vim.keymap.set("n", "<leader>bc", "<cmd>bp|bd #<CR>", { desc = "Close current buffer" })
