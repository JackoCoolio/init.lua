local toggle_trouble_fn = function(mode)
	return function()
		require("trouble").toggle(mode)
	end
end

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("LspAttach", { clear = true }),
	desc = "On LSP attach",
	callback = function(args)
		require("which-key").add({
			{
				buffer = args.buf,
				group = "lsp",
				mode = "n",
				{
					desc = "Open diagnostic float",
					"gl",
					vim.diagnostic.open_float,
				},
				{
					desc = "Goto previous diagnostic",
					"<leader>dN",
					vim.diagnostic.goto_prev,
				},
				{
					desc = "Goto previous diagnostic",
					"<leader>dn",
					vim.diagnostic.goto_next,
				},
				{
					desc = "Reset diagnostics",
					"<leader>Q",
					vim.diagnostic.reset,
				},
				{
					desc = "Hover symbol",
					"K",
					vim.lsp.buf.hover,
				},
				{
					desc = "Rename symbol",
					"<leader>rn",
					vim.lsp.buf.rename,
				},
				{
					desc = "Goto declaration",
					"gD",
					toggle_trouble_fn("lsp_type_definitions"),
				},
				{
					desc = "Goto definition",
					"gd",
					toggle_trouble_fn("lsp_definitions"),
				},
				{
					desc = "Goto implementations",
					"gi",
					toggle_trouble_fn("lsp_implementations"),
				},
				{
					desc = "Goto references",
					"gr",
					toggle_trouble_fn("lsp_references"),
				},
				{
					desc = "Format document",
					"<leader>fd",
					vim.lsp.buf.format,
				},
			},
		})
	end,
})
