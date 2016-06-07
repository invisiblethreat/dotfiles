set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required
Plugin 'gmarik/vundle'

"Github repos
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sjl/gundo.vim'
Plugin 'ervandew/supertab'
Plugin 'sirver/ultisnips'
Plugin 'tenable/vim-nasl'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'majutsushi/tagbar'
Plugin 'altercation/vim-colors-solarized'
Plugin 'invisiblethreat/vim-color-automaton'
Plugin 'klen/python-mode'
Plugin 'guns/xterm-color-table.vim'

filetype plugin indent on

"Bundle config items
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
let g:airline#extensions#tabline#enabled = 1
let g:gundo_width = 60
let g:gundo_preview_height = 40
let g:gundo_right = 1

" UltiSnips commands
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

nmap <F5> :syntax sync fromstart<CR>
nnoremap <F6> :GundoToggle<CR>
nmap <F7> :TagbarToggle<CR>

" ctags
let g:tagbar_type_nasl = {
      \ 'ctagstype' : 'nasl',
      \ 'kinds'     : [
      \ 'f:function',
      \ 'u:public function',
      \ 'r:private function',
      \ 'v:variables',
      \ 'n:namespace',
      \ 'g:globals',
      \ 'o:objects',
      \ ]
      \               }
" keep going up until you find a tags file
set tags=tags;/

"fallback statusline
set statusline=%F%m%r%h%w\ [Position=%04l,%04v][%p%%]\ [Lines=%L]
set t_Co=256
"colo custom
syntax enable
"set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized
colorscheme automaton
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
set listchars=tab:>.,trail:•,extends:#,nbsp:#
filetype on
nnoremap ; :

" Tabs
set tabstop=2
set shiftwidth=2
set expandtab

" Bottom status line
set showtabline=2
set laststatus=2

let mapleader=","
nmap <leader>ec :e $MYVIMRC<CR>
nmap <leader>rc :so $MYVIMRC<CR> :echo "Reloaded Config"<CR>
set tabpagemax=10
nmap <leader>c :tabnew<cr>
nmap <leader>n :tabnext<cr>
nmap <leader>p :tabprev<cr>
nmap <leader>k :tabclose<cr>

nmap <leader>f <C-]>
nmap <leader>b <C-o>

nnoremap <leader>d "=strftime("%Y/%m/%d")"<CR>P

au FileType make setlocal noexpandtab

" NASL prefs
au BufNewFile,BufRead *.nasl set filetype=nasl
au BufNewFile,BufRead *.inc set filetype=nasl
au BufNewFile,BufRead *.inc set indentexpr=
au FileType nasl setlocal shiftwidth=2 tabstop=2 expandtab softtabstop=2 
au FileType nasl setlocal spell
au FileType nasl setlocal spelllang=en_us
au FileType nasl setlocal spellcapcheck=""
nnoremap <leader>d "=strftime("%Y/%m/%d")"<CR>P
" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
map <C-S> :update<CR>

"show the highlighting tag stack under the cursor
nmap hr :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Thanks for flying Vim can DIAF
let &titleold=getcwd()

vmap mt y :call MakeTiny('<C-r>"')<CR>

" Colours for modes
"hi statusline ctermfg=15 ctermbg=27 cterm=none
au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline ctermfg=15 ctermbg=27 cterm=none

au BufReadPost * call CheckRo()
au BufWritePost * call Chmod_bin()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! MakeTiny(url)
  let result = system("mktiny " . a:url)
  let result = substitute(result, '[^a-zA-Z0-9:/.?]', '', 'g')
  call setline(line('.'), substitute(getline('.'), a:url, result, 'g'))
endfunction
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
