require("trouble").setup({
	icons = false,
})

vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { noremap = true, silent = true, desc = "Trouble: Quickfix" })
