local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

local function nav(i)
    return function()
        local idx = mark.get_index_of(i)
        if not mark.valid_index(idx) then
            print("harpoon: no mark with id " .. i)
        else
            ui.nav_file(i)
            local file = vim.fn.expand("%")
            print("harpoon: navigated to file '" .. file .. "'")
        end
    end
end

local opts = {
    noremap = true,
    silent = true,
}

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>m", ui.toggle_quick_menu)
vim.keymap.set("n", "<leader>h", nav(1), opts)
vim.keymap.set("n", "<leader>j", nav(2), opts)
vim.keymap.set("n", "<leader>k", nav(3), opts)
vim.keymap.set("n", "<leader>l", nav(4), opts)
