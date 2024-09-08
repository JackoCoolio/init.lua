    -- { 'jackocoolio/nvim-lspconfig', branch = "feat/roc_language_server" },
    -- { "hrsh7th/cmp-nvim-lsp" },
    -- { "hrsh7th/cmp-nvim-lua" },
    -- { "hrsh7th/cmp-nvim-lsp-signature-help" },
    -- { "hrsh7th/cmp-buffer" },
    -- { "hrsh7th/cmp-path" },
    -- { "hrsh7th/cmp-cmdline" },
    -- { "hrsh7th/nvim-cmp" },
    -- { 'L3MON4D3/LuaSnip' },
    -- -- { "williamboman/mason.nvim" },
    -- -- { "williamboman/mason-lspconfig.nvim" },
    -- -- { "mfussenegger/nvim-jdtls" },

    -- { "nvim-lua/lsp-status.nvim" },

    -- -- { "kevinhwang91/nvim-ufo", dependencies = { "kevinhwang91/promise-async" } },
    -- -- { "SmiteshP/nvim-navic", dependencies = { "neovim/nvim-lspconfig" } },
    -- -- { "nvim-neorg/neorg", build = ":Neorg sync-parsers" },
    --

local lua_runtime_path = vim.split(package.path, ";")
table.insert(lua_runtime_path, "lua/?.lua")
table.insert(lua_runtime_path, "lua/?/init.lua")

local servers = {
    prismals = {},
    cssls = {},
    vtsls = {},
    pyright = {},
    jsonls = {
        filetypes = { "json", "jsonc" },
        settings = {
            json = {
                schemas = {
                    {
                        filematch = { "package.json" },
                        url = "https://json.schemastore.org/package.json",
                    },
                    {
                        filematch = { "tsconfig*.json" },
                        url = "https://json.schemastore.org/tsconfig.json",
                    },
                    {
                        filematch = {
                            ".prettierrc",
                            ".prettierrc.json",
                            "prettier.config.json",
                        },
                        url = "https://json.schemastore.org/prettierrc.json",
                    },
                }
            }
        }
    },
    ccls = {},
    hls = {},
    gopls = {},
    lua_ls = {
        settings = {
            Lua = {
                runtime = {
                    version = "LuaJIT",
                    path = lua_runtime_path,
                },
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                    checkThirdParty = false,
                },
                telemetry = {
                    enable = true,
                }
            }
        }
    },
    html = {},
    zls = {},
    nil_ls = {},
    gleam = {},
}

local on_attach = function(client)
    require("lsp-status").on_attach(client)
end

return {
    "neovim/nvim-lspconfig",

    config = function()
        local lsp_flags = {
            debounce_text_changes = 150,
        }

        local lsp = require("lspconfig")

        local common_capabilities = {}
        common_capabilities = vim.tbl_deep_extend("keep", common_capabilities, require("lsp-status").capabilities)
        common_capabilities = vim.tbl_deep_extend("keep", common_capabilities, require("cmp_nvim_lsp").default_capabilities())

        for server, server_config in pairs(servers) do
            local server_disabled = (server_config.disabled ~= nil and server_config.disabled) or false

            if server_disabled then
                goto continue
            end

            local config = server_config or {}

            config.capabilities = vim.tbl_deep_extend("keep", server_config.capabilities or {}, common_capabilities)
            config.on_attach = on_attach
            config.flags = lsp_flags

            lsp[server].setup(config)

            ::continue::
        end
    end,
}
