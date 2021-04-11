" ================================================================================ 
" ================================================================================ 
" File:    .vimrc
" Date:    January 3, 2021
" Purpose:  This file contains all information necessary to format and operate
"           the vim text editor
" Author:   Jonathan A. Webb
" Copyright: Copyright 2021, Jon Webb Inc.
" Version:   1.0
" ================================================================================ 
" ================================================================================ 
" 1. Basic information and expressions


set nocompatible
filetype off

iab <expr> r80= repeat('=', 80)
iab <expr> r80- repeat('-', 80)
iab <expr> shebang repeat('#!/bin/bash', 1)

" ================================================================================ 
" ================================================================================ 
" 2. Load packages using Vundle Package Manager

" 1.a. Instantiate Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" 1.b. Installed first for an order issue
Plugin 'ervandew/supertab'

" 1.c. Installs Powerline capabilties
Plugin 'VundleVim/Vundle.vim'
Plugin 'fisadev/FixedTaskList.vim'
Plugin 'christoomey/vim-tmux-navigator'
" -------------------------------------------------------------------------------- 
" 1.d. git interface bundle

Plugin 'tpope/vim-fugitive'
"Plugin 'Rykka/riv.vim'
" -------------------------------------------------------------------------------- 
" 0. NERDTree functions
Plugin 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
let g:WebDevIconsOS = 'Darwin'
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1
let NERDTreeDirArrowExpandable = "\u00a0" " make arrows invisible
let NERDTreeDirArrowCollapsible = "\u00a0" " make arrows invisible
let NERDTreeNodeDelimiter = "\u263a" " smiley face

augroup nerdtree
    autocmd!
    autocmd FileType nerdtree setlocal nolist " turn off whitespace characters
    autocmd FileType nerdtree setlocal nocursorline " turn off line highlighting for performance
augroup END

" Toggle NERDTree
function! ToggleNerdTree()
    if @% != "" && @% !~ "Startify" && (!exists("g:NERDTree") || (g:NERDTree.ExistsForTab() && !g:NERDTree.IsOpen()))
        :NERDTreeFind
    else
        :NERDTreeToggle
    endif
endfunction
" toggle nerd tree
nmap <silent> <leader>n :call ToggleNerdTree()<cr>
" find the current file in nerdtree without needing to reload the drawer
nmap <silent> <leader>y :NERDTreeFind<cr>

let NERDTreeShowHidden=1
 let NERDTreeDirArrowExpandable = '▷'
 let NERDTreeDirArrowCollapsible = '▼'

let g:NERDTreeGitStatusIndicatorMapCustom = {
\ "Modified"  : "✹",
\ "Staged"    : "✚",
\ "Untracked" : "✭",
\ "Renamed"   : "➜",
\ "Unmerged"  : "═",
\ "Deleted"   : "✖",
\ "Dirty"     : "✗",
\ "Clean"     : "✔︎",
\ 'Ignored'   : '☒',
\ "Unknown"   : "?"
\ }


" -------------------------------------------------------------------------------- 
" 1.e. filesystem bundles

"Plugin 'kien/ctrlp.vim' 
" -------------------------------------------------------------------------------- 
" 1.f. html bundles

Plugin 'jtratner/vim-flavored-markdown'
Plugin 'suan/vim-instant-markdown'
Plugin 'nelstrom/vim-markdown-preview'
" -------------------------------------------------------------------------------- 
" 1.g. python syntax checker bundles

Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/Pydiction'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'dense-analysis/ale'
" -------------------------------------------------------------------------------- 
" 1.h. Software Style

"Plugin 'klen/python-mode'
Plugin 'Valloric/YouCompleteMe'

let g:ycm_filetype_whitelist = {
			\ 'python': 1, 
			\ 'cpp': 1}
Plugin 'davidhalter/jedi-vim'

" 1.i. code folding
Plugin 'tmhedberg/SimpylFold'
" -------------------------------------------------------------------------------- 

" 1.j. Colors
Plugin 'joshdick/onedark.vim'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'flazz/vim-colorschemes'
" -------------------------------------------------------------------------------- 
" 1.k. Virtual Environment bundles

"Plugin 'sansyroc/vim-python-virtualenv'
Plugin 'jmcantrell/vim-virtualenv'
" -------------------------------------------------------------------------------- 
" 1.l. Add LaTeX bundle

Plugin 'vim-latex/vim-latex'
" -------------------------------------------------------------------------------- 
" 1.m. Completion Bundle
" Plugin 'neoclide/coc.nvim', {'branch': 'release'}

"let g:coc_global_extensions = [
"    \ 'coc-python',
"    \ 'coc-css',
"    \ 'coc-json',
"    \ 'coc-tsserver',
"    \ 'coc-git',
"    \ 'coc-eslint',
"    \ 'coc-tslint-plugin',
"    \ 'coc-pairs',
"    \ 'coc-sh',
"    \ 'coc-vimlsp',
"    \ 'coc-emmet',
"    \ 'coc-prettier',
"    \ 'coc-ultisnips',
"    \ 'coc-explorer',
"    \ 'coc-diagnostic'
"    \ ]

"autocmd CursorHold * silent call CocActionAsync('highlight')

" coc-prettier
"command! -nargs=0 Prettier :CocCommand prettier.formatFile
"nmap <leader>f :CocCommand prettier.formatFile<cr>

" coc-git
"nmap [g <Plug>(coc-git-prevchunk)
"nmap ]g <Plug>(coc-git-nextchunk)
"nmap gs <Plug>(coc-git-chunkinfo)
"nmap gu :CocCommand git.chunkUndo<cr>

"nmap <silent> <leader>k :CocCommand explorer<cr>

"remap keys for gotos
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"nmap <silent> gh <Plug>(coc-doHover)

" diagnostics navigation
"nmap <silent> [c <Plug>(coc-diagnostic-prev)
"nmap <silent> ]c <Plug>(coc-diagnostic-next)

" rename
"nmap <silent> <leader>c <Plug>(coc-rename)

" Remap for format selected region
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

" organize imports
"command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" Use K to show documentation in preview window
"nnoremap <silent> K :call <SID>show_documentation()<CR>

"function! s:show_documentation()
"    if (index(['vim','help'], &filetype) >= 0)
"        execute 'h '.expand('<cword>')
"    else
"        call CocAction('doHover')
"     endif
"endfunction

"tab completion
"inoremap <silent><expr> <TAB>
"    \ pumvisible() ? "\<C-n>" :
"    \ <SID>check_back_space() ? "\<TAB>" :
"    \ coc#refresh()

"function! s:check_back_space() abort
"    let col = col('.') - 1
"    return !col || getline('.')[col - 1]  =~# '\s'
"endfunction
" -------------------------------------------------------------------------------- 
"  End Vundle
call vundle#end()
" ================================================================================ 
" ================================================================================ 
" 2. General formatting
set clipboard=unnamed
set guifont=Monaco:h40
" -------------------------------------------------------------------------------- 
"  2.a. Enable powerline-status 

set rtp+=/usr.share/powerline/bindings/vim
set laststatus=2 
set t_Co=256
" -------------------------------------------------------------------------------- 
" 2.b. Set vim colorscheme

syntax on 
colorscheme onedark 
" -------------------------------------------------------------------------------- 
" 2.c. Ale Linters

let g:ale_linters = { 'python': ['flake8']}
" -------------------------------------------------------------------------------- 

" 2.d. custom keys
let mapleader=" "
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" 2.e. I don't like swap files
set noswapfile

" 2.f. turn on numbering
set nu
" ================================================================================ 
" ================================================================================ 
" 3. General Python formatting

" 3.a. Set up virtual environment
"
python3 << EOF
import os
import subprocess
if "VIRTUAL_ENV" in os.environ:
    project_base_dir = os.environ["VIRTUAL_ENV"]
    script = os.path.join(project_base_dir, "bin/activate")
    pipe = subprocess.Popen(". %s; env" % script, stdout=subprocess.PIPE, shell=True)
    output = pipe.communicate()[0].decode('utf8').splitlines()
    env = dict((line.split("=", 1) for line in output))
    os.environ.update(env)
EOF

"it would be nice to set tag files by the active virtualenv here
:set tags=~/mytags "tags for ctags and taglist
"omnicomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete

"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" For full syntax highlighting:
let python_highlight_all=1
filetype indent plugin on

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start


"Folding based on indentation:
autocmd FileType python set foldmethod=indent
"use space to open folds
nnoremap <space> za 
"----------Stop python PEP 8 stuff--------------

"js stuff"
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
" ================================================================================ 
" ================================================================================ 
" 4. vim command keys

set splitbelow
set splitright

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Better command line complete
set wildmenu

" Show partial command sin list line of screen
set showcmd

" Highlight searches use <C-L> to temporarily turn on highlighting
set incsearch
set hlsearch

" Use case insensitive search, except when using capital letters

" - Display the cursor position on the last line of the screen or in 
"   the status bar
set ruler 

" Display status line, even if only one window is displayed
set laststatus=2

" Enable mouse
set mouse=a

" - Set command window height to 2 lines, to avoid many cases of having to
"   press <enter> to continue
set ignorecase
set smartcase

" Blink curor on error, instead of beeping
set visualbell

" Highlight matching parenthesis
set showmatch

nnoremap <leader>sv :source &MYVIMRC<CR>
" ================================================================================ 
" ================================================================================ 
" 5. TMUX Config

" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
else
    let &t_SI = "\e[5 q"
    let &t_EI = "\e[2 q"
endif
" ================================================================================ 
" ================================================================================ 
" eof
