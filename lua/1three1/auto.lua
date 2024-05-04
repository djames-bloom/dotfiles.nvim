-- Remapping custom file extensions to enable correct (or near correct) syntax highlighting

-- @ref https://fe-lang.org/
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*.fe",
    command = "set filetype=rust",
})

-- @ref https://fishshell.com/docs/current/language.html
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*.fish",
    command = "set filetype=sh",
})

-- @ref https://fuellabs.github.io/sway/
-- @todo replace when the sway-lsp integration is available
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
	pattern = "*.sw",
	command = "set filetype=rust",
})

-- Autorun `GoImports` against saved go files
vim.api.nvim_create_autocmd({"InsertLeave", "BufWritePre"}, {
	pattern = "*.go",
	command = "Neoformat goimports",
})

-- Flash yanked
vim.api.nvim_create_autocmd({"TextYankPost"}, {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 420,
		})
	end,
})
