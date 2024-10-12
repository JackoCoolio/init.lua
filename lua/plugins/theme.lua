return vim.tbl_map(function(colorscheme)
	return { import = "plugins.theme." .. colorscheme }
end, {
	"catppuccin",
	"kanagawa",
	"oxocarbon",
	"tokyonight",
})
