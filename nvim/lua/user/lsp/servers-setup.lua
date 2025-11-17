-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    -- Disable hover in favor of Pyright
    client.server_capabilities.hoverProvider = false
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder,
        bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', function()
        vim.notify("Formatting")
        vim.lsp.buf.format { async = true };
    end, bufopts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp
    .protocol
    .make_client_capabilities())


-- this is none-ls, which is a community maintained version of null-ls
local null_ls_ok, null_ls = pcall(require, "null-ls")
if not null_ls_ok then return end

local sources = {
    null_ls.builtins.formatting.biome,
    null_ls.builtins.formatting.isort,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.markdownlint,
    null_ls.builtins.formatting.nixfmt,
    null_ls.builtins.diagnostics.ansiblelint,
    null_ls.builtins.formatting.prettier.with({ extra_filetypes = { "toml" } }),
}
null_ls.setup({ sources = sources, debug = true, on_attach = on_attach })
