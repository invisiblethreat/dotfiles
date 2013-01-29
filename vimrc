"http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim for more colours
syntax on
set number
highlight LineNr ctermfg=101
set paste
set hlsearch
filetype on

au BufNewFile,BufRead *.nasl set filetype=nasl
au BufNewFile,BufRead *.inc set filetype=nasl

au BufWritePost * call Chown_bin()

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

" Colours for modes
hi statusline ctermfg=cyan ctermbg=blue cterm=bold
au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline ctermfg=cyan ctermbg=blue cterm=bold
au BufReadPost * call CheckRo()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline ctermfg=black ctermbg=158 cterm=bold
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function CheckRo()
  if &readonly
    hi statusline cterm=bold ctermfg=black ctermbg=101
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function Chown_bin()
  if getline(1) =~ "^#!"
    if getline(1) =~ "/bin/"
      silent !chmod 700 <afile>
    endif
  endif
endfunction

