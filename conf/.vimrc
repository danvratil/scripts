set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'scrooloose/nerdTree'
Plugin 'jistr/vim-nerdtree-tabs'

Plugin 'thaerkh/vim-workspace'
Plugin 'ryanoasis/vim-devicons'
Plugin 'mhinz/vim-signify'
Plugin 'vim-scripts/a.vim'
Plugin 'avanzzzi/behave.vim'

"Plugin 'scrooloose/syntastic'
"Plugin 'w0rp/ale'
Plugin 'octol/vim-cpp-enhanced-highlight'

Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-generator'

Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

Plugin 'majutsushi/tagbar'
Plugin 'universal-ctags/ctags'
"Plugin 'craigemery/vim-autotag'
Plugin 'xolox/vim-misc'  " needed by easytags
Plugin 'xolox/vim-easytags'

Plugin 'jewes/Conque-Shell'

Plugin 'francoiscabrol/ranger.vim'
Plugin 'mileszs/ack.vim'
Plugin 'christoomey/vim-tmux-navigator'

" Themes
Plugin 'christophermca/meta5'
Plugin 'sts10/vim-pink-moon'
Plugin 'joshdick/onedark.vim'
Plugin 'tomasr/molokai'

" Highlighting
Plugin 'peterhoeg/vim-qml'

Plugin 'ntpeters/vim-better-whitespace'

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
"

" Use fancy colorscheme
"colorscheme meta5
"colorscheme pink-moon
let g:rehash256 = 1
colorscheme molokai

" Transparent background
hi Normal guibg=NONE ctermbg=NONE

" General
set encoding=utf-8
set clipboard=unnamed	" system clipboard
set number		" show line numbers
set ruler
set wrap		" enable wrapping
set linebreak		" break lines at words
set nolist		" list disables nobreak
set scrolloff=5		" 2 lines above/below cursor when scrolling
set laststatus=2        " always display statusbar
set showcmd             " show commadn as it's being entered

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

set foldmethod=indent   " ident-based folding
set foldlevelstart=20   " prevent folding by default

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" vim workspace
let g:workspace_autocreate = 0
let g:workspace_autosave = 0

" Ctags
set tags=./.tags  " will look for .tags file in cwd and all the way up to root
set cscopetag
nnoremap <leader>. :CtrlPTag<cr>

" autotags
"let g:autotagTagsFile=".tags"
let g:easytags_async = 1
let g:easytags_always_enabled = 1
let g:easytags_auto_highlight = 0

" Coding style for C++
au BufRead,BufNewFile *.c,*.cpp,*.cxx,*.h,*.hpp
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=100 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix |
        \ set matchpairs+=<:>

" CtrlP
nnoremap <leader>. :CtrlPTag<cr>
nnoremap <silent> <Leader>b :TagbarToggle<CR>
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
	\ 'dir': '\v[\/]\.(git|hg|svn)$|build'
	\ }

" Highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1

" Tagbar
nmap <silent> <F3> :TagbarToggle<CR>
nmap <silent> <F5> :TagbarOpenAutoClose<CR>
let g:tagbar_case_insensitive = 1
" let g:tagbar_compact = 1
let g:tagbar_indent = 1
let g:tagbar_map_showproto = "r"
let g:tagbar_map_togglefold = "<space>"
let g:tagbar_sort = 0
let g:tagbar_autoclose = 0

" Syntastic
let g:syntastic_cpp_compiler_options = "-std=c++17"

" NerdTree
map <Leader>n <plug>NERDTreeMirrorToggle<CR>

" Moving
" move to beginning/end of line
nmap <Home> ^
nmap <End> $

" Advanced
set backspace=indent,eol,start  "Backspace behaviour
map <F7> mzgg=G`z               "F7 to reindent entire document

" YCM
" http://stackoverflow.com/questions/3105307/how-do-you-automatically-remove-the-preview-window-after-autocompletion-in-vim
" :h ins-completion.
" :YcmDiags - errors
let g:ycm_confirm_extra_conf = 1
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_error_symbol = '%'
let g:ycm_warning_symbol = '%'
let g:ycm_autoclose_preview_window_after_completion = 1
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
nnoremap <F11> :YcmCompleter GoToDeclaration<CR>
nnoremap <F10> :YcmCompleter GetTypeImprecise<CR>
nnoremap <F9> :YcmCompleter GetDocImprecise<CR>
"nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>

" Highlight trailing whitespaces
set listchars=tab:▸\ ,trail:·
set list

" Case insensitive search, highlight results
set ignorecase
set hlsearch

"" Disable arrow keys in Escape mode
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>
"" Disable Arrow keys in Insert mode
"imap <up> <nop>
"imap <down> <nop>
"imap <left> <nop>
"imap <right> <nop>

" Disable mouse scrolling
nmap <ScrollWheelUp> <nop>
nmap <S-ScrollWheelUp> <nop>
nmap <C-ScrollWheelUp> <nop>
nmap <ScrollWheelDown> <nop>
nmap <S-ScrollWheelDown> <nop>
nmap <C-ScrollWheelDown> <nop>
nmap <ScrollWheelLeft> <nop>
nmap <S-ScrollWheelLeft> <nop>
nmap <C-ScrollWheelLeft> <nop>
nmap <ScrollWheelRight> <nop>
nmap <S-ScrollWheelRight> <nop>
nmap <C-ScrollWheelRight> <nop>
imap <ScrollWheelUp> <nop>
imap <S-ScrollWheelUp> <nop>
imap <C-ScrollWheelUp> <nop>
imap <ScrollWheelDown> <nop>
imap <S-ScrollWheelDown> <nop>
imap <C-ScrollWheelDown> <nop>
imap <ScrollWheelLeft> <nop>
imap <S-ScrollWheelLeft> <nop>
imap <C-ScrollWheelLeft> <nop>
imap <ScrollWheelRight> <nop>
imap <S-ScrollWheelRight> <nop>
imap <C-ScrollWheelRight> <nop>
vmap <ScrollWheelUp> <nop>
vmap <S-ScrollWheelUp> <nop>
vmap <C-ScrollWheelUp> <nop>
vmap <ScrollWheelDown> <nop>
vmap <S-ScrollWheelDown> <nop>
vmap <C-ScrollWheelDown> <nop>
vmap <ScrollWheelLeft> <nop>
vmap <S-ScrollWheelLeft> <nop>
vmap <C-ScrollWheelLeft> <nop>
vmap <ScrollWheelRight> <nop>
vmap <S-ScrollWheelRight> <nop>
vmap <C-ScrollWheelRight> <nop>

" Map :W to :w and :Wq to :wq because I sometimes don't release the shift to
" type : fast enough
:command W w
:command Wq wq

let g:ycm_rust_src_path = '/usr/lib/rustlib/src/rust/src'

" Automatically save and load folds
" augroup AutoSaveFolds
"     autocmd!
"     autocmd BufWinLeave * mkview
"     autocmd BufWinEnter * loadview
" augroup END

