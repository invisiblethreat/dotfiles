" NASL prefs
au BufNewFile,BufRead *.nasl set filetype=nasl
au BufNewFile,BufRead *.inc set filetype=nasl
au BufNewFile,BufRead *.inc set indentexpr=
au FileType nasl setlocal shiftwidth=2 tabstop=2 expandtab softtabstop=2
au FileType nasl setlocal spell
au FileType nasl setlocal spelllang=en_us
au FileType nasl setlocal spellcapcheck=""

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


