return {
	"stevearc/conform.nvim",

	lazy = false,

	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			rust = { "rustfmt", lsp_format = "fallback" },
			javascript = { "prettier", stop_after_first = true },
			go = { "gofmt", append_args = { "-s" } },
			sql = { "sqlfluff" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
