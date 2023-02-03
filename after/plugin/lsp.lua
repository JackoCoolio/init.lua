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

local on_attach = function(client, bufnr)
    lsp_status.on_attach(client)

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

vim.g.coq_settings = {
    display = {
        ghost_text = {
            context = { " => ", "" }
        }
    },
    clients = {
        snippets = {
            -- i don't like snippets
            enabled = false,
        },
        lsp = {
            -- lsp is best, show that first
            weight_adjust = 10,
        },
        third_party = {
            weight_adjust = 15,
        }
    },
    completion = {
        skip_after = { "{", "}", "[", "]" }
    },
    keymap = {
        recommended = false,
        manual_complete = "<C-space>",

        -- coq documentation says unset variables (value nil) have default values
        -- it also says that to unbind, you should set the value to "null",
        -- which doesn't exist in Lua. nil won't work because that's the same as
        -- unset. "" seems to work though.
        jump_to_mark = "",
        eval_snips = "",
        bigger_preview = "<c-p>",
    }
}

require("coq_3p") {
    -- for this to work, $NVIM_HOME needs to be set
    { src = "nvimlua", short_name = "nlua" },
    {
        src = "repl",
        sh = "zsh",
        shell = { n = "node" },
        max_lines = 99,
        deadline = 500,
        unsafe = { "rm", "poweroff", "mv", "sudo" },
    }
}

local coq = require("coq")

local servers = {
    alex = {},
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
}

local util = require("jackocoolio.util")

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

        config = coq.lsp_ensure_capabilities(vim.tbl_deep_extend("error", {
            on_attach = on_attach,
            flags = lsp_flags,
        }, config))

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
    },
}

require("rust-tools").setup(rust_tools_opts)

-- for some reason, coq_settings.auto_start is ignored, so I have to do this
vim.cmd("COQnow --shut-up")
vim.cmd("COQnow --shut-up")
