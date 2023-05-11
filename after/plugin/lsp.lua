local opts = {
    noremap = true,
    silent = true,
}

vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<leader>dN", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
vim.keymap.set("n", "<leader>Q", vim.diagnostic.reset, opts)

local lsp_status = require("lsp-status")

lsp_status.config {
    select_symbol = function(cursor_pos, symbol)
        if symbol.valueRange then
            local value_range = {
                ["start"] = {
                    character = 0,
                    line = vim.fn.byte2line(symbol.valueRange[1])
                },
                ["end"] = {
                    character = 0,
                    line = vim.fn.byte2line(symbol.valueRange[2])
                }
            }

            return require("lsp-status.util").in_range(cursor_pos, value_range)
        end
    end
}

lsp_status.register_progress()

local navic = require("nvim-navic")

local on_attach = function(client, bufnr)
    lsp_status.on_attach(client)

    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end

    if client.server_capabilities.documentationHighlightProvider then
        vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
        vim.api.nvim_clear_autocmds { buffer = bufnr, group = "lsp_document_highlight" }
        vim.api.nvim_create_autocmd("CursorHold", {
            callback = vim.lsp.buf.document_highlight,
            buffer = bufnr,
            group = "lsp_document_highlight",
            desc = "Document Highlight",
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
            callback = vim.lsp.buf.clear_references,
            buffer = bufnr,
            group = "lsp_document_highlight",
            desc = "Clear all the references",
        })
    end
end

local lsp_flags = {
    debounce_text_changes = 150,
}

-- mason
require("mason").setup()
require("mason-lspconfig").setup()

local lsp = require("lspconfig")

local cmp = require("cmp")

cmp.setup {
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert {
        ["<c-space>"] = cmp.mapping.complete(),
        ["<c-e>"] = cmp.mapping.abort(),
        ["<cr>"] = cmp.mapping.confirm { select = false },
        ["<tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<s-tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end)
    },
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help" },
        { name = "nvim_lua" },
        -- { name = "luasnip" },
    }, {
        { name = "buffer", keyword_length = 3 },
        { name = "path" },
    })
}

local lua_runtime_path = vim.split(package.path, ";")
table.insert(lua_runtime_path, "lua/?.lua")
table.insert(lua_runtime_path, "lua/?/init.lua")

local servers = {
    prismals = {},
    cssls = {},
    tsserver = {},
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
    hls = {},
    gopls = {},
    sumneko_lua = {
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
    clangd = {},
    zls = {},
}

local util = require("jackocoolio.util")

local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()

-- start server config log
local file, err = io.open("/home/jtwam/.cache/nvim-lsp.log", "w+")
if err ~= nil or file == nil then
    print("error: couldn't log")
end
io.output(file)
for server, server_config in pairs(servers) do
    local server_disabled = (server_config.disabled ~= nil and server_config.disabled) or false

    if not server_disabled then
        local config = server_config or {}

        config.capabilities = vim.tbl_deep_extend("force", server_config.capabilities or {}, lsp_status.capabilities)

        config.capabilities = vim.tbl_deep_extend("keep", cmp_capabilities, config.capabilities)

        config = vim.tbl_deep_extend("error", {
            on_attach = on_attach,
            flags = lsp_flags,
        }, config)

        io.write("server config for '" .. server .. "': " .. util.dump(config) .. "\n\n")

        lsp[server].setup(config)
    end
end
io.close(file)

local rust_tools_opts = {
    tools = {
        runnables = {
            use_telescope = true,
        },
        inlay_hints = {
            auto = true,
            show_parameter_hints = true,
            parameter_hints_prefix = "",
            other_hints_prefix = "⟹ ",
        },
    },
    server = {
        on_attach = on_attach,
        settings = {
            ["rust-analyzer"] = {
                checkOnSave = {
                    command = "clippy",
                },
            },
        },
        capabilities = cmp_capabilities,
    },
}

require("rust-tools").setup(rust_tools_opts)
