local configs = require("nvim-treesitter.configs")
configs.setup {
  -- List of supported languages is at https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
  ensure_installed = {
    "python", "c", "bash", "go", "dockerfile", "json", "lua", "markdown",
    "sql", "yaml"
  },
  auto_install = true,
  sync_install = false,
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,         -- false will disable the whole extension
    additional_vim_regex_highlighting = true

  },
  indent = { enable = true, disable = { "yaml" } }
}

-- Define a custom highlight group for Python comments
-- https://neovim.io/doc/user/api.html#nvim_set_hl()

vim.api.nvim_set_hl(0, 'CustomLuaComment', { fg = '#3399ff', italic = true })
vim.api.nvim_set_hl(0, '@lsp.type.comment.lua', { link = 'CustomLuaComment' })

vim.api.nvim_set_hl(0, 'CustomPythonComment', { fg = '#3399ff', italic = true })
vim.api.nvim_set_hl(0, '@comment.python', { link = 'CustomPythonComment' })
