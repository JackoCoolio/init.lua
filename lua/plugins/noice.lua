return {
	"folke/noice.nvim",

	version = "4.4.7",

	dependencies = {
		"MunifTanjim/nui.nvim",
	},

	event = "VeryLazy",

	opts = {
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		notify = {
			-- i use fidget
			enabled = false,
		},
		presets = {
			command_palette = true,
			long_message_to_split = true,
			inc_rename = false,
			lsp_doc_border = false,
		},
	},
}
