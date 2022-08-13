-- Move these to a diferent file?
require('lualine').setup {
  options = {
    theme = 'horizon'
  }
}
require("nvim-tree").setup()
-- Configs
require('user.options')
require('user.plugins')
require('user.keymaps')
require('user.cmp')
require('user.colourscheme')
require('user.lsp')
