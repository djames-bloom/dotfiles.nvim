local status_ok, saga = pcall(require, "lspsaga")
if not status_ok then
	return
end

vim.notify("Configuring lspsaga...", vim.log.levels.INFO)

saga.setup({
	ui = {
		border = "rounded",
		devicon = true,
		title = true,
		expand = "",
		collapse = "",
		code_action = "",
	},

	lightbulb = {
		enable = true,
		sign = true,
		virtual_text = false,
		sign_priority = 40,
	},

	symbol_in_winbar = {
		enable = true,
		separator = "  ",
		show_file = true,
		folder_level = 2,
	},

	diagnostic = {
		show_code_action = true,
		jump_num_shortcut = true,
		max_width = 0.7,
		show_layout = "normal",
	},

	code_action = {
		extend_gitsigns = true,
		show_server_name = true,
	},

	hover = {
		max_width = 0.5,
	},

	finder = {
		max_height = 0.5,
		keys = {
			toggle_or_open = "o",
			vsplit = "v",
			split = "s",
			quit = "q",
		},
	},

	rename = {
		keys = {
			quit = "<Esc>",
			exec = "<CR>",
			select = "x",
		},
	},
})
