"http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim for more colours
set t_Co=256
syntax on
set spell
setlocal spell spelllang=en_us
set spellcapcheck=""
colo custom
set number
"highlight LineNr ctermfg=8 ctermbg=none cterm=none
"highlight Search ctermbg=28 ctermfg=black cterm=none
set paste
set hlsearch
set foldmethod=indent
set foldlevelstart=20
filetype on
autocmd FileType make setlocal noexpandtab

au BufNewFile,BufRead *.nasl set filetype=nasl
au BufNewFile,BufRead *.inc set filetype=nasl

au BufWritePost * call Chmod_bin()

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

" Colours for modes
hi statusline ctermfg=15 ctermbg=27 cterm=none
au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline ctermfg=15 ctermbg=27 cterm=none
au BufReadPost * call CheckRo()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline ctermfg=15 ctermbg=22 cterm=bold
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

