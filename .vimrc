" Assumes usage of Vim Plug: https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" GoYo (basically Zen mode, toggle with :Goyo)
Plug 'junegunn/goyo.vim'

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
Plug 'posva/vim-vue'              " Vue files

" Rust support
" Additional CoC plugins should be installed:
" @example
" CocInstall coc-rust-analyzer for intellisense
Plug 'rust-lang/rust.vim'

call plug#end()

set number
syntax on
set splitright
set splitbelow
set mouse=n
set hlsearch
set background=dark
set nowrap

" \e to :Explore
nnoremap <Leader>e :Explore

" \b for :buffers
nnoremap <Leader>b :buffers

" \d to delete current buffer
nnoremap <Leader>d :bd

" \n for no highlight
nnoremap <Leader>n :noh

" \y for yank multiple lines to system clipboard
nnoremap <Leader>y "*y

" \p to paste from system clipboard
nnoremap <Leader>p "*p

" \s to start search and replace in document
nnoremap <Leader>s :%s/

" \t to bring up a terminal window
nnoremap <Leader>t :term

" \nn for toggle number
nnoremap <Leader>nn :set number!

" Tab to next buffer, Shift + Tab to previous.
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

" Keep cursor in center of window when scrolling.
set scrolloff=999

" Ensure back space deletes lines, etc.
set backspace=indent,eol,start

" Set netrw to use rm -rf instead of just rm
:let g:netrw_localrmdir='rm -rf'

" Set tabs
set ts=2
set sts=2
set shiftwidth=0
" Expand tabs to spaces.
set et

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=52
match ExtraWhitespace /\s\+$/

" Required for Airline Themes to render correctly
set t_Co=256

" Color column 81
set colorcolumn=81
hi colorcolumn ctermbg=black ctermfg=red

hi LineNr ctermfg=darkgrey
hi DiffText ctermbg=darkgrey ctermfg=white
hi CursorLine ctermbg=none ctermfg=white
hi Error ctermbg=none ctermfg=red
hi SignColumn ctermbg=black
hi SpellCap ctermbg=none ctermfg=yellow
hi SpellBad ctermbg=none ctermfg=red
hi Visual ctermbg=18
hi MatchParen ctermbg=black ctermfg=45

" Sets the cursor glyph.
" To change the glyph, change the number after the "\e["
let &t_SI = "\e[6 q"
let &t_EI = "\e[1 q"

" Reset the cursor on start (for older versions of vim, usually not required)
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

" Ale
set signcolumn=number
highlight ALEWarning ctermbg=black ctermfg=yellow
highlight ALEError ctermbg=black ctermfg=red

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
hi Comment ctermfg=244

" Spelunker (better spell checking)
set nospell "Avoids conflicts with vim's built in spellchecker.
highlight SpelunkerSpellBad cterm=underline ctermfg=208 gui=underline guifg=#9e9e9e
highlight SpelunkerComplexOrCompoundWord cterm=underline ctermfg=NONE gui=underline guifg=NONE

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
