local should_enable_blame = function(bufnr)
	local max_filesize = 100 * 1024 -- 100 KB
	local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(bufnr))
	if ok and stats and stats.size > max_filesize then
		return false
	end

	return true
end

return {
	"lewis6991/gitsigns.nvim",

	lazy = false,

	opts = {
		current_line_blame = true,

		on_attach = function(bufnr)
			local enable_blame = should_enable_blame(bufnr)
			require("gitsigns.actions").toggle_current_line_blame(enable_blame)
		end,
	},
}
