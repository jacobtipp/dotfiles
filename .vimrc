set nocompatible

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

filetype off
call plug#begin('~/.vim/plugged')
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'neoclide/coc.nvim', {'branch': 'release'} " intelisense for vim
Plug 'noahfrederick/vim-noctu' " system color theme
Plug 'w0ng/vim-hybrid' " hybrid color theme
Plug 'vim-airline/vim-airline'    " Vim powerline
Plug 'vim-airline/vim-airline-themes'
Plug 'mattn/emmet-vim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
call plug#end()
filetype plugin indent on

" Leader key is comma, I find it the best
let mapleader = ","

syntax enable
set background=dark
set wildmenu " when opening a file with e.g. :e ~/.vim<TAB> there is a graphical menu of all the matches
set ttyfast
set lazyredraw
set updatetime=300

" colors
colorscheme noctu
let g:airline_theme='minimalist'
let g:colorizer_maxlines=1000
hi CocFloating ctermbg=black
hi StatusLine ctermbg=black

" Numbers
set number
set ruler

" Treat long lines as break lines
map j gj
map k gk

" indenting rules
set autoindent
set cindent
set smartindent

" folding
set foldmethod=syntax
set foldlevel=99

" Enable folding with the z key
nmap z za

" Tab Options
set shiftwidth=2
set tabstop=2
set softtabstop=2 " Number of spaces a tab counts when editing
set expandtab

" Disable all bells and whistles
set noerrorbells visualbell t_vb=

" Set default encoding to utf-8
set encoding=utf-8
set termencoding=utf-8

" Disable backups and swap files
set nobackup
set nowritebackup
set noswapfile
set noundofile
set backupcopy=yes


" Delete characters outside of insert area
set backspace=indent,eol,start

" Always show the status line
set laststatus=2

" Allow copy and paste from system clipboard
set clipboard=unnamed

set ignorecase " Ignore case when searching
set smartcase  " When searching try to be smart about cases
set nohlsearch " Don't highlight search term
set incsearch  " Jumping search

" Delete empty space from the end of lines on every save
autocmd BufWritePre * :%s/\s\+$//e

" Faster saving and exiting
nnoremap <silent><leader>w :w!<CR>
nnoremap <silent><leader>q :q!<CR>
nnoremap <silent><leader>x :x<CR>
" Open Vim configuration file for editing
nnoremap <silent><leader>2 :e ~/.vimrc<CR>
" Source Vim configuration file and install plugins
nnoremap <silent><leader>1 :source ~/.vimrc \| :PlugInstall<CR>


" Extra <CR> is for disabling /"Press ENTER or type command to continue/"
nnoremap <silent><leader>e :Exp<CR><CR>

" Emmet Config
let g:user_emmet_leader_key='<C-Z>'

" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

" nerdtree
map <C-n> :NERDTreeToggle<CR>

" prettier
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" vim close tag options
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.tsx,*.jsx'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx'
let g:closetag_filetypes = 'html,xhtml,phtml,tsx,jsx'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,tsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

" coc extensions
let g:coc_global_extensions = ['coc-tsserver', 'coc-json', 'coc-snippets', 'coc-pairs', 'coc-html', 'coc-css']

" Add CoC Prettier if prettier is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif
