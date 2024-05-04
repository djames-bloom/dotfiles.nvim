require("trouble").setup({
	icons = false,
})

vim.keymap.set("n", "<leader>xz", "<cmd>TroubleToggle quickfix<cr>", { noremap = true, silent = true })

