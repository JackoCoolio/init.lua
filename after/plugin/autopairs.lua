local esc = function(cmd)
    return vim.api.nvim_replace_termcodes(cmd, true, false, true)
end

local npairs = require("nvim-autopairs")

npairs.setup({
    map_bs = true,
    map_cr = false,
    disable_filetype = { "TelescopePrompt", "vim" },
})

vim.keymap.set("i", "<cr>", function()
    if vim.fn.pumvisible() ~= 0 then -- pum is visible
        if vim.fn.complete_info({ "selected" }).selected ~= -1 then
            return esc("<C-y>")
        else
            return esc("<C-e>") .. npairs.autopairs_cr()
        end
    else
        return npairs.autopairs_cr()
    end
end, { expr = true, noremap = true })

-- this doesn't seem necessary
-- vim.keymap.set("i", "<esc>", function()
--     if vim.fn.pumvisible() ~= 0 then
--         return esc("<C-e><esc>")
--     else
--         return esc("<esc>")
--     end
-- end, { expr = true, noremap = true })

-- if popup menu is visible, tab selects the next item, otherwise just insert

-- tab
vim.keymap.set("i", "<tab>", function()
    if vim.fn.pumvisible() ~= 0 then
        return esc("<c-n>")
    else
        return esc("<tab>")
    end
end, { expr = true, noremap = true })

--  vim.keymap.set("i", "<bs>", function()
--      if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ "mode" }).mode == "eval" then
--          return npairs.esc("<C-e>") .. npairs.autopairs_bs()
--      else
--          return npairs.autopairs_bs()
--      end
--  end, { expr = true, noremap = true })
