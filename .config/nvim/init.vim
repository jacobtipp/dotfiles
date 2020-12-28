if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-snippets'
Plug 'neoclide/coc-tsserver'
Plug 'neoclide/coc-prettier'
Plug 'w0ng/vim-hybrid'
Plug 'noahfrederick/vim-noctu'
Plug 'jeffkreeftmeijer/vim-dim'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
call plug#end()

" nerdtree
map <C-n> :NERDTreeToggle<CR>

" prettier
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

set updatetime=300
set clipboard=unnamedplus
set autoindent
set smartindent
set number
set encoding=utf8
set noswapfile
set noundofile
set nowritebackup
set backspace=indent,eol,start
set backupcopy=yes

" tabs and stuff
set shiftwidth=2
set softtabstop=2
set laststatus=2
set expandtab

" colors
set background=dark
colorscheme noctu
let g:airline_theme='minimalist'
let g:colorizer_maxlines=1000
hi CocFloating ctermbg=black
hi StatusLine ctermbg=black

" Emmet Config
let g:user_emmet_leader_key='<c-m>'
