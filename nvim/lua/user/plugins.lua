-- Automatically install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {

  'nvim-lua/plenary.nvim', -- required for treesitter
  'nvim-lua/popup.nvim',
  -- 'fatih/vim-go',
  'mbbill/undotree',
  'nvim-telescope/telescope.nvim',
  {
    'nvim-lualine/lualine.nvim',
    dependencies =
    {
      {
        'kyazdani42/nvim-web-devicons',
        opt = true
      }
    }
  },

  'akinsho/toggleterm.nvim',
  'nvim-treesitter/nvim-treesitter',
  'tpope/vim-commentary',
  {
    "rmagatti/goto-preview",
    dependencies = { "rmagatti/logger.nvim" },
    event = "BufEnter",
    config = true,
  },
  { "L3MON4D3/LuaSnip", dependencies = { "rafamadriz/friendly-snippets" } },

  -- LSP
  'neovim/nvim-lspconfig',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'hrsh7th/cmp-nvim-lsp-signature-help',
  'nvimtools/none-ls.nvim',

  -- Git
  'lewis6991/gitsigns.nvim',

  -- Visuals
  'akinsho/bufferline.nvim',
  'kyazdani42/nvim-tree.lua',
  'hedyhli/outline.nvim',
  'kyazdani42/nvim-web-devicons',

  -- Navigation
  'ggandor/leap.nvim', -- Completion

  -- Get more at https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
  'hrsh7th/nvim-cmp', -- Completion sources.
  -- To have new cmp sources, add them in cmp.lua
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-nvim-lua',
  'hrsh7th/cmp-path',
  'saadparwaiz1/cmp_luasnip',

  -- Theme
  'tanvirtin/monokai.nvim'
}

local opts = {}
require("lazy").setup(plugins, opts)
