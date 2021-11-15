" init.vim
" keep it compatible between vim and neovim

" vim-plug plugins
call plug#begin()
" vim themes
Plug 'chriskempson/base16-vim'
call plug#end()

" vim config
" basics
set nocompatible	        " disable compatibility with vi
set encoding=utf-8

" editor settings
set showmatch               " show matching
set ignorecase              " case insensitive
set hlsearch                " highlight search
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for auto-indents
set autoindent              " indent a new line the same amount as the line just typed
set number 			        " add line numbers
set relativenumber          " display relative line numbers
set cc=120                  " set an 120 column border for good coding style
set cursorline              " highlight current cursor line
set ttyfast                 " speed up scrolling in Vim
set clipboard=unnamedplus   " using system clipboard

" file and language settings
filetype plugin on          " enable file type detection
filetype plugin indent on   " allow auto-indenting depending on file type
syntax on                   " enable syntax highlighting for languages
set spell                   " enable spell check - defaults to en-us

" fuzzy search - for files and commands
set path+=**                        " recurse subfolders for files 
set wildmode=longest:list,full      " auto-complete to the longest common substring and display a list of 
                                    " auto-complete options. Finally, if tabbed again, present a selectable list
set wildignore=*.o,*.pyc            " ignore patterns for wildcard searches 
" set wildmenu                      " present a menu for auto-complete options. for vim only!

" vim theme
set termguicolors
colorscheme base16-ocean

" custom commands
:command BgAlpha hi Normal guibg=None ctermbg=None
:command MakeTags !ctags -R .

" statusline config
" built on top of https://shapeshed.com/vim-statuslines/
" helper methods to populate statusline
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'   '.l:branchname.' ':''
endfunction

function StatuslineVenv()
  let l:venvname = system("basename $VIRTUAL_ENV 2> /dev/null | tr -d '\n'")
  return strlen(l:venvname) > 0?'   '.l:venvname.' ':''
endfunction

" draw statusline
" format:
" [optional| git branch, venv] [buffer number] [filename] [filetype] [fileformat] [%age of file] [row:col]
set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%{StatuslineVenv()}
set statusline+=%#StatusLine#
set statusline+=\ %n\ 
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c

