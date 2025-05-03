-- pre-quit behavior to make neo-tree act more like nvimtree
vim.api.nvim_create_autocmd("QuitPre", {
	callback = function()
	  local tree_wins = {}
	  local floating_wins = {}
	  local wins = vim.api.nvim_list_wins()
	  local modified = false

	  for _, w in ipairs(wins) do
		local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
		if bufname:match("neo%-tree filesystem") then
		  table.insert(tree_wins, w)
		end
		if vim.api.nvim_win_get_config(w).relative ~= "" then
		  table.insert(floating_wins, w)
		end
		if vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(w), "modified") then
		  modified = true
		end
	  end

	  -- If there's only neo-tree and floating windows, close them and quit
	  if #wins == (#tree_wins + #floating_wins) then
		-- Close all floating windows first
		for _, w in ipairs(floating_wins) do
		  vim.api.nvim_win_close(w, true)
		end

		-- Then close neo-tree windows
		for _, w in ipairs(tree_wins) do
		  vim.api.nvim_win_close(w, true)
		end

		-- If no modified buffers, quit
		if not modified then
		  vim.cmd('quit')
		end
	  end
	end
  })


-- @ref https://fishshell.com/docs/current/language.html
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.fish",
	command = "set filetype=sh",
})

vim.filetype.add {
	extension = {
		fish = "fish",
		fe = "rust",
		sw = "rust"
	}
}

vim.api.nvim_create_autocmd("FileType", {
	pattern = "NvimTree",
	callback = function()
		vim.opt_local.winbar = nil
	end,
})


-- Replaced NeoFormat with Conform
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		local conform_status, conform = pcall(require, "conform")
		if conform_status then
			conform.format({
				bufnr = vim.api.nvim_get_current_buf(),
				lsp_fallback = true,
				async = false,
			})
		end

		vim.opt_local.backup = false
		vim.opt_local.writebackup = false
		vim.cmd("setlocal noreadonly")
		vim.cmd("setlocal modifiable")
	end
})


-- Run linters
vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost" }, {
	callback = function()
		local lint_status, lint = pcall(require, "lint")
		if lint_status then
			lint.linters_by_ft = {
				markdown = { 'typos', 'woke' },
				go = { 'typos', 'woke' },
				gitcommit = { 'typos', 'woke', 'gitleaks' },
			}

			lint.try_lint()
		end
	end,
})

-- Yank group
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 420,
		})
	end,
})
