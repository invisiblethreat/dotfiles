set runtimepath^=~/.vim runtimepath+=~/.config/nvim/after
let &packpath=&runtimepath

filetype plugin indent on

" Keep this file from growing wildlly out of control
" source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/functions.vim

" Localized configurations that don't need source control. Localized plugins
" are loaded via plugins.vim
if filereadable($HOME."/.config/nvim/local.vim")
  source $HOME/.config/nvim/local.vim
endif

let g:airline_powerline_fonts = 1
let g:airline_theme='molokai'
" tabline is really the list of buffers. See also: buffers, tabs, windows...
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ': t'

let g:gundo_width = 80
let g:gundo_preview_height = 60
let g:gundo_right = 0



set t_Co=256
syntax enable

set foldlevelstart=20
set enc=utf8
set listchars=tab:\ \ ,trail:•,extends:#,nbsp:#,extends:▶,precedes:◀

highlight ColorColumn ctermbg=0 guibg=darkgrey

" Bottom status line
set showtabline=2
set laststatus=2


" To open a new empty buffer- mimic tmux mapping
nmap <leader>c :enew<cr>

" Move to the next buffer using Vim motion
nmap <leader>l :bnext<CR>

" Move to the previous buffer using Vim motion
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>x :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" Quickly yank to system keyboard
xnoremap <leader>y "+y

" Yank to the end of the line, the same as D meaning d$
nnoremap Y y$

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
require("nvim-tree").setup()
require('user.options')
require('user.plugins')
require('user.keymaps')
require('user.cmp')
require('user.colourscheme')
require('user.lsp')
EOF

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

inoremap <C-j> <ESC>:m .+1<CR>==i
inoremap <C-k> <ESC>:m .-2<CR>==i
