require("fidget").setup()
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"gopls",
		"golangci_lint_ls",
		"docker_compose_language_service",
		"dockerls",
		"lua_ls",
		"typos_lsp",
		"tailwindcss",
	}
})

-- Configure LSP servers after Mason has installed them
require("mason-lspconfig").setup_handlers {
	function(server_name)
		require("lspconfig")[server_name].setup {}
	end,

	-- GoImports etc
	["gopls"] = function()
		require("lspconfig").gopls.setup {
			cmd = { "gopls", "serve" },
			on_attach = require("mason-lspconfig").common_on_attach,
			settings = {
				root_dir = vim.loop.cwd(),
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
						-- fieldalignment = true, -- Removed: no longer supported in gopls v0.17.0+
						nilness = true,
						unusedparams = true,
						unusedwrite = true,
						useany = true,
					},
					usePlaceholders = true,
					completeUnimported = true,
					staticcheck = true,
					directoryFilters = {
						"-.git",
						"-.vscode",
						"-.idea",
						"-.vscode-test",
						"-node_modules",
					},
					semanticTokens = true,
				},
			},
		}
	end,

	-- Go Lint
	["golangci_lint_ls"] = function()
		require("lspconfig").golangci_lint_ls.setup {
			cmd = { "golangci-lint-langserver", "run" },
			on_attach = require("mason-lspconfig").common_on_attach,
			settings = {
				root_dir = vim.loop.cwd(),
			}
		}
	end,

	-- Zig
	["zls"] = function()
		require("lspconfig").zls.setup {
			cmd = { "zls" },
			on_attach = require("mason-lspconfig").common_on_attach,
			settings = {
				root_dir = vim.loop.cwd(),
			},
		}
	end,

	-- Docker Compose
	["docker_compose_language_service"] = function()
		require("lspconfig").docker_compose_language_service.setup {
			cmd = { "docker-compose-langserver", "--stdio" },
			on_attach = require("mason-lspconfig").common_on_attach,
			settings = {
				root_dir = vim.loop.cwd(),

			},
		}
	end,

	-- Dockerfile
	["dockerls"] = function()
		require("lspconfig").dockerls.setup {
			cmd = { "docker-langserver", "--stdio" },
			on_attach = require("mason-lspconfig").common_on_attach,
			settings = {
				root_dir = vim.loop.cwd(),
			},
		}
	end,

	-- Lua
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

	-- Tailwind CSS
	["tailwindcss"] = function()
		require("lspconfig").tailwindcss.setup {
			cmd = { "tailwindcss-language-server", "--stdio" },
			on_attach = require("mason-lspconfig").common_on_attach,
			settings = {
				root_dir = vim.loop.cwd(),
			},
		}
	end,

	-- Typos
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
