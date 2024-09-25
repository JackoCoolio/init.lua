-- vim.opt.guicursor = ""

local space = "·"
vim.opt.listchars = {
    tab = " ",
    lead = space,
    trail = space,
    nbsp = space,
}

vim.opt.list = true

vim.cmd([[match TrailingWhitespace /\s\+$/]])

local set_trailing_whitespace_level = function(level)
    vim.api.nvim_set_hl(0, "TrailingWhitespace", { link = level })
end

set_trailing_whitespace_level("Error")

vim.api.nvim_create_autocmd("InsertEnter", {
    callback = function()
        vim.opt.listchars.trail = nil
        set_trailing_whitespace_level("Whitespace")
    end
})

vim.api.nvim_create_autocmd("InsertLeave", {
    callback = function()
        vim.opt.listchars.trail = space
        set_trailing_whitespace_level("Error")
    end
})

vim.opt.cursorline = true

vim.opt.mouse = ""

vim.opt.showmode = false

vim.opt.cmdheight = 2

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.fillchars = "diff:󰿟"

vim.o.smartcase = true
vim.o.ignorecase = true

vim.api.nvim_create_autocmd({ "BufEnter", "BufNewFile" }, {
    pattern = "*.roc",
    callback = function()
        vim.bo.filetype = "roc"
    end,
})
