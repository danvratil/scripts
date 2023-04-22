local set = vim.opt

set.encoding = 'utf-8'
set.clipboard = 'unnamed' -- system clipboard
set.number = true -- show line numbes
set.list = true
set.ruler = true -- show ruler
set.wrap = true -- enable wrapping
set.linebreak = true -- break lines at words
set.laststatus = 2 -- always display statusbar
set.showcmd = true -- show command as it's being entered
set.confirm = true -- confirm :q, :w or :wq
set.history = 50 -- keep history of 50 commands

set.textwidth = 0
set.wrapmargin = 0 -- disable line wrap
set.showbreak = '+++' -- wrap-broken line prefix
set.showmatch = true -- show matching parenthesis

set.tabstop = 4 -- columns per tab
set.softtabstop = 4 -- columns per tab in insert mode
set.shiftwidth = 4 -- columns per indent
set.expandtab = true -- converts tabs to spaces
set.shiftround = true -- when indenting, round to a multiple of shiftwidth
set.autoindent = true  -- Let vim decide indentation rules by default.
set.smartindent = true; -- enable smart indentation

set.scrolloff = 8 -- number of lines from vertical edge to start scroll
set.sidescrolloff = 15 -- number of lines from horizontal edge to start scroll
set.sidescroll = 6 -- number of columns to scroll at time

set.incsearch = true -- search as chars are entered
set.hlsearch = true -- highlight matches
set.ignorecase = true -- case-insensitive search...
set.smartcase = true -- ...except when explicitly using capital letters

set.inccommand = 'nosplit' -- make substite previews immediately

set.lazyredraw = true -- don't attempt to render macros for example
set.autoread = true -- automatically read file when edited outside of vim
set.backspace = 'indent,eol,start' -- make deleting natural

set.termguicolors = true

set.completeopt = 'menu,menuone,noselect' -- allow autocompletion

vim.notify = require('notify')

vim.filetype.add({
    extension = {
        qml = 'qmljs'
    }
})

vim.cmd('colorscheme github_dimmed')
