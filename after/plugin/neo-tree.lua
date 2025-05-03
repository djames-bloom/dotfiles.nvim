-- nvim tree was starting to show some funky behavior so I swapped it out for neotree
-- imo it performs better in almost every way *but* I was used to the behavior of nvim tree
-- so theres a bunch of custom funcs in here to get it to act _almost_ identically to how
-- nvt used to. These aren't strictly necessary, but a personal gripe that I wanted the 
-- upgrade, with the functionality remaining the same.

local function custom_close()
	local buffers = vim.fn.getbufinfo({ buflisted = true })
	if #buffers > 0 then
		vim.cmd("Neotree close")
	else
		vim.cmd("quitall")
	end
end

require("neo-tree").setup({
	close_if_last_window = false,
	enable_git_status = true,
	enable_diagnostics = true,
	enable_modified_markers = true,
	popup_border_style = "rounded",
	default_component_configs = {
		container = {
			enable_character_fade = true
		},
		indent = {
			indent_size = 2,
			padding = 1,
			with_markers = true,
			indent_marker = "│",
			last_indent_marker = "└",
			highlight = "NeoTreeIndentMarker",
		},
		icon = {
			folder_closed = "",
			folder_open = "",
			folder_empty = "",
			default = "*",
			highlight = "NeoTreeFileIcon"
		},
		modified = {
			symbol = "[+]",
			highlight = "NeoTreeModified",
		},
		name = {
			trailing_slash = false,
			use_git_status_colors = true,
			highlight = "NeoTreeFileName",
		},
		git_status = {
			symbols = {
				added     = "✅",
				modified  = "❗️",
				deleted   = "❌",
				renamed   = "📝",
				untracked = "❓",
				ignored   = "🚫",
				unstaged  = "⚠️",
				staged    = "✨",
				conflict  = "⚔️",
			}
		},
		file_size = {
			enabled = true,
			required_width = 64,
		},
		type = {
			enabled = true,
			required_width = 110,
		},
		last_modified = {
			enabled = true,
			required_width = 88,
		},
		created = {
			enabled = true,
			required_width = 120,
		},
		symlink_target = {
			enabled = false,
		},
	},

	window = {
		position = "left",
		width = 40,
		mappings = {
			["<space>"] = "toggle_node",
			["<cr>"] = "open",
			["o"] = "open",
			["S"] = "open_split",
			["s"] = "open_vsplit",
			["C"] = "close_node",
			["z"] = "close_all_nodes",
			["a"] = "add",
			["d"] = "delete",
			["r"] = "rename",
			["y"] = "copy_to_clipboard",
			["x"] = "cut_to_clipboard",
			["p"] = "paste_from_clipboard",
			["q"] = function() custom_close() end,
			["R"] = "refresh",
		},
	},

	filesystem = {
		filtered_items = {
			visible = true,
			hide_dotfiles = false,
			hide_gitignored = false,
            -- hide the trash (these are all filtered by a global gitignore anyway)
			never_show = { ".DS_Store", "thumbs.db", ".git", ".idea", ".vscode" },
		},
		follow_current_file = {
			enabled = true,
		},
		group_empty_dirs = true,
		hijack_netrw_behavior = "open_default",
		use_libuv_file_watcher = true,
		window = {
			position = "left",
			width = 40,
			mappings = {
				["<bs>"] = "navigate_up",
				["."] = "set_root",
				["H"] = "toggle_hidden",
				["/"] = "fuzzy_finder",
				["D"] = "fuzzy_finder_directory",
				["#"] = "fuzzy_sorter",
				["f"] = "filter_on_submit",
				["<c-x>"] = "clear_filter",
				["<c-]>"] = "set_root",
			}
		},
		renderers = {
			directory = {
				{ "indent" },
				{ "icon" },
				{ "current_filter" },
				{
					"container",
					content = {
						{ "name",           zindex = 10 },
						{ "symlink_target", zindex = 10 },
						{ "clipboard",      zindex = 10 },
						{ "diagnostics",    errors_only = true, zindex = 20, align = "right" },
					}
				}
			},
			file = {
				{ "indent" },
				{ "icon" },
				{
					"container",
					content = {
						{ "name",           zindex = 10 },
						{ "symlink_target", zindex = 10 },
						{ "clipboard",      zindex = 10 },
						{ "bufnr",          zindex = 10 },
						{ "modified",       zindex = 20, align = "right" },
						{ "diagnostics",    zindex = 20, align = "right" },
						{ "git_status",     zindex = 20, align = "right" },
						{ "file_size",      zindex = 10, align = "right" },
						{ "type",           zindex = 10, align = "right" },
						{ "last_modified",  zindex = 10, align = "right" },
						{ "created",        zindex = 10, align = "right" },
					}
				}
			},
		},
	},

	buffers = {
		follow_current_file = {
			enabled = true,
		},
		group_empty_dirs = true,
		show_unloaded = true,
		renderers = {
			directory = {
				{ "indent" },
				{ "icon" },
				{ "name" },
			},
			file = {
				{ "indent" },
				{ "icon" },
				{ "name" },
				{ "bufnr",       align = "right" },
				{ "modified",    align = "right" },
				{ "diagnostics", align = "right" },
				{ "git_status",  align = "right" },
			},
		},
	},

	git_status = {
		window = {
			position = "float",
		},
		renderers = {
			directory = {
				{ "indent" },
				{ "icon" },
				{ "name" },
			},
			file = {
				{ "indent" },
				{ "icon" },
				{ "name" },
				{ "git_status", align = "right" },
			},
		},
	},
})

-- Add an autocommand to handle :q when Neo-tree is the last window
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		if vim.bo.filetype ~= "neo-tree" then
			return
		end

		vim.schedule(function()
			local wins = vim.api.nvim_list_wins()
			local non_floating_wins = {}
			local neo_tree_win = nil

			for _, win in ipairs(wins) do
				local cfg = vim.api.nvim_win_get_config(win)
				if cfg.relative == "" then
					local buf = vim.api.nvim_win_get_buf(win)
					local buf_ft = vim.api.nvim_buf_get_option(buf, "filetype")

					if buf_ft == "neo-tree" then
						neo_tree_win = win
					else
						table.insert(non_floating_wins, win)
					end
				end
			end

			if #non_floating_wins == 0 and neo_tree_win then
				local buf = vim.api.nvim_win_get_buf(neo_tree_win)
				vim.keymap.set("n", "q", "<cmd>quitall<CR>", {
					buffer = buf,
					noremap = true,
					silent = true
				}, {
					desc = "Quit Neovim when Neo-tree is the last window"
				})
			end
		end)
	end
})

-- Create command for properly closing Neo-tree
vim.api.nvim_create_user_command("NeotreeClose", function()
	custom_close()
end, {})

-- Override the built-in :q command when Neo-tree is the last window
vim.api.nvim_create_autocmd("CmdlineEnter", {
	callback = function()
		vim.schedule(function()
			local cmd = vim.fn.getcmdline()
			if cmd == "q" or cmd == "q!" then
				local wins = vim.api.nvim_list_wins()
				local non_floating_non_tree_count = 0
				local neo_tree_count = 0

				for _, win in ipairs(wins) do
					if vim.api.nvim_win_get_config(win).relative == "" then
						local buf = vim.api.nvim_win_get_buf(win)
						local ft = vim.api.nvim_buf_get_option(buf, "filetype")

						if ft == "neo-tree" then
							neo_tree_count = neo_tree_count + 1
						else
							non_floating_non_tree_count = non_floating_non_tree_count + 1
						end
					end
				end

				-- If there's only Neo-tree window(s) left, make :q quit Neovim
				if non_floating_non_tree_count == 0 and neo_tree_count > 0 then
					vim.fn.setcmdline("quitall" .. (cmd:match("!$") and "!" or ""))
				end
			end
		end)
	end
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "neo-tree",
	callback = function()
		local win_id = vim.api.nvim_get_current_win()
		vim.api.nvim_win_set_width(win_id, 40)
	end
})
