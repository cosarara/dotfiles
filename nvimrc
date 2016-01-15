syntax on
filetype plugin indent on
set nu
set autoindent
set hidden
set wildmenu
set clipboard=unnamedplus
set ignorecase smartcase
set autochdir

au BufNewFile,BufRead *.php set tabstop=4 shiftwidth=4
au BufNewFile,BufRead,FileType c set tabstop=4 shiftwidth=4
au BufNewFile,BufRead,FileType cpp set tabstop=4 shiftwidth=4

call plug#begin('~/.config/nvim/plugged')
"" Make sure you use single quotes
"" Group dependencies, vim-snippets depends on ultisnips
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"" On-demand loading
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'https://github.com/MPiccinato/wombat256.git'
Plug 'https://github.com/cosarara97/vim-wasabi-colorscheme.git'
Plug 'https://github.com/bling/vim-airline.git'
Plug 'https://github.com/FelikZ/ctrlp-py-matcher.git'
Plug 'https://github.com/majutsushi/tagbar.git'
Plug 'https://github.com/JazzCore/ctrlp-cmatcher.git'
Plug 'https://github.com/evidens/vim-twig.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/rking/ag.vim'
Plug 'https://github.com/tikhomirov/vim-glsl.git'
Plug 'https://github.com/Shougo/vimproc.vim.git'
Plug 'https://github.com/Shougo/unite.vim.git'
Plug 'https://github.com/aperezdc/vim-template.git'
Plug 'https://github.com/rust-lang/rust.vim.git'
Plug 'https://github.com/AndrewRadev/linediff.vim.git'
"Plug 'https://github.com/kovisoft/slimv.git'
"Plug 'https://github.com/JazzCore/ctrlp-cmatcher.git''
Plug 'https://github.com/rust-lang/rust.vim.git'

"" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
"" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
"" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'
call plug#end()

"colorscheme wombat256
colorscheme wasabi256

noremap k n
noremap K N

noremap n h
noremap i j
noremap o k
noremap h l
noremap l o
noremap ; i

noremap <C-W>n <C-W>h
noremap <C-W>i <C-W>j
noremap <C-W>o <C-W>k
noremap <C-W>h <C-W>l

tnoremap <Esc> <C-\><C-n>

let mapleader = "\<Space>"
nnoremap <CR> :noh<CR><CR>
nnoremap <leader>p :CtrlPTag<CR>
nnoremap <silent> <Leader>t :TagbarToggle<CR>
"nnoremap <Leader>b :b 
nnoremap <Leader>n :bn<CR> 
nnoremap <Leader>N :bp<CR> 

set laststatus=2

command! Bbspaces %s/\s\+$

" breaks tag search
"let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
"      \ --ignore .git
"      \ --ignore .svn
"      \ --ignore .hg
"      \ --ignore .DS_Store
"      \ --ignore "**/*.pyc"
"      \ -g ""'

" neither seems faster
"let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
"let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }

call unite#filters#matcher_default#use(['matcher_fuzzy'])

"nnoremap <leader>e :Unite -quick-match buffer<cr>
nnoremap <leader>e :Unite -start-insert buffer<cr>
nnoremap <leader>f :Unite -start-insert file<cr>
nnoremap <space>/ :Unite grep:. -auto-preview -auto-highlight -no-split<cr>

nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T

autocmd BufEnter * silent! lcd %:p:h
"let g:slimv_swank_cmd ='! xterm -e sbcl --load ~/utils/start-swank.lisp &' "

