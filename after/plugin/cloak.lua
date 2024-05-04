require("cloak").setup({
	enabled = true,
	highlight_group = "Comment",
	cloak_length = nil,
	try_all_patterns = true,
	cloak_telescope = true,
	patterns = {
		{
			file_pattern = {
				".env",
				".env*",
				"wrangler.toml",
				".dev.vars",
				"*.tfvars",

			},
			cloak_pattern = "=.+",
			replace = nil,
		},
		{
			file_pattern = {
				"*.tf",
				"*.tf*",
			},
			cloak_pattern = ".*",
			replace = nil,
		},
	},
})
