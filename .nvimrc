"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Set mapleader
let mapleader = ","
let g:mapleader = ","

" Copy/paste from system clipboard
set clipboard=unnamed

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoNeoBundle.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype off

set rtp+=$GOROOT/misc/vim

call neobundle#begin(expand('~/.vim/NeoBundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

"NeoBundle 'c.vim'
NeoBundle 'snipMate'
NeoBundle 'mru.vim'
NeoBundle 'python.vim'
NeoBundle 'jsbeautify'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'twilight256.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'nsf/gocode', {'rtp': 'vim/'}
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'tomasr/molokai'
"NeoBundle 'ervandew/screen'
NeoBundle 'mileszs/ack.vim'

NeoBundle 'The-NERD-Commenter'
let NERDSpaceDelims = 1

" tell filetype
NeoBundle 'wlangstroth/vim-racket'

" Auto syntactic check
NeoBundle 'scrooloose/syntastic'
let g:syntastic_error_symbol = '✗'
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_python_flake8_post_args='--ignore=E111'
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++'

" YouCompleteMe
"NeoBundle 'Valloric/YouCompleteMe'
"let g:python_host_prog='/usr/local/bin/python'
"let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'

" Exuberant Ctags
"set tags=./tags,tags;$HOME

" Go
"NeoBundle 'https://github.com/fatih/vim-go'
"let g:go_disable_autoinstall=0
"let g:go_fmt_autosave=0

" Tag Bar
NeoBundle "https://github.com/majutsushi/tagbar"
nmap <F8> :TagbarToggle<CR>
let g:tagbar_ctags_bin='/usr/local/bin/ctags'
let g:tagbar_width=30
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" Fancy status lines
NeoBundle 'Lokaltog/vim-powerline'
let g:Powerline_symbols='fancy'

" File system explorer
NeoBundle 'The-NERD-tree'
let g:NERDTreShowBookmarks=1
let g:NERDTreeIgnore=['\.so$', '\.class$', '.\swp', '\.exe$', '\~$']
map <leader>nt :NERDTreeToggle<cr>

" Indention display
NeoBundle 'Yggdroot/indentLine'
let g:indentLine_color_term=239
let g:indentLine_char='|'

" Indent guide
NeoBundle 'https://github.com/nathanaelkane/vim-indent-guides'
let g:indent_guides_guide_size=1

" Finder
NeoBundle 'FuzzyFinder'
NeoBundle 'L9'
nmap <leader>fu :FufFile<cr>

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
"let g:solarized_termcolors=256
"let g:solarized_contrast='low'
"let g:solarized_visibility='low'
"colorscheme solarized
"set background=dark
"colorscheme twilight256

colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1

if has("gui_running")
  set guioptions-=T
  set guioptions+=e
  set guitablabel=%M\ %t

  set guifont=Monaco:h14
  set guifontwide=Microsoft\ YaHei:h14
  set background=dark " {light, dark}
  colorscheme solarized
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual configuration and ...
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set utf-8 as standard encoding
set fileencodings=ucs-bom,utf-8,cp936,gbk,gb18030,big5,euc-jp,euc-kr,latin1

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Trun backup on
set backup
set writebackup

" Indent
set ai
set si
set ci

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

set softtabstop=2
set smarttab
set expandtab " use spaces intead of tabs
set hlsearch " highligh the search result
set nowrap " do not auto wrap lines
set nu " display line number
set autochdir " set the file browser directory as the current directory
set vb t_vb= " turn off the alarm
set cino=:0g0t0(sus " better indent
set cc=81 " show a column at 81st character
set ignorecase " ignore case during searching
set nobackup " no backup files
"augroup golang
  "au BufRead,BufEnter $GOPATH/* sts=2 sw=2
"augroup END

" Enable syntax highlighting
syntax on

" Enable filetype plugins

highlight Tab ctermbg=lightblue guibg=lightblue
call matchadd("Tab", "\t")

highlight WhitespaceEOL ctermbg=red guibg=red
call matchadd("WhitespaceEOL", "\\s\\+$")

au BufRead,BufNewFile *.sml setfiletype sml
au FileType python set shiftwidth=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <C-I> A

" Fast saving
nmap <leader>w :w!<cr>
nmap <leader>e :source $HOME/.nvimrc<cr>

" Beatify the code
nmap <F3> ggVG=
map <F5> :call CompileAndRun()<cr>

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
        \ 'cpp':          'g++ -std=c++0x -O2 -Wall -Wextra -DCTLIU "%"',
        \ 'cuda':         'nvcc "%"',
        \ 'pascal':       'fpc -So -XS %'
        \ }
  let compile = DictGet(compileDict, &filetype, 'true')

  let runDict = {
        \ 'c':            './a.out',
        \ 'cpp':          './a.out',
        \ 'cuda':         './a.out',
        \ 'pascal':       './%<',
        \ 'go':           'go run %',
        \
        \ 'sml':          'sml "%"',
        \ 'haskell':      'runghc "%"',
        \ 'lisp':         'clisp -i "%"',
        \ 'clojure':      'lein exec "%"',
        \ 'scheme':       'scheme < "%" --quiet',
        \
        \ 'python':       'python3 "%"',
        \ 'ruby':         'ruby "%"',
        \ 'javascript':   'node "%"',
        \ 'coffee':       'coffee "%"',
        \
        \ 'php':          'php "%"',
        \ 'scala':        'scala "%"',
        \ }
  let run = DictGet(runDict, &filetype, 'false')

  let compileAndRun =
        \ substitute(compile . ' && ', 'true.*', '', 'g') . run

  execute 'w'
  execute '! ' . compileAndRun
endfunction

