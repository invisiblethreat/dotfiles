set t_Co=256
syntax on
set spell
setlocal spell spelllang=en_us
set spellcapcheck=""
colo custom
set number
set paste
set hlsearch
set foldmethod=indent
set foldlevelstart=20
set backspace=2
"set colorcolumn=80
filetype on
au FileType make setlocal noexpandtab

" NASL prefs
au BufNewFile,BufRead *.nasl set filetype=nasl
au BufNewFile,BufRead *.inc set filetype=nasl
au BufNewFile,BufRead *.inc set indentexpr=
au FileType nasl setlocal shiftwidth=2 tabstop=2 expandtab softtabstop=2 

" Tabular
set tabstop=2
set shiftwidth=2
set expandtab

" Bottom status line
set showtabline=2
set laststatus=2
set statusline=%F%m%r%h%w\ [Position=%04l,%04v][%p%%]\ [Lines=%L]

" Everyone loves tabs
set tabpagemax=10
nmap tc :tabnew<cr>
nmap tn :tabnext<cr>
nmap tp :tabprev<cr>
nmap tk :tabclose<cr>
nmap tx :x<cr>
nmap tq :q!<cr>

nmap cr :so $MYVIMRC<cr> :echo "Reloaded config"<cr>
" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
map <C-S> :update<CR>

"show the highlighting tag stack under the cursor
nmap hr :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Colours for modes
hi statusline ctermfg=15 ctermbg=27 cterm=none
au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline ctermfg=15 ctermbg=27 cterm=none

au BufReadPost * call CheckRo()
au BufWritePost * call Chmod_bin()


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

