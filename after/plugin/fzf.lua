local fzf = require("fzf-lua")

vim.keymap.set("n", "<leader>f?", function()
    fzf.builtin()
end)

vim.keymap.set("n", "<leader>ff", function()
    fzf.files()
end)

vim.keymap.set("n", "<leader>fb", function()
    fzf.buffers()
end)

vim.keymap.set("n", "<leader>fs", function()
    fzf.live_grep_native()
end)
