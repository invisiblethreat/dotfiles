set nocompatible
filetype off

filetype plugin indent on

"Bundle config items
let g:airline_powerline_fonts = 1
let g:airline_theme='molokai'
let g:airline#extensions#tabline#enabled = 1
let g:gundo_width = 60
let g:gundo_preview_height = 40
let g:gundo_right = 1

set termguicolors
colorscheme monokai_pro
"let g:lightline = { 'colorscheme': 'monokai_pro' }

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
set hidden
set number
set hlsearch
set foldmethod=indent
set foldlevelstart=20
set backspace=2
set showmatch
set history=1000
set undolevels=1000
set title
set history=1000
set undolevels=1000
set list
set enc=utf8
set listchars=tab:\ \ ,trail:•,extends:#,nbsp:#,extends:▶,precedes:◀
filetype on

" No shift key needed in normal mode
nnoremap ; :

" Tabs
set tabstop=2
set shiftwidth=2
set expandtab

" Bottom status line
set showtabline=2
set laststatus=2

let mapleader="'"

" Edit and reload config
nmap <leader>e :e $MYVIMRC<CR>
nmap <leader>r :so $MYVIMRC<CR> :echo "Reloaded Config"<CR>

" NERDTree
nmap <leader>d :NERDTreeToggle<CR>
" Tab functions
set tabpagemax=10
nmap <leader>c :tabnew<cr>
nmap <leader>n :tabnext<cr>
nmap <leader>p :tabprev<cr>
nmap <leader>k :tabclose<cr>

" Access tags and buffers quickly
nmap <leader>f <C-]>
nmap <leader>b <C-o>
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

" This rewires n and N to do the highlighing...
nnoremap <silent> n   n:call HLNext(0.4)<cr>
nnoremap <silent> N   N:call HLNext(0.4)<cr>

function! HLNext (blinktime)
    highlight WhiteOnRed ctermfg=white ctermbg=red
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    let target_pat = '\c\%#\%('.@/.'\)'
    let ring = matchadd('WhiteOnRed', target_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    call matchdelete(ring)
    redraw
endfunction

highlight ColorColumn ctermbg=red
call matchadd('ColorColumn', '\%81v', 100)

" Visual dragging of highlighted blocks. Superior to v+y+p
try
  source ~/.vim/dragvisuals.vim
  vmap  <expr>  <S-LEFT>   DVB_Drag('left')
  vmap  <expr>  <S-RIGHT>  DVB_Drag('right')
  vmap  <expr>  <S-DOWN>   DVB_Drag('down')
  vmap  <expr>  <S-UP>     DVB_Drag('up')
  vmap  <expr>  D          DVB_Duplicate()
catch
  " Ignore missing file
endtry
