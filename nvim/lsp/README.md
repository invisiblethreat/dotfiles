If we want custom LSP configs that aren't in `nvim-lspconfig`, this is where we
return the configuration table rather than relying on the community config.

The stub of the LSP config, such as `foo.lua`, will need to be called with 
`vim.lsp.enable("foo")`.
