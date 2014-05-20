"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Be Improved
set nocompatible

" Set mapleader
let mapleader = ","
let g:mapleader = ","

" Copy/paste from system clipboard
set clipboard=unnamed

" Enable filetype plugins
filetype plugin on
filetype indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" Fancy status lines
Bundle 'Lokaltog/vim-powerline'
let g:Powerline_symbols = 'fancy'

" File system explorer
Bundle 'The-NERD-tree'
let g:NERDTreeShowBookmarks=1
let g:NERDTreeIgnore=['\.so$', '\.class$', '.\swp', '\.exe$', '\~$']
map <leader>nt :NERDTreeToggle<cr>

" Indention display
Bundle 'Yggdroot/indentLine'
let g:indentLine_color_term = 239
let g:indentLine_char = '|'

" Indent guide
Bundle 'https://github.com/nathanaelkane/vim-indent-guides'
let g:indent_guides_guide_size = 1

" Finder
Bundle 'FuzzyFinder'
Bundle 'L9'
nmap <leader>fu :FufFile<cr>

Bundle 'The-NERD-Commenter'
Bundle 'c.vim'
Bundle 'snipMate'
Bundle 'mru.vim'
Bundle 'pyflakes.vim'
Bundle 'jsbeautify'
Bundle 'Markdown-syntax'
Bundle 'https://github.com/altercation/vim-colors-solarized'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax enable

colorscheme torte
set guifont=Monaco:h14

if has("gui_running")
  set guioptions-=T
  set guioptions+=e
  set t_Co=256
  set guitablabel=%M\ %t

  set background=dark " {light, dark}
  colorscheme solarized
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual configuration and ... 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set utf-8 as standard encoding
set fileencodings=utf-8,cp936,gbk,gb18030,big5,latin1

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Trun backup on
set backup
set writebackup

" Indent
set ai
set si

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2 " 

set expandtab " use spaces intead of tabs
set hlsearch " highligh the search result
set nowrap " do not auto wrap lines
set nu " display line number
set autochdir " set the file browser directory as the current directory
set vb t_vb= " turn off the alarm
set cino=:0g0t0(sus " better indent
set cc=81 " show a column at 81st character

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Mapping 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Fast saving
nmap <leader>w :w!<cr>
nmap <leader>e :source $HOME/.vimrc<cr>

" Beatify the code
nmap <F3> ggVG=
map <F5> :call CompileAndRun()<cr>
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Compile and Run 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! DictGet(dict, key, default)
  if has_key(a:dict, a:key)
    let value = a:dict[a:key]
  else
    let value = a:default
  endif
  return substitute(value, '\s%.\b\s', "'\\0'", 'g')
endfunction

function! CompileAndRun()
  let compileDict = {
        \ 'c':            'gcc -O2 -Wall -Wextra -lm -DCTLIU "%"',
        \ 'cpp':          'g++ -std=c++0x -O2 -Wall -Wextra -DCTLIU "%"'
        \ }
  let compile = DictGet(compileDict, &filetype, 'true')

  let runDict = {
        \ 'c':            './a.out',
        \ 'cpp':          './a.out',
        \
        \ 'sml':          'sml %',
        \ 'haskell':      'ghci %',
        \ 'lisp':         'clisp -i %',
        \ 'python':       'python %',
        \ 'ruby':         'ruby %',
        \ 'javascript':   'node %',
        \
        \ 'php':          'php %',
        \ }
  let run = DictGet(runDict, &filetype, 'false')

  let compileAndRun =
        \ substitute(compile . ' && ', 'true.*', '', 'g') . run

  execute 'w'
  execute '! ' . compileAndRun
endfunction
