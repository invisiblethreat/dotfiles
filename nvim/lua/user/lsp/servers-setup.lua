-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    -- Disable hover in favor of Pyright
    client.server_capabilities.hoverProvider = false
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = {noremap = true, silent = true, buffer = bufnr}
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
        vim.lsp.buf.format {async = true};
    end, bufopts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp
                                                                      .protocol
                                                                      .make_client_capabilities())
-- Configure `ruff-lsp`.
-- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ruff_lsp
-- For the default config, along with instructions on how to customize the settings
require('lspconfig').ruff_lsp.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    init_options = {settings = {args = {}}}
}
-- require"lspconfig".pylsp.setup {
--     on_attach = on_attach,
--     settings = {
--         pylsp = {
--             plugins = {
--                 flake8 = {enabled = false, maxLineLength = 119},
--                 mypy = {enabled = true},
--                 pycodestyle = {enabled = false},
--                 pyflakes = {enabled = false}
--             }
--         }
--     }
-- }

require('lspconfig').gopls.setup {
    capabilities = capabilities,
    on_attach = on_attach
}
require('lspconfig').pyright.setup {
    capabilities = capabilities,
    on_attach = on_attach
}

require('lspconfig').jsonls.setup {
    capabilities = capabilities,
    on_attach = on_attach
}

require('lspconfig').lua_ls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'}
            }
        }
    }
}

local null_ls_ok, null_ls = pcall(require, "null-ls")
if not null_ls_ok then return end

local sources = {
    null_ls.builtins.formatting.isort, null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.lua_format,
    null_ls.builtins.formatting.markdownlint, null_ls.builtins.formatting.jq,
    null_ls.builtins.formatting.beautysh, null_ls.builtins.formatting.nixfmt,
    null_ls.builtins.formatting.prettier.with({extra_filetypes = {"toml"}})
}
null_ls.setup({sources = sources, debug = true, on_attach = on_attach})
