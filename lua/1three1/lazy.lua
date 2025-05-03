-- Bunch of plugin changes since v1
-- Make use of lazy's lazyloading feature to speed up launch time (~110ms)
return require("lazy").setup({
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = true,
    },

    { "nvim-lua/popup.nvim", lazy = true },
    { "nvim-lua/plenary.nvim", lazy = true },

    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
        },
    },

    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        cmd = "Telescope file_browser",
    },

    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
    },

    -- themes - lazy load all of them, prio load the active theme
    { "rose-pine/neovim", lazy = true },
    { "folke/tokyonight.nvim", lazy = true, priority = 1000 },
    { "chriskempson/base16-vim", lazy = true },

    -- reformatter (replaces NeoFormat)
    {
        'stevearc/conform.nvim',
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
    },

    -- Misc
    {
        "folke/trouble.nvim",
        cmd = { "Trouble", "TroubleToggle" },
        keys = {
            { "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Toggle Trouble" },
        },
    },
    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        keys = {
            { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" },
        },
    },
    {
        "laytan/cloak.nvim",
        event = "BufReadPost",
    },

    -- Treesitter + LSP
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "lua", "vim", "vimdoc", "go", "rust" },
                sync_install = false,
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },
    {
        "nvim-treesitter/playground",
        cmd = "TSPlaygroundToggle",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },

    -- Mason must be loaded before lsps and linters
    {
		"j-hui/fidget.nvim",
		event = "LspAttach",
		opts = {
		  notification = {
			window = {
			  winblend = 0,
			},
		  },
		},
	  },
    {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonUpdate" },
        build = ":MasonUpdate",
        config = function()
            require("mason").setup()
        end,
    },

    -- Linters
    {
        "mfussenegger/nvim-lint",
        event = { "BufWritePost", "InsertLeave" },
    },
    {
        "rshkarin/mason-nvim-lint",
        event = "VeryLazy",
        dependencies = { "williamboman/mason.nvim" },
    },

    -- LSP Support - lazy load everything
    {
        "williamboman/mason-lspconfig.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "williamboman/mason.nvim" },
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "williamboman/mason-lspconfig.nvim" },
    },

    -- LSP UI
    {
        "glepnir/lspsaga.nvim",
        branch = "main",
        event = "LspAttach",
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }
    },

    -- Autocompletes
    {
        "github/copilot.vim",
        event = "InsertEnter",
    },
    {
        "hrsh7th/nvim-cmp",
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-cmdline",
            "L3MON4D3/LuaSnip",
        },
    },

    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        cmd = "Neotree",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
    },

    -- debugger
    {
        "mfussenegger/nvim-dap",
        cmd = { "DapToggleBreakpoint", "DapContinue" },
        keys = {
            { "<leader>db", "<cmd>DapToggleBreakpoint<cr>", desc = "Toggle Breakpoint" },
            { "<leader>dc", "<cmd>DapContinue<cr>", desc = "Continue" },
        },
    },
    {
        "Pocco81/dap-buddy.nvim",
        cmd = { "DapBuddyOpen" },
        dependencies = { "mfussenegger/nvim-dap" },
    },
    {
        "szw/vim-maximizer",
        cmd = "MaximizerToggle",
        keys = {
            { "<leader>m", "<cmd>MaximizerToggle<cr>", desc = "Maximize Window" },
        },
    },

    -- Snips
    {
        "L3MON4D3/LuaSnip",
        event = "InsertEnter",
        dependencies = { "rafamadriz/friendly-snippets" },
    },
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "neovim/nvim-lspconfig",
            "williamboman/mason-lspconfig.nvim",
        }
    }
})
