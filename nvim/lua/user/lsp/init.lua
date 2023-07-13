local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then return end

require("mason").setup {
    PATH = "prepend",
    ui = {icons = {package_installed = "✓"}}
}
require("mason-lspconfig").setup {
    ensure_installed = {"lua_ls", "ruff_lsp", "pyright"}
}

require("user.lsp.handlers").setup()

local opts = {noremap = true, silent = true}
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

require("user.lsp.servers-setup")
