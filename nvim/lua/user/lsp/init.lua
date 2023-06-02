local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then return end

require("mason").setup {ui = {icons = {package_installed = "✓"}}}

require("mason-lspconfig").setup {
    ensure_installed = {"lua_ls", "ruff_lsp", "pyright", "luacheck", "pylint","markdownlint", "ruff", "luaformatter"}
    





}
-- ✓ jq
 -- 13                                      ✓ lua-language-server lua_ls
 -- 14 async def worker(wid, queue):        ✓ luacheck
 -- 15     while True:                      ✓ luaformatter
 -- 16         target = await queue.get(    ✓ markdownlint
 -- 17         log.info(f"{wid} checking    ✓ pylint
 -- 18         async with httpx.AsyncCli    ✓ pyright
 -- 19             try:                     ✓ ruff
 -- 20                 r = await client.    ✓ ruff-lsp ruff_lsp

require("user.lsp.handlers").setup()


local opts = {noremap = true, silent = true}
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

require("user.lsp.servers-setup")

