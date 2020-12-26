if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
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
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
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
colorscheme shblah
let g:airline_theme='minimalist'
let g:colorizer_maxlines=1000
highlight CocErrorHighlight ctermfg=Black guifg=#ff0000
highlight CocErrorFloat ctermfg=Black guibg=Red
highlight CocWarningFloat ctermfg=Black guibg=Orange
highlight CocInfoFloat ctermfg=Black guibg=White
let g:coc_disable_startup_warning = 1

" Emmet Config
let g:user_emmet_leader_key='<c-m>'
