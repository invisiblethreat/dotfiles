filetype off

filetype plugin indent on

"Bundle config items
let g:airline_powerline_fonts = 1
let g:airline_theme='molokai'
let g:airline#extensions#tabline#enabled = 1
let g:gundo_width = 60
let g:gundo_preview_height = 40
let g:gundo_right = 1


call plug#begin('~/.vim/plugged')
Plug 'https://github.com/ervandew/supertab.git'
Plug 'https://github.com/fatih/vim-go.git'
Plug 'https://github.com/junegunn/vim-easy-align'
Plug 'https://github.com/jvirtanen/vim-hcl.git'
Plug 'https://github.com/majutsushi/tagbar.git'
Plug 'https://github.com/neovim/nvim-lspconfig'
Plug 'https://github.com/nvim-lua/plenary.nvim'
Plug 'https://github.com/nvim-telescope/telescope.nvim'
Plug 'https://github.com/nvim-treesitter/nvim-treesitter'
Plug 'https://github.com/phanviet/vim-monokai-pro'
Plug 'https://github.com/preservim/nerdtree.git'
Plug 'https://github.com/sheerun/vim-polyglot'
Plug 'https://github.com/sirver/ultisnips.git'
Plug 'https://github.com/sjl/gundo.vim.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/tpope/vim-git.git'
Plug 'https://github.com/vim-airline/vim-airline-themes.git'
Plug 'https://github.com/vim-airline/vim-airline.git'
call plug#end()

set termguicolors
colorscheme monokai_pro
let g:lightline = { 'colorscheme': 'monokai_pro' }

nmap <F5> :syntax sync fromstart<CR>
nnoremap <F6> :GundoToggle<CR>
nmap <F7> :TagbarToggle<CR>
nnoremap <F8> :set nu!<CR>

" Keep going up until you find a tags file
set tags=tags;/

" Fallback statusline
set statusline=%F%m%r%h%w\ [Position=%04l,%04v][%p%%]\ [Lines=%L]

set t_Co=256
syntax enable

" General prefs
filetype on
set backspace=2
set enc=utf8
set foldlevelstart=20
set foldmethod=indent
set guicursor=
set hidden
set history=1000
set history=1000
set hlsearch
set list
set listchars=tab:\ \ ,trail:•,extends:#,nbsp:#,extends:▶,precedes:◀
set nobackup
set nocompatible
set noswapfile
set number
set scrolloff=16
set showmatch
set title
set undolevels=1000
set undolevels=1000

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

" Edit and reload config
nmap <leader>e :e $MYVIMRC<CR> :echo ".vimrc opened for editing"<CR>
nmap <leader>r :so $MYVIMRC<CR> :echo "Reloaded Config"<CR>

" NERDTree
nmap <leader>d :NERDTreeToggle<CR>

" Think of tabs as views/layouts. Buffers will set you free
"" Access tags and buffers quickly
nmap <leader>f <C-]>
nmap <leader>b <C-o>

" Remap a few keys to be more sane.
inoremap jk <ESC>
nnoremap ; :
nnoremap ;; :x<CR>
nnoremap ;' :q!<CR>

" Remove trailing spaces quickly
nmap <leader><space> :%s/\s\+$//<cr>

" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
map <C-S> :update<CR>

"show the highlighting tag stack under the cursor
nmap hr :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Thanks for flying Vim can DIAF
let &titleold=getcwd()

" Colours for modes
"hi statusline ctermfg=15 ctermbg=27 cterm=none
au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline ctermfg=15 ctermbg=27 cterm=none

au BufReadPost * call CheckRo()
au BufWritePost * call Chmod_bin()
au BufWritePre * %s/\s\+$//e

" enable project speficific vimrc
set exrc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline ctermfg=15 ctermbg=28 cterm=bold
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CheckRo()
  if &readonly
    hi statusline cterm=none ctermfg=0 ctermbg=178
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Chmod_bin()
  if getline(1) =~ "^#!"
    if getline(1) =~ "/bin/"
      silent !chmod 700 <afile>
    endif
  endif
endfunction

" telescope
nnoremap <leader>ff <cmd>lua require ('telescope.builtin').find_files({no_ignore = true})<cr>
lua << EOF
require'lspconfig'.pyright.setup{}
require'lspconfig'.gopls.setup{}
EOF
