require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"gopls",
		"golangci_lint_ls",
		"bufls",
		"docker_compose_language_service",
		"dockerls",
		"tsserver",
		"lua_ls",
		"typos_lsp",
	}
})

-- Configure LSP servers after Mason has installed them
require("mason-lspconfig").setup_handlers{
	function (server_name)
		require("lspconfig")[server_name].setup {}
	end,

	["gopls"] = function()
		require("lspconfig").gopls.setup {
			cmd = { "gopls", "serve" },
			root_dir = vim.loop.cwd(),
			on_attach = require("mason-lspconfig").common_on_attach,
			settings = {
				gopls = {
					gofumpt = true,
					codelenses = {
						gc_details = false,
						generate = true,
						regenerate_cgo = true,
						run_govulncheck = true,
						test = true,
						tidy = true,
						upgrade_dependency = true,
						vendor = true,
					},
					hints = {
						assignVariableTypes = true,
						compositeLiteralFields = true,
						compositeLiteralTypes = true,
						constantValues = true,
						functionTypeParameters = true,
						parameterNames = true,
						rangeVariableTypes = true,
					},
					analyses = {
						fieldalignment = true,
						nilness = true,
						unusedparams = true,
						unusedwrite = true,
						useany = true,
					},
					usePlaceholders = true,
					completeUnimported = true,
					staticcheck = true,
					directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
					semanticTokens = true,
				},
			},
		}
	end,

	["golangci_lint_ls"] = function()
		require("lspconfig").golangci_lint_ls.setup {
			cmd = { "golangci-lint-langserver", "run" },
			on_attach = require("mason-lspconfig").common_on_attach,
			settings = {
				root_dir = vim.loop.cwd(),
			}
		}
	end,

	["bufls"] = function()
		require("lspconfig").bufls.setup {
			cmd = { "bufls", "serve" },
			on_attach = require("mason-lspconfig").common_on_attach,
			settings = {},
		}
	end,

	["docker_compose_language_service"] = function()
		require("lspconfig").docker_compose_language_service.setup {
			cmd = { "docker-compose-langserver", "--stdio" },
			on_attach = require("mason-lspconfig").common_on_attach,
			settings = {
				root_dir = vim.loop.cwd(),

			},
		}
	end,

	["dockerls"] = function()
		require("lspconfig").dockerls.setup {
			cmd = { "docker-langserver", "--stdio" },
			on_attach = require("mason-lspconfig").common_on_attach,
			settings = {
				root_dir = vim.loop.cwd(),
			},
		}
	end,

	["tsserver"] = function()
		require("lspconfig").tsserver.setup {
			cmd = { "typescript-language-server", "--stdio" },
			on_attach = require("mason-lspconfig").common_on_attach,
			settings = {
				root_dir = vim.loop.cwd(),
				typescript = {
					format = {
						enable = false,
					},
					validate = "on",
				},
				javascript = {
					format = {
						enable = false,
					},
					validate = "on",
				},
			},
		}
	end,

	["lua_ls"] = function()
		require("lspconfig").lua_ls.setup {
			cmd = { "lua-language-server" },
			on_attach = require("mason-lspconfig").common_on_attach,
			settings = {
				root_dir = vim.loop.cwd(),
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		}
	end,

	["typos_lsp"] = function()
		require("lspconfig").typos_lsp.setup {
			cmd = { "typos-lsp", "serve" },
			on_attach = require("mason-lspconfig").common_on_attach,
			config = {
				root_dir = vim.loop.cwd(),
				defaults = {
					enable = true,
					check_file = true,
				},
			},
		}
	end,
}


