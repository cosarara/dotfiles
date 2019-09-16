set shell=zsh

set mouse=a

syntax on
filetype plugin indent on
set nu
set autoindent
set hidden
set wildmenu
set clipboard=unnamedplus
set ignorecase smartcase
set linebreak
"set autochdir

cmap w!! w !sudo tee %

set tabstop=4 shiftwidth=4 expandtab

au BufNewFile,BufRead,FileType php set tabstop=4 shiftwidth=4 expandtab
au BufNewFile,BufRead,FileType php syntax sync fromstart
au BufNewFile,BufRead,FileType html.twig syntax sync fromstart
au BufNewFile,BufRead,FileType c set tabstop=4 shiftwidth=4
au BufNewFile,BufRead,FileType cpp set tabstop=4 shiftwidth=4
au BufNewFile,BufRead,FileType lua set tabstop=4 shiftwidth=4 expandtab
au BufNewFile,BufRead,FileType asciidoc set nospell
au BufNewFile,BufRead,FileType scheme set ts=2 sw=2 expandtab
au BufNewFile,BufRead,FileType twig set tabstop=4 shiftwidth=4 expandtab
au BufNewFile,BufRead,FileType html set tabstop=4 shiftwidth=4 expandtab
au BufNewFile,BufRead,FileType html.twig set tabstop=4 shiftwidth=4 expandtab
au BufNewFile,BufRead,FileType css set tabstop=4 shiftwidth=4 expandtab
au BufNewFile,BufRead,FileType kotlin set tabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufRead *.nfo edit ++enc=cp437
au BufNewFile,BufRead *.pks set ft=pks

call plug#begin('~/.config/nvim/plugged')
" magic
Plug 'jpalardy/vim-slime'
Plug 'kovisoft/slimv' " hrm I don't need 2 slimes
Plug 'tpope/vim-fugitive'
Plug 'Shougo/vimproc.vim', { 'do': 'make' } " is this a dependency of something?
Plug 'ntpeters/vim-better-whitespace'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'racer-rust/vim-racer'
Plug 'tpope/vim-commentary' " I should start using this tbh
    " fzf is installed system-wide, this is redundant
    " and yet, how do I load it?
    " see /usr/share/vim/vimfiles/plugin/fzf.vim /usr/bin/fzf
Plug 'junegunn/fzf', { 'dir': '~/.config/nvim/fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify'
Plug 'osyo-manga/vim-over' " how does this work
Plug 'tpope/vim-surround' " I should start using this
Plug 'neomake/neomake'
Plug 'suan/vim-instant-markdown'

" rice
Plug 'cosarara/vim-wasabi-colorscheme'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rakr/vim-one'
Plug 'chriskempson/base16-vim'

" language support
Plug 'lumiliet/vim-twig' " mantained fork of evidens/vim-twig
Plug 'rust-lang/rust.vim'
Plug 'peterhoeg/vim-qml'
Plug 'dag/vim-fish'
Plug 'ap/vim-css-color'
Plug 'zah/nim.vim'
Plug 'hynek/vim-python-pep8-indent'
Plug 'udalov/kotlin-vim'
Plug 'elixir-editors/vim-elixir'
Plug 'ledger/vim-ledger'
call plug#end()

" RICE
"set termguicolors

let g:gruvbox_italic=1
"colorscheme wombat256
colorscheme wasabi256
"colorscheme one
"set background=light
"let g:airline_theme='one'
"let g:airline_base16_improved_contrast=1
"let g:airline_theme='base16'
"colorscheme gruvbox
"colorscheme base16-ia-light

let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme='molokai'
let g:airline_theme='base16_default'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
set noshowmode

" KEYS AND STUFF
let g:neoterm_autoscroll = '1'

" wtf is this
try
  set shortmess+=c
catch /^Vim\%((\a\+)\)\=:E539: Illegal character/
  autocmd MyAutoCmd VimEnter *
        \ highlight ModeMsg guifg=bg guibg=bg |
        \ highlight Question guifg=bg guibg=bg
endtry

let g:email = 'jaume@delclos.com'

noremap k n
noremap K N

noremap n h
noremap i j
noremap o k
noremap <silent> i gj
noremap <silent> o gk
"noremap <silent> <expr> i (v:count == 0 ? 'gj' : 'j')
"noremap <silent> <expr> o (v:count == 0 ? 'gk' : 'k')
noremap h l
noremap l o
noremap ; i

noremap <C-W>n <C-W>h
noremap <C-W>i <C-W>j
noremap <C-W>o <C-W>k
noremap <C-W>h <C-W>l

"tnoremap <Esc> <C-\><C-n>

let mapleader = "\<Space>"
nnoremap <silent> <CR> :noh<CR><CR>
nnoremap <leader>p :CtrlPTag<CR>
nnoremap <silent> <Leader>t :TagbarToggle<CR>
"nnoremap <Leader>b :b
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>N :bp<CR>

nnoremap <c-f> :Files<cr>
nnoremap <Leader>f :Files<cr>
nnoremap <c-b> :Buffers<cr>
nnoremap <Leader>b :Buffers<cr>
nnoremap <Leader>t :Tags<cr>
nnoremap <Leader>T :TagbarToggle<cr>

nnoremap <silent> <leader>s :OverCommandLine<CR>
"xnoremap <silent> <leader>s :OverCommandLine '<,'>s/<CR>
" it actually does it automagically
xnoremap <silent> <leader>s :OverCommandLine s/<CR>

command! Bbspaces %s/\s\+$

nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T

" TODO: I want this to be able to use esc on :terminal, but
" I can't have it if I want esc to close FZF ;-;
"tnoremap <Esc> <C-\><C-n>

" I don't remember why what
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" RICE

let g:terminal_color_0="#353540"
let g:terminal_color_1="#8c5760"
let g:terminal_color_2="#7b8c58"
let g:terminal_color_3="#8c6e43"
let g:terminal_color_4="#58698c"
let g:terminal_color_5="#7b5e7d"
let g:terminal_color_6="#66808c"
let g:terminal_color_7="#8c8b8b"
let g:terminal_color_8="#545466"
let g:terminal_color_9="#b26f7a"
let g:terminal_color_10="#9db270"
let g:terminal_color_11="#b28c55"
let g:terminal_color_12="#7086b2"
let g:terminal_color_13="#9c77b2"
let g:terminal_color_14="#82a2b2"
let g:terminal_color_15="#b8b8c8"
let g:terminal_color_background="#09090d"
let g:terminal_color_foreground="#839496"

" what is this
set laststatus=2

let g:startify_custom_header =
\ map(split(system('fortune | cowsay -f hellokitty -W 60 | sed "s/\s$//g"'), '\n'), '" ". v:val')
"let g:startify_change_to_vcs_root=1
let g:startify_change_to_dir=0


" PROGRAMMING

"let g:paredit_mode = 0
let g:instant_markdown_autostart = 0
let g:deoplete#enable_at_startup = 1
let g:racer_experimental_completer = 1
let g:no_ruby_maps = 1
let g:slimv_swank_cmd ='! xterm -e sbcl --load ~/coses/start-swank.lisp &' "
let g:jedi#show_call_signatures = "2"

function! MyOnBattery()
    let l:path = '/sys/class/power_supply/ADP1/online'
    return filereadable(l:path) && readfile(l:path) == ['0']
endfunction

if MyOnBattery()
  call neomake#configure#automake('w')
else
  call neomake#configure#automake('nw', 1000)
endif

let g:neomake_html_twig_enabled_makers = []
