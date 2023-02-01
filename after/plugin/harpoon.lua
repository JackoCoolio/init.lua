local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

local function nav(i)
    return function()
        ui.nav_file(i)
    end
end

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu)
vim.keymap.set("n", "<C-h>", nav(1), {})
vim.keymap.set("n", "<C-j>", nav(2), {})
vim.keymap.set("n", "<C-k>", nav(3), {})
vim.keymap.set("n", "<C-l>", nav(4), {})
