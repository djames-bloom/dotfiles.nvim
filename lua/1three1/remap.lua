local keymap = vim.keymap.set

vim.cmd([[
	augroup lsp_diagnostics_float
	autocmd!
	autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false, border="rounded"})
	augroup END
]])

keymap("n", "<leader>tc", "<cmd>CloakToggle<cr>", { desc = "Cloak: Toggle Visibility" })
keymap("n", "<leader>tf", "<cmd>Telescope find_files<cr>", { desc = "Telescope: Find Files" })
keymap("n", "<leader>tg", "<cmd>Telescope live_grep<cr>", { desc = "Telescope: Live Grep" })
keymap("n", "<leader>tb", "<cmd>Telescope buffers<cr>", { desc = "Telescope: Buffers" })
keymap("n", "<leader>th", "<cmd>Telescope help_tags<cr>", { desc = "Telescope: Help Tags" })

keymap("n", "<leader>gg", "gg=G<CR>", { desc = "Jump to top" })
keymap("n", "<leader>gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { desc = "Signature Help" })
keymap("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Goto Definition" })
keymap("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "Find References" })
keymap("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "Goto Implementation" })

keymap({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to clipboard" })
keymap("n", "<leader>qq", "<cmd>wq<cr>", { desc = "Save and Quit" })

keymap("n", "Q", "<nop>", { noremap = true, silent = true }, { desc = "Disable Q" })
keymap("n", "<leader>[", "<cmd>foldclose<cr>", { noremap = true, silent = true }, { desc = "Fold" })
keymap("n", "<leader>]", "<cmd>foldopen<cr>", { noremap = true, silent = true }, { desc = "Unfold" })

keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { desc = "Goto Definition" })
keymap("n", "gr", "<cmd>Lspsaga finder<CR>", { desc = "Find References" })
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "Hover Doc" })
keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "Code Action" })
keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { desc = "Rename Symbol" })

keymap("n", "<leader>g", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Show Diagnostic" })
keymap("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle Neo-tree" })

keymap('n', '<leader>df', vim.diagnostic.open_float, { desc = "Show diagnostic float" })
keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Prev Diagnostic" })
keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Next Diagnostic" })
keymap('n', '<leader>dl', vim.diagnostic.setloclist, { desc = "Diagnostics list" })
