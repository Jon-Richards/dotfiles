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
" @example: run :CocInstall coc-tsserver for typescript support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Git
Plug 'tpope/vim-fugitive'

" Spelunker (Spell checking)
Plug 'kamykn/spelunker.vim'

" JS, JSX, TS, TSX support
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'jparise/vim-graphql'        " GraphQL syntax

call plug#end()

set nonumber
syntax on
set splitright
set splitbelow
set mouse=n
set hlsearch
set background=dark

" Ensure back space deletes lines, etc.
set backspace=indent,eol,start

" Set tabs
set ts=2
set sts=2
set shiftwidth=0
" Expand tabs to spaces.
set et

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=white
match ExtraWhitespace /\s\+$/

" Required for Airline Themes to render correctly
set t_Co=256

" Color column 81
set colorcolumn=81
hi colorcolumn ctermbg=black ctermfg=red

hi DiffText ctermbg=darkgrey ctermfg=white
hi CursorLine ctermbg=none ctermfg=white
hi Error ctermbg=none ctermfg=red
hi SignColumn ctermbg=black
hi SpellCap ctermbg=none ctermfg=yellow
hi SpellBad ctermbg=none ctermfg=red

" Ale
set signcolumn=yes

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

" Spelunker (better spell checking)
set nospell "Avoids conflicts with vim's built in spellchecker.

" Conquer Of Completion
" @SEE: https://github.com/neoclide/coc.nvim#example-vim-configuration
set updatetime=300

" Set keys for code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
