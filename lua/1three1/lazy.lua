return require("lazy").setup({
	{ "nvim-lua/popup.nvim" },
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-telescope/telescope.nvim" },
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
	},
	{ "kosayoda/nvim-lightbulb" },
	{ "nvim-lualine/lualine.nvim" },

	-- themes
	{ "folke/tokyonight.nvim" }, -- daily driver
	{ "rose-pine/neovim" }, -- presentation theme (colorscheme rose-pine-dawn)
	{ "chriskempson/base16-vim" },

	-- reformatter (GoImports)
	{ "sbdchd/neoformat"},

	-- Misc
	{ "folke/trouble.nvim" },
	{ "folke/zen-mode.nvim" },
	{ "laytan/cloak.nvim" },

	-- Treesitter + LSP
	({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	}),
	( "nvim-treesitter/playground" ),
	( "nvim-treesitter/nvim-treesitter-context" ),

	-- Mason must be loaded before lsps and linters
	{ "williamboman/mason.nvim" },

	-- LSP Support
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },

	-- Linters
	{ "mfussenegger/nvim-lint" },
	{ "rshkarin/mason-nvim-lint" },

	-- Autocompletes
	{ "github/copilot.vim" },
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-nvim-lua" },
	{ "hrsh7th/cmp-cmdline" },

	-- Trees
	{ "kyazdani42/nvim-tree.lua" },
	{ "kyazdani42/nvim-web-devicons" },
	{ "mbbill/undotree" },

	-- debugger
	{ "mfussenegger/nvim-dap" },
	{ "Pocco81/dap-buddy.nvim" },
	{ "szw/vim-maximizer" },

	-- Snips
	{ "L3MON4D3/LuaSnip" },
	{ "rafamadriz/friendly-snippets" },
	{ "VonHeikemen/lsp-zero.nvim", branch = "v1.x", require = {} }
})
