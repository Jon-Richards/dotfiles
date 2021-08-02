" Assumes usage of Vim Plug: https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Ale
Plug 'dense-analysis/ale'

" GitGutter
Plug 'airblade/vim-gitgutter'

" Conquer Of Completion
" Additional CoC plugins may need to be installed for specific language support,
" see docs for details.
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Git
Plug 'tpope/vim-fugitive'

call plug#end()

set number
syntax on
set splitright
set splitbelow
set hlsearch

" Ensure back space deletes lines, etc.
set backspace=indent,eol,start

" Set tabs
set ts=2
set sts=2
set shiftwidth=0
" Expand tabs to spaces.
set et

" Required for Airline Themes to render correctly
set t_Co=256

" Color column 81
set colorcolumn=81
hi colorcolumn ctermbg=darkgrey

hi DiffText ctermbg=darkgrey ctermfg=white
hi CursorLine ctermbg=none ctermfg=white
hi Error ctermbg=black ctermfg=red
hi SignColumn ctermbg=black

" Airline
let g:airline#extensions#tabline#enabled = 1
" show only the filename in tabs
let g:airline#extensions#tabline#fnamemod = ':t'
" include buffer number in tabs
let g:airline#extensions#tabline#buffer_nr_show = 1
" show branch name in status bar
let g:airline#extensions#branch#enabled = 1
let g:airline_theme='luna'
hi Pmenu ctermbg=black ctermfg=magenta
