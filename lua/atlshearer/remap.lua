local nnoremap = require('atlshearer.keymap').nnoremap
local vnoremap = require('atlshearer.keymap').vnoremap

-- Focus File Tree
nnoremap("<leader>pv", "<cmd>NvimTreeFocus<CR>")
nnoremap("<leader>pt", "<cmd>NvimTreeToggle<CR>")
nnoremap("<leader>pr", "<cmd>NvimTreeRefresh<CR>")
nnoremap("<leader>pf", "<cmd>NvimTreeFindFile<CR>")

-- Buffer Picker
nnoremap("<leader>bp", "<cmd>BufferPick<CR>")
nnoremap("<leader>bc", "<cmd>BufferClose<CR>")
nnoremap("<A-/>", "<cmd>BufferClose<CR>")
nnoremap("<A-.>", "<cmd>BufferNext<CR>")
nnoremap("<A-,>", "<cmd>BufferPrevious<CR>")
nnoremap("<leader>1", "<cmd>BufferGoto 1<CR>")
nnoremap("<leader>2", "<cmd>BufferGoto 2<CR>")
nnoremap("<leader>3", "<cmd>BufferGoto 3<CR>")
nnoremap("<leader>4", "<cmd>BufferGoto 4<CR>")
nnoremap("<leader>5", "<cmd>BufferGoto 5<CR>")
nnoremap("<leader>6", "<cmd>BufferGoto 6<CR>")
nnoremap("<leader>7", "<cmd>BufferGoto 7<CR>")
nnoremap("<leader>8", "<cmd>BufferGoto 8<CR>")
nnoremap("<leader>9", "<cmd>BufferGoto 9<CR>")

-- Comment Line
nnoremap("<C-_>", "<Plug>(comment_toggle_linewise_current)")
vnoremap("<C-_>", "<Plug>(comment_toggle_linewise_visual)")

-- Trouble Toggle
nnoremap("<leader>xx", "<cmd>TroubleToggle<CR>")
nnoremap("<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>")

-- Telescope
nnoremap("<leader>ff", "<cmd>Telescope find_files<CR>")
nnoremap("<leader>fg", "<cmd>Telescope live_grep<CR>")
nnoremap("<leader>fb", "<cmd>Telescope buffers<CR>")
nnoremap("<leader>fh", "<cmd>Telescope help_tags<CR>")

-- Language Server Hotkeys
nnoremap("K", vim.lsp.buf.hover)
nnoremap("<c-k>", vim.lsp.buf.signature_help)
nnoremap("gR", vim.lsp.buf.rename)
