local trouble = require("trouble")

trouble.setup {
    multiline = true,
    auto_open = false,
    auto_close = false,
    mode = "workspace_diagnostics",
}

vim.keymap.set("n", "<leader>od", function()
    trouble.toggle()
end)
