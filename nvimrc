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

call plug#begin('~/.config/nvim/plugged')
" magic
Plug 'jpalardy/vim-slime'
Plug 'kovisoft/slimv' " hrm I don't need 2 slimes
Plug 'tpope/vim-fugitive'
Plug 'Shougo/vimproc.vim', { 'do': 'make' } " is this a dependency of something?
Plug 'ntpeters/vim-better-whitespace'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'zchee/deoplete-jedi'
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
"Plug 'neomake/neomake'
Plug 'suan/vim-instant-markdown'

" rice
Plug 'cosarara/vim-wasabi-colorscheme'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rakr/vim-one'
Plug 'chriskempson/base16-vim'
Plug 'junegunn/goyo.vim'
"Plug 'jsit/disco.vim' " forked locally

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
"Plug 'vim-scripts/bash-support.vim'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'ziglang/zig.vim'
Plug 'kalafut/vim-taskjuggler'
Plug 'evanleck/vim-svelte', {'branch': 'main'}

Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

cmap w!! w !sudo tee %

set tabstop=4 shiftwidth=4 expandtab

" RICE
"set termguicolors

let g:gruvbox_italic=1
"colorscheme wombat256
"colorscheme wasabi256
"colorscheme one
colorscheme disco
" background is actually automatically detected now: https://github.com/neovim/neovim/pull/9509
"set background=light
"let g:airline_theme='one'
"let g:airline_base16_improved_contrast=1
"let g:airline_theme='base16'
"colorscheme gruvbox
"colorscheme base16-ia-light

let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme='molokai'
"let g:airline_theme='base16_default'
let g:airline_theme='mnml'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
set noshowmode

let g:better_whitespace_ctermcolor='lightred'
let g:better_whitespace_guicolor='#6d4e4e'

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
"let g:deoplete#enable_at_startup = 1
let g:racer_experimental_completer = 1
let g:no_ruby_maps = 1
let g:slimv_swank_cmd ='! xterm -e sbcl --load ~/coses/start-swank.lisp &' "
let g:jedi#show_call_signatures = "2"

function! MyOnBattery()
    let l:path = '/sys/class/power_supply/ADP1/online'
    return filereadable(l:path) && readfile(l:path) == ['0']
endfunction

"if MyOnBattery()
"  call neomake#configure#automake('w')
"else
"  call neomake#configure#automake('nw', 1000)
"endif

let $MIX_ENV='test'
let g:neomake_python_enabled_makers = []
let g:neomake_html_twig_enabled_makers = []
let g:neomake_sh_enabled_makers = ["shellcheck"]
"clang-tidy, checkpatch, cppcheck
let g:neomake_c_enabled_makers = ["clang", "gcc"]
let g:neomake_c_gcc_maker = {
\ 'exe': 'gcc',
\ 'args': ['-Wall', '-Iinclude', '-Wextra', '-Weverything', '-pedantic', '-Wno-sign-conversion'],
\ }
let g:neomake_c_clang_maker = {
\ 'exe': 'clang',
\ 'args': ['-Wall', '-Iinclude', '-Wextra', '-Weverything', '-pedantic', '-Wno-sign-conversion'],
\ }

let g:neomake_cpp_enabled_makers = ["clang", "gcc"]
let g:neomake_cpp_gcc_maker = {
\ 'exe': 'g++',
\ 'args': ['-Wall', '-Iinclude', '-Wextra', '-pedantic', '-Wno-sign-conversion', '-std=c++17'],
\ }
let g:neomake_cpp_clang_maker = {
\ 'exe': 'clang++',
\ 'args': ['-Wall', '-Iinclude', '-Wextra', '-pedantic', '-Wno-sign-conversion', '-std=c++17'],
\ }

function! ZenMode()
    Goyo 100
    set background=light
    colorscheme one
endfunction

function! ZenOff()
    Goyo!
    set background=dark
    colorscheme wasabi256
endfunction

com! Zen call ZenMode()
com! ZenOff call ZenOff()

" we override this to get proper filetype on >=70 col instead of 90
function GetFileType()
  return (airline#util#winwidth() < 70 && strlen(&filetype) > 3)
        \ ? matchstr(&filetype, '...'). (&encoding is? 'utf-8' ? '…' : '>')
        \ : &filetype
endfunction
call airline#parts#define_function('myfiletype', 'GetFileType')
let g:airline_section_x = airline#section#create_right(['bookmark', 'tagbar', 'vista', 'gutentags', 'omnisharp', 'grepper', 'myfiletype'])
