vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- move visual lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor in same spot when pressing J
vim.keymap.set("n", "J", "mzJ`z")

-- keep cursor centered while moving up and down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keep cursor centered when jumping in search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- delete to void register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- bad times ahead if press Q
vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- format document
vim.keymap.set("n", "<leader>fd", function()
    vim.lsp.buf.formatting_sync()
    print("info: formatted current buffer")
end)

-- replace all occurrences of current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- source and run PackerSync when writing to packer.lua
vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("PackerSyncOnSave", { clear = true }),
    pattern = "packer.lua",
    callback = function()
        local filename = vim.fn.expand("%")
        vim.cmd("source " .. filename)
        vim.cmd("PackerSync")
    end
})

vim.api.nvim_create_autocmd("BufWritePre", {
    group = vim.api.nvim_create_augroup("RustFmtOnSave", { clear = true }),
    pattern = "*.rs",
    callback = function()
        vim.lsp.buf.formatting_sync()
    end
})

-- setup LSP maps
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local filetype = vim.filetype.match { buf = args.buf }

        local bufopts = { noremap = true, silent = true, buffer = args.buf }

        if filetype == "rust" then
            local rusttools = require("rust-tools")
            vim.keymap.set("n", "K", rusttools.hover_actions.hover_actions, bufopts)
        else
            vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
        end

        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
        vim.keymap.set("n", "<C-s>", vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
    end,
})
