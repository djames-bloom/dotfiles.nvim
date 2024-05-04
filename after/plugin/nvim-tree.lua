require("nvim-tree").setup({
	hijack_cursor = true,
	sync_root_with_cwd = true,
	prefer_startup_root = true,
	on_attach = on_attach,
	sort_by = "case_sensitive",
	view = {
		adaptive_size = true,
	},
	renderer = {
		full_name = true,
		group_empty = true,
		highlight_opened_files = "name",
		root_folder_modifier = ":t",
		symlink_destination = false,
		indent_markers = {
			enable = true,
		},
		icons = {
			git_placement = "signcolumn",
			show = {
				file = true,
				folder = true,
				folder_arrow = false,
				git = true,
			},
			glyphs = {
				modified = "[+]",
			},
		},
	},
	update_focused_file = {
		enable = true,
		ignore_list = {
			"help",
			"git",
		},
	},
	git = {
		timeout = 420,
		show_on_open_dirs = false,
		ignore = false,
	},
	modified = {
		enable = true,
		show_on_open_dirs = false,
	},
	actions = {
		change_dir = {
			enable = true,
			global = true,
		},
		open_file = {
			resize_window = true,
		},
		remove_file = {
			close_window = false,
		},
	},
	filters = {
		-- Global dots (usually over eager)
		-- dotfiles = false,
		-- Regular conf in projects
		custom = {
			"^.git$",
			"^.idea$",
			"^.DS_Store$",
		},
	},
})
