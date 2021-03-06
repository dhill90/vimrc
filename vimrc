syntax on
set nocompatible              " vim, not vi
" Basic Formatting -------------{{{
set number                      " number line
set relativenumber              " relative-number line
set background=dark
set ruler                       " show the line number on the bar
set more                        " use more prompt
set virtualedit=onemore         " allow for cursor beyond last char

highlight CursorLine cterm=NONE ctermbg=0 ctermfg=NONE

set autoindent
set smartindent                 " auto/smart indent
set cindent
set shiftwidth=4                " uses C indenting conventions with a given
set tabstop=4                   " 4 spaces
set softtabstop=4               " 4 spaces
set smarttab                    " tab and backspace are smart
set expandtab
set nowrap                      " sets lines to wrap around

set splitright
set equalalways                 " all windows are always the same size
set matchpairs+=<:>             " use +=<:> to add angle brackets etc. more in c/cpp
set showmatch                   " shows matching brackets or parenthesis
set autoread                    " watch for file changes
set noautowrite                 " don't automagically write on :next
set magic                       "LOTTE!
set lazyredraw                  " don't redraw when don't have to
set showmode
set showcmd
set scrolloff=5                 " keep at least 5 lines above/below...
set scrolljump=1                " ...only scroll one line at a time though
set sidescrolloff=5             " keep at least 5 columns right
" set listchars+=precedes:<,extends:>
set matchtime=1
set history=200
set backspace=indent,eol,start
set linebreak
set cmdheight=2                " command line two lines high
set undolevels=100             " 100 undos
set updatecount=100            " switch every 100 chars
set complete=.,w,b,u,U,t,i,d   " do lots of scanning on tab completion
set ttyfast                    " we have a fast terminal
set noerrorbells               " No error bells please
set shell=bash
set fileformats=unix
set ff=unix
set wildmenu                   " menu has tab
set wildmode=list:full,full
set foldenable
set foldignore=
set viewoptions=folds,options,cursor,unix,slash
filetype on                    " Enable filetype detection
"filetype indent                " Enable filetype-specific indenting
"filetype plugin                " Enable filetype-specific plugins
""hi Folded ctermfg=01 ctermbg=00
" }}}
" Easy Windows -------------{{{
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
map <C-h> <C-W>h
" }}}
" Status Line Format----------{{{
" set laststatus=2
" set statusline=%f						" Path to file
" set statusline+=\ -\ 				" Separator
" set statusline+=Filetype:		" Label
" set statusline+=\ %Y				" filetype of the file
" set statusline+=\ %m%r			" modifiable, and Read only
" set statusline+=%=					" switch to right side
" set statusline+=%l					" current line
" set statusline+=/ 					" separator
" set statusline+=%L,					" Total Lines
" set statusline+=\ %c				" the column number
" set statusline+=\ %4P					" separator with percentage
" }}}
" Searching Parameters -----------{{{
set incsearch                 " incremental search
set ignorecase                " search ignoring case
set hlsearch                  " highlight the search
set diffopt=filler,iwhite     " ignore all whitespace and sync
" }}}
" Spelling--------{{{
if v:version >= 700
" Enable spell check for text files
  augroup spelling
    autocmd!
    hi clear SpellBad
    hi SpellBad cterm=underline
    autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en
  augroup END
endif
" }}}
" My Leaders-----------------{{{
let mapleader=','
let maplocalleader='\\'
" }}}
" Normal Maps ---------------{{{
nnoremap <silent> <leader>fa :w<CR>
" visually select a whole word
noremap <leader><space> viw
" move a line down
nnoremap <leader>- ddp<esc>
" move a line up
nnoremap <leader>_ dd2kp<esc>
" make the current word all capitals
noremap <leader><c-u> <esc>bveU<esc>e
" EditVim
nnoremap <leader>ev :vsplit $MYVIMRC.local<cr>
" SourceVim
nnoremap <leader>sv :source $MYVIMRC<cr>
" Vertical split
nnoremap <leader>vs :vsp
" QuickFold creation on a bracket or such device
nnoremap <leader>qf zf%
" strong h -- jump to beginning of line
noremap H ^
" strong l -- jump to end of line
noremap L $
" strong J -- jump to end of screen
noremap J L
" strong K -- jump to top of screen
noremap K H
" surround with double quotes
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
" surround with single quotes
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
" toggle list mode
nnoremap <LocalLeader>tl :set list!<cr>
" toggle paste mode
nnoremap <LocalLeader>pp :set paste!<cr>
" make mappings
nnoremap <LocalLeader>cn :cnext<cr>
nnoremap <LocalLeader>cp :cprevious<cr>
noremap j gj
noremap k gk
" open corresponding file
nnoremap <leader>cp :vsp %:r.cpp<cr>
nnoremap <leader>h :vsp %:r.h<cr>
" }}}
" Other Maps ---------{{{
" make switching modes homerow fast
inoremap jk <esc>
" Run 'things' easier
"inoremap <esc> jk:!
"noremap <esc> jk:!
" What do these things do
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
" easier indent for visual
vnoremap > >gv
vnoremap < <gv
" }}}
" VimScript Settings -----{{{
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END
" }}}
" Vimscript file settings -------------{{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
" VimScript CPP Settings -----{{{
augroup filetype_cpp
  autocmd!
  autocmd Filetype cpp setlocal foldmethod=syntax
  autocmd Filetype cpp setlocal foldnestmax=1
  autocmd Filetype cpp :iabbrev <buffer> iff if ()<left>
augroup END
" }}}
" VimScript C Settings -----{{{
augroup filetype_c
  autocmd!
  autocmd Filetype c setlocal foldmethod=syntax
  autocmd Filetype c setlocal foldnestmax=1
  autocmd Filetype c setlocal mps+==:;
  autocmd Filetype c :iabbrev <buffer> iff if ()<left>
augroup END
" }}}
" VimScript PYTHON Settings -----{{{
augroup filetype_python
  autocmd!
  autocmd Filetype python setlocal foldnestmax=2
augroup END
" }}}
" Functions -----{{{
function! StripTrailingWhitespace()
  let _s=@/
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  let @/=_s
  call cursor(l, c)
endfunction
  " }}}
" Plugin Variable Overrides -----{{{
let g:syntastic_python_python_exec = '/usr/bin/python3.4'
let g:tagbar_autoclose=0
let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_open_on_gui_startup=1
"let g:nerdtree_tabs_open_on_new_tab=1
let NERDSpaceDelims=1
let g:indent_guides_enable_on_vim_startup=0
" }}}
