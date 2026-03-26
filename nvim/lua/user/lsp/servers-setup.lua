-- none-ls: external formatters and linters not provided by LSP servers
local null_ls = require("null-ls")

local sources = {
	null_ls.builtins.diagnostics.ansiblelint,
	null_ls.builtins.formatting.black,
	null_ls.builtins.formatting.isort,
	null_ls.builtins.formatting.markdownlint,
	null_ls.builtins.formatting.stylua,
	null_ls.builtins.formatting.prettier.with({ extra_filetypes = { "toml" } }),
}

null_ls.setup({ sources = sources, debug = true })
