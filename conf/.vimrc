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

"C++
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'rdnetto/YCM-generator'

Plugin 'neoclide/coc.nvim'
Plugin 'm-pilia/vim-ccls'
Plugin 'jackguo380/vim-lsp-cxx-highlight'


Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}


Plugin 'farseer90718/vim-taskwarrior'

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
	\ 'dir': '\v[\/]\.(git|hg|svn)$|build|build-.*'
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
"let g:ycm_confirm_extra_conf = 1
"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"let g:ycm_error_symbol = '%'
"let g:ycm_warning_symbol = '%'
"let g:ycm_add_preview_to_completeopt = 1
"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_use_clangd = 1
"let g:ycm_clangd_args = ['--header-insertion=never', '--background-index' ,'--completion-style=detailed', '-j=2', '--clang-tidy']
"let s:lsp = '/home/dvratil/.vim/lsp-examples'
"let g:ycm_language_server = [
"  \   {
"  \     'name': 'bash',
"  \     'cmdline': [ 'node', expand( s:lsp . '/bash/node_modules/.bin/bash-language-server' ), 'start' ],
"  \     'filetypes': [ 'sh', 'bash' ],
"  \   },
"  \   {
"  \     'name': 'yaml',
"  \     'cmdline': [ 'node', expand( s:lsp . '/yaml/node_modules/.bin/yaml-language-server' ), '--stdio' ],
"  \     'filetypes': [ 'yaml' ],
"  \   },
"  \   {
"  \     'name': 'json',
"  \     'cmdline': [ 'node', expand( s:lsp . '/json/node_modules/.bin/vscode-json-languageserver' ), '--stdio' ],
"  \     'filetypes': [ 'json' ],
"  \   },
"  \   { 'name': 'docker',
"  \     'filetypes': [ 'dockerfile' ],
"  \     'cmdline': [ expand( s:lsp . '/docker/node_modules/.bin/docker-langserver' ), '--stdio' ]
"  \   },
"  \   { 'name': 'vim',
"  \     'filetypes': [ 'vim' ],
"  \     'cmdline': [ expand( s:lsp . '/viml/node_modules/.bin/vim-language-server' ), '--stdio' ]
"  \   },
"  \   { 'name': 'haskell',
"  \     'filetypes': [ 'haskell', 'hs', 'lhs' ],
"  \     'cmdline': [ 'hie-wrapper', '--lsp' ],
"  \     'project_root_files': [ '.stack.yaml', 'cabal.config', 'package.yaml' ]
"  \   },
"  \ ]
"
"nnoremap <leader>yj :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nnoremap <leader>yg :YcmCompleter GoTo<CR>
"nnoremap <leader>yi :YcmCompleter GoToImplementationElseDeclaration<CR>
"nnoremap <leader>yt :YcmCompleter GetTypeImprecise<CR>
"nnoremap <leader>yd :YcmCompleter GetDoc<CR>
"nnoremap <leader>yf :YcmCompleter FixIt<CR>
"nnoremap <leader>yr :YcmCompleter GoToReferences<CR>
"nnoremap <leader>ys :YcmDiags<CR>
"nnoremap <leader>yD ::YcmForceCompileAndDiagnostics<CR>
"nnoremap <leader>yR :YcmRestartServer<CR>
"nnoremap <F12> :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nnoremap <F11> :YcmCompleter GoToDeclaration<CR>
"nnoremap <F10> :YcmCompleter GetTypeImprecise<CR>
"nnoremap <F9> :YcmCompleter GetDocImprecise<CR>
"nmap <leader>D <plug>(YCMHover)
"nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
"

" COC.VIM (CCLS)
set hidden
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set signcolumn=number

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


"vim-ccls
let g:ccls_levels = 10

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

