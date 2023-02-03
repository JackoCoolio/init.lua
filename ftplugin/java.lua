-- assumes that jdtls has been install with :Mason
local jdtls_bin = vim.fn.stdpath("data") .. "/mason/bin/jdtls"

local config = {
    cmd = {
        jdtls_bin,
    },
    root_dir = vim.fs.dirname(vim.fs.find({ '.gradlew', '.git', 'mvnw' }, { upward = true })[1]),
    on_attach = function(client, bufnr)
        local bufopts = { noremap = true, silent = true, buffer = bufnr }

        DoLSPMappings(bufopts)
    end
}

require("jdtls").start_or_attach(config)
