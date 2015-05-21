execute pathogen#infect()
syntax on
filetype plugin indent on
set nu
set autoindent
set hidden
map <F2> :NERDTreeToggle<CR>
map <F3> :TlistToggle<CR>
map <F5> :!make<CR><CR>
au BufNewFile,BufRead *.pks set filetype=pks
au BufNewFile,BufRead *.rs set filetype=rust
au BufNewFile,BufRead *.php set tabstop=4 shiftwidth=4
au BufNewFile,BufRead *.qml set tabstop=4 shiftwidth=4


command -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction

noremap n h
noremap i j
noremap o k
noremap h l
noremap l o
noremap ; i
noremap m n
