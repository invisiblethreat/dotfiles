vim.lsp.config('*', {
	capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

require("mason").setup({
	PATH = "prepend",
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})
require("mason-lspconfig").setup({
	ensure_installed = { "bashls", "lua_ls", "ruff", "pyright", "jsonls" },
	automatic_enable = true,
})

require("user.lsp.handlers").setup()

require("user.lsp.servers-setup")
