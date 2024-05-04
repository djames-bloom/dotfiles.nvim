local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end


local actions = require("telescope.actions")
require("telescope").setup{
	extensions = {
		file_browser = {
			theme = "ivy",
			hijack_netrw = true,
			mappings = {
			  ["i"] = {
				["<S-Tab>"] = actions.move_selection_previous,
				["<Tab>"] = actions.move_selection_next,
			  },
			  ["n"] = {
				["<S-Tab>"] = actions.move_selection_previous,
				["<Tab>"] = actions.move_selection_next,
			  },
			},
		  },
	},
}
require("telescope").load_extension "file_browser"
