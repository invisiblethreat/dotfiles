set runtimepath^=~/.vim runtimepath+=~/.config/nvim/after
let &packpath=&runtimepath

set nocompatible

filetype plugin indent on

" Keep this file from growing wildlly out of control
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/functions.vim

" Anything environment specific should go here. This won't exist on a first
" run, but that's OK.
if filereadable($HOME."/.nvim_local/local.vim")
  source $HOME/.nvim_local/local.vim
endif

" Make the directory if it doesn't exist.
if !isdirectory($HOME."/.nvim_local")
  call mkdir($HOME."/.nvim_local")
endif

" Make the directory if it doesn't exist.
if !isdirectory($HOME."/.nvim_local/undo")
  call mkdir($HOME."/.nvim_local/undo")
endif

set undodir=~/.nvim_local/undo
set undofile
set undolevels=1000

" Edit and reload config
nmap <leader>e :e $MYVIMRC<CR> :echo ".vimrc opened for editing"<CR>
nmap <leader>r :so %<CR> :echo "Reloaded Config"<CR>

let g:airline_powerline_fonts = 1
let g:airline_theme='molokai'
let g:airline#extensions#tabline#enabled = 1

let g:gundo_width = 80
let g:gundo_preview_height = 60
let g:gundo_right = 0

set termguicolors
colorscheme monokai_pro
let g:lightline = { 'colorscheme': 'monokai_pro' }

nmap <F5> :syntax sync fromstart<CR>
nmap <F6> :UndotreeToggle<CR>
nnoremap <F7> :set nowrap!<CR>

"Hybrid line number. Relative offsets, absolue curosor line
set number relativenumber
nnoremap <F8> :set nu! rnu!<CR>

" Fallback statusline
set statusline=%F%m%r%h%w\ [Position=%04l,%04v][%p%%]\ [Lines=%L]

set t_Co=256
syntax enable

" General prefs
set backspace=2
set foldmethod=indent
set foldlevelstart=20
set enc=utf8
set guicursor=
set hidden
set history=1000
set history=1000
set list
set listchars=tab:\ \ ,trail:•,extends:#,nbsp:#,extends:▶,precedes:◀
set hlsearch
set nobackup
set noswapfile
set scrolloff=16
set showmatch
set title
set incsearch
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=darkgrey

" No shift key needed in normal mode
nnoremap ; :

" Tabs
set tabstop=2
set shiftwidth=2
set expandtab

" Bottom status line
set showtabline=2
set laststatus=2

" Space is a great leader
let mapleader=" "


" NERDTree
nmap <leader>d :NERDTreeToggle<CR>

" Think of tabs as views/layouts. Buffers will set you free
"" Access tags and buffers quickly
nmap <leader>f <C-]>
nmap <leader>b <C-o>

" Quickly yank to system keyboard
xnoremap <leader>y "+y

" Remap a few keys to be more sane.
inoremap jk <ESC>
nnoremap ; :
nnoremap ;; :x<CR>
nnoremap ;' :q!<CR>
nnoremap ;l :w<CR>

" Yank to the end of the line, the same as D meaning d$
nnoremap Y y$

" Remove trailing spaces quickly
nmap <leader><space> :%s/\s\+$//<cr>

" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
map <C-S> :update<CR>

" Death to trailing spaces
au BufWritePre * :%s/\s\+$//e

" Make scripts executable if they have a shebang
au BufWritePost * call Chmod_bin()

" enable project speficific vimrc
set exrc

" telescope
nnoremap <leader>ff <cmd>lua require ('telescope.builtin').find_files({no_ignore = true})<cr>
lua << EOF
require'lspconfig'.pyright.setup{}
require'lspconfig'.gopls.setup{}
EOF


set completeopt=menu,menuone,noselect
lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        -- For `vsnip` user.
        vim.fn["vsnip#anonymous"](args.body)

        -- For `luasnip` user.
        -- require('luasnip').lsp_expand(args.body)

        -- For `ultisnips` user.
        -- vim.fn["UltiSnips#Anon"](args.body)
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
      { name = 'nvim_lsp' },

      -- For vsnip user.
      { name = 'vsnip' },

      -- For luasnip user.
      -- { name = 'luasnip' },

      -- For ultisnips user.
      -- { name = 'ultisnips' },

      { name = 'buffer' },
    }
  })

  -- Setup lspconfig.
  require('lspconfig').gopls.setup {
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  }
  require('lspconfig').pyright.setup {
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  }
EOF

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

inoremap <C-j> <ESC>:m .+1<CR>==i
inoremap <C-k> <ESC>:m .-2<CR>==i

