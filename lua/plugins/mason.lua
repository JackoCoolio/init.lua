return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },

    cmd = { "LspInstall", "LspUninstall", "Mason" },

    enabled = function()
        -- disable Mason in Nix
        if vim.fn.executable("nix-shell") then
            return false
        end

        return true
    end,

    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup()
    end,
}
