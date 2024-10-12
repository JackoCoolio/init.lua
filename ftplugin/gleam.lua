local utils = require("jackocoolio.util")

-- gleam convention is 2 space tabs
utils.set_tab_width(2)

vim.api.nvim_create_augroup("AutoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.gleam",
	group = "AutoFormat",
	callback = function()
		vim.lsp.buf.format()
	end,
})
