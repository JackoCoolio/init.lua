local npairs = require("nvim-autopairs")

npairs.setup({
    map_bs = true,
    map_cr = false,
    disable_filetype = { "TelescopePrompt", "vim" },
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.event:on(
    "confirm_done",
    cmp_autopairs.on_confirm_done()
)

-- this doesn't seem necessary
-- vim.keymap.set("i", "<esc>", function()
--     if vim.fn.pumvisible() ~= 0 then
--         return esc("<C-e><esc>")
--     else
--         return esc("<esc>")
--     end
-- end, { expr = true, noremap = true })

-- if popup menu is visible, tab selects the next item, otherwise just insert

--  vim.keymap.set("i", "<bs>", function()
--      if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ "mode" }).mode == "eval" then
--          return npairs.esc("<C-e>") .. npairs.autopairs_bs()
--      else
--          return npairs.autopairs_bs()
--      end
--  end, { expr = true, noremap = true })
