local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

if os.getenv("NIX_PATH") ~= nil then
	local orig_stdpath = vim.fn.stdpath
	vim.fn.stdpath = function(name)
		local nvim_config_path = os.getenv("NVIM_CONFIG_PATH")
		if name == "config" and nvim_config_path ~= nil then
			return nvim_config_path
		else
			return orig_stdpath(name)
		end
	end
end

require("jackocoolio")

vim.g.mapleader = " "

require("lazy").setup("plugins", {
	install = {
		colorscheme = { "catppuccin" },
	},
	checker = {
		enabled = true,
		notify = true,
		frequency = 60,
	},
})
