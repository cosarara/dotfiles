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

noremap n h
noremap i j
noremap o k
noremap h l
noremap l o
noremap ; i
noremap k n
noremap K N

noremap <silent> <expr> i (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> o (v:count == 0 ? 'gk' : 'k')
noremap h l
noremap l o
noremap ; i

noremap <C-W>n <C-W>h
noremap <C-W>i <C-W>j
noremap <C-W>o <C-W>k
noremap <C-W>h <C-W>l
