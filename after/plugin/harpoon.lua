local harpoon = require("harpoon")

-- set up harpoon autocmds
harpoon:setup()

local opts = {
    noremap = true,
    silent = true,
}

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>m", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<leader>h", function() harpoon:list():select(1) end, opts)
vim.keymap.set("n", "<leader>j", function() harpoon:list():select(2) end, opts)
vim.keymap.set("n", "<leader>k", function() harpoon:list():select(3) end, opts)
vim.keymap.set("n", "<leader>l", function() harpoon:list():select(4) end, opts)
