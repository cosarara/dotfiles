syntax on
filetype plugin indent on
set nu
set autoindent
set hidden
set wildmenu
set clipboard=unnamedplus
set smartcase

au BufNewFile,BufRead *.php set tabstop=4 shiftwidth=4

call plug#begin('~/.nvim/plugged')

"" Make sure you use single quotes
"Plug 'junegunn/seoul256.vim'
"Plug 'junegunn/vim-easy-align'
"
"" Group dependencies, vim-snippets depends on ultisnips
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"
"" On-demand loading
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"
"" Using git URL
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
"Plug 'https://github.com/sheerun/vim-wombat-scheme.git'
"Plug 'git@github.com:vim-scripts/Wombat.git'
Plug 'https://github.com/MPiccinato/wombat256.git'
Plug 'https://github.com/thomd/vim-wasabi-colorscheme.git'
Plug 'https://github.com/bling/vim-airline.git'
Plug 'https://github.com/FelikZ/ctrlp-py-matcher.git'
Plug 'https://github.com/majutsushi/tagbar.git'
Plug 'https://github.com/JazzCore/ctrlp-cmatcher.git'
"Plug 'https://github.com/kovisoft/slimv.git'
"Plug 'https://github.com/JazzCore/ctrlp-cmatcher.git''

"" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
"
"" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
"
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
nnoremap <Leader>b :b 
nnoremap <Leader>n :bn<CR> 

set laststatus=2

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

