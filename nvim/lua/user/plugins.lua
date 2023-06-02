local fn = vim.fn
-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git", "clone", "--depth", "1",
        "https://github.com/wbthomason/packer.nvim", install_path
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then return end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float {border = "rounded"}
        end
    }
}

-- Install your plugins here
-- If you suffix repos with .git, you will be prompted for authentication.
return packer.startup(function(use)
    use "wbthomason/packer.nvim" -- Have packer manage itself

    use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use 'fatih/vim-go'
    use 'mbbill/undotree'
    use 'nvim-telescope/telescope.nvim'
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use "akinsho/toggleterm.nvim"
    use 'nvim-treesitter/nvim-treesitter'
    -- use { 'nvim-treesitter/nvim-treesitter', run = ":TSupdate" }
    use 'sbdchd/neoformat'
    use 'sheerun/vim-polyglot'
    use 'tpope/vim-commentary'
    use "moll/vim-bbye"
    use 'rmagatti/goto-preview'

    -- Snippets
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'

    -- LSP
    use 'neovim/nvim-lspconfig'
    -- use "williamboman/nvim-lsp-installer" -- simple to use language server installer
    use "williamboman/mason.nvim" -- simple to use language server installer
    use "williamboman/mason-lspconfig.nvim" -- simple to use language server installer
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'jose-elias-alvarez/null-ls.nvim'

    -- Git
    use 'tpope/vim-fugitive'
    use 'tpope/vim-git'
    use 'lewis6991/gitsigns.nvim'

    -- Visuals
    use "akinsho/bufferline.nvim"
    use 'kyazdani42/nvim-tree.lua'
    use 'simrat39/symbols-outline.nvim'
    use 'kyazdani42/nvim-web-devicons'

    -- Navigation
    use 'ggandor/leap.nvim'

    -- Completion
    use 'hrsh7th/nvim-cmp'
    -- Completion sources.
    -- Get more at https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
    -- To have new cmp sources used, add them in cmp.lua
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-path'
    use 'saadparwaiz1/cmp_luasnip'

    -- Themes
    use 'tanvirtin/monokai.nvim'
    use 'phanviet/vim-monokai-pro'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then require("packer").sync() end
end)
