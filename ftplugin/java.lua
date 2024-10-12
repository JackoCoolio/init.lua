-- assumes that jdtls has been install with :Mason
local jdtls_bin = vim.fn.stdpath("data") .. "/mason/bin/jdtls"

-- only start if jdtls is installed
if vim.fn.filereadable(jdtls_bin) == 0 then
	print("jdtls: not installed")
	return
end

local config = {
	cmd = {
		jdtls_bin,
	},
	root_dir = vim.fs.dirname(vim.fs.find({ ".gradlew", ".git", "mvnw" }, { upward = true })[1]),
}

require("jdtls").start_or_attach(config)
