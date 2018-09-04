set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'scrooloose/nerdTree'
Plugin 'scrooloose/syntastic'

Plugin 'Valloric/YouCompleteMe'

Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

Plugin 'majutsushi/tagbar'

call vundle#end()            " required

filetype plugin indent on    " required
filetype plugin on

"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
"                     auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" General
set number		" show line numbers
set ruler
set wrap		" enable wrapping
set linebreak		" break lines at words
set nolist		" list disables nobreak
set scrolloff=5		" 2 lines above/below cursor when scrolling
set laststatus=2        " always display statusbar

set textwidth=0
set wrapmargin=0	" disable line wrap
set showbreak=+++	" wrap-broken line prefix
set showmatch		" show matching parenthesis

set autoindent		" auto-indent ne wlines
set expandtab		" use spaces instead of tabs
set shiftwidth=4	" auto-indent spaces
set smartindent		" enable smart-indent
set smarttab		" enable smart-tab
set softtabstop=4	" number of spaces per tab
set wildmenu		" visual autocomplete for menu
set wildignore+=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn,*/cm/log/**,tags,*.jpg,*.png,*.jpeg,*.png,*.mesh,build*/**,build/**,*.sublime-workspace,*.svg,build2/**,build3/**
set confirm		" confirm :q, :w or :wq
set history=50		" keep history of 50 commands

set tags=./.tags;/	" will look for .tags file in cwd and all the way up to root
set cscopetag


" CtrlP
nnoremap <leader>. :CtrlPTag<cr>

" Tagbar
nmap <silent> <F3> :TagbarToggle<CR>
nmap <silent> <F5> :TagbarOpenAutoClose<CR>
let g:tagbar_case_insensitive = 1
" let g:tagbar_compact = 1
let g:tagbar_indent = 1
let g:tagbar_map_showproto = "r"
let g:tagbar_map_togglefold = "<space>"
let g:tagbar_sort = 0

" Syntastic
let g:syntastic_cpp_compiler_options = "-std=c++17"

" NerdTree
:nmap \e :NERDTreeToggle<CR>

" Moving
" move to beginning/end of line
nmap <Home> ^
nmap <End> $

" Advanced
set backspace=indent,eol,start  "Backspace behaviour

" YCM
" http://stackoverflow.com/questions/3105307/how-do-you-automatically-remove-the-preview-window-after-autocompletion-in-vim
" :h ins-completion.
" :YcmDiags - errors
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_error_symbol = '%'
let g:ycm_warning_symbol = '%'
nnoremap <leader>yj :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>yg :YcmCompleter GoTo<CR>
nnoremap <leader>yi :YcmCompleter GoToImplementationElseDeclaration<CR>
nnoremap <leader>yt :YcmCompleter GetTypeImprecise<CR>
nnoremap <leader>yd :YcmCompleter GetDoc<CR>
nnoremap <leader>yf :YcmCompleter FixIt<CR>
nnoremap <leader>yr :YcmCompleter GoToReferences<CR>
nnoremap <leader>ys :YcmDiags<CR>
nnoremap <leader>yD ::YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>yR :YcmRestartServer<CR>
nnoremap <F12> :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <F10> :YcmCompleter GetTypeImprecise<CR>
nnoremap <F9> :YcmCompleter GetDocImprecise<CR>
"nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>


