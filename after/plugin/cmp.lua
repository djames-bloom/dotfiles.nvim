local cmp_setup = function()
	local cmp_status_ok, cmp = pcall(require, "cmp")
	if not cmp_status_ok then
	  return
	end

	local snip_status_ok, luasnip = pcall(require, "luasnip")
	if not snip_status_ok then
	  return
	end

	local lsp = require("lsp-zero")
	lsp.preset("recommended")

	local cmp = require("cmp")
	local cmp_select = { behavior = cmp.SelectBehavior.Select }
	local cmp_mappings = lsp.defaults.cmp_mappings({
		["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
	})

	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "cmdline" },
			{ name = "nvim_lua" },
			{ name = "buffer" },
			{ name = "calc" },
			{ name = "emoji" },
			{ name = "treesitter" },
			{ name = "spell" },
			{ name = "tags" },
			{ name = "vsnip" },
		}),
	})

	cmp_mappings["<Tab>"] = nil
	cmp_mappings["<S-Tab>"] = nil

	lsp.setup_nvim_cmp({
		mapping = cmp_mappings,
	})

	lsp.set_preferences({
		suggest_lsp_servers = false,
		sign_icons = {
			error = "E",
			warn = "W",
			hint = "H",
			info = "I",
		}
	})

	lsp.on_attach(function(client, bufnr)
		local opts = { buffer = bufnr, remap = false }

		vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts, { desc = "Go to definition" })
		vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts, { desc = "Hover" })
		vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts, { desc = "Workspace symbol" })
		vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts, { desc = "Show diagnostics" })
		vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts, { desc = "Next diagnostic" })
		vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts, { desc = "Prev diagnostic" })
		vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts, { desc = "Code action" })
		vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts, { desc = "References" })
		vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts, { desc = "Rename" })
		vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts, { desc = "Signature help" })
	end)
end

vim.defer_fn(function()
  if vim.fn.pumvisible() == 0 and vim.fn.getcmdtype() == "" then
    cmp_setup()
  end
end, 100)
