local util = require("jackocoolio.util")

vim.keymap.set("n", "<leader>gs", function()
    if util.is_git() then
        vim.cmd.Git()
    else
        print("error: not in git repository")
    end
end)
