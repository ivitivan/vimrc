" Vundle settings
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'https://github.com/altercation/vim-colors-solarized'
Plugin 'https://github.com/mhumeSF/one-dark.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'https://github.com/ctrlpvim/ctrlp.vim'
Plugin 'https://github.com/Valloric/YouCompleteMe'
Plugin 'https://github.com/marijnh/tern_for_vim'
Plugin 'https://github.com/SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'https://github.com/scrooloose/nerdcommenter'
"Plugin 'https://github.com/jiangmiao/auto-pairs'
Plugin 'https://github.com/terryma/vim-multiple-cursors'
Plugin 'https://github.com/digitaltoad/vim-jade'
Plugin 'https://github.com/mxw/vim-jsx'
Plugin 'https://github.com/lfilho/cosco.vim'
Plugin 'https://github.com/easymotion/vim-easymotion'
Plugin 'https://github.com/tpope/vim-fugitive'
Plugin 'https://github.com/bling/vim-airline'
Plugin 'https://github.com/Raimondi/delimitMate'
Plugin 'https://github.com/tpope/vim-surround'

call vundle#end()            " required
filetype plugin indent on    " required

" UltiSnips settings
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
"let g:UltiSnipsJumpBackwardTrigger="<c-h>"

" Ctrl p Settings
if executable('ag')
	" Use Ag over Grep
	set grepprg=ag\ --nogroup\ --nocolor
	" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
	let g:ctrlp_user_command = 'ag %s --nocolor -g ""'
endif

" YouCompleteMe Settings
let g:ycm_autoclose_preview_window_after_completion=1

" Vim-jsx Settings
let g:jsx_ext_required = 0

" Cosco settings
autocmd FileType javascript,css nnoremap <silent> <Leader>; :call cosco#commaOrSemiColon()<CR>
autocmd FileType javascript,css inoremap <silent> <Leader>; <c-o>:call cosco#commaOrSemiColon()<CR>

" Airline settings
set laststatus=2


" Make paste and copy work
set clipboard+=unnamed
set clipboard=unnamedplus

" Define colorsheme and appearance
set t_Co=256
filetype plugin on
syntax on
set background=light
colorscheme solarized
set nu
" to display background properly inside tmux
set t_ut=
" Start and end characters for comments
set t_ZH=[3m " enable italics
set t_ZR=[23m " enable italics
" Italics in comments
highlight Comment cterm=italic
" Show the current line and column numbers
set ruler

" Tab settings
set tabstop=2
set shiftwidth=2
set expandtab
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
set list

" Backspace
set backspace=2

" Edit workflow
" Let vim switch between files without annoying saving message
set hidden
" Undo
set undofile
" Disable autocomments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Key bindings
" Open vimrc
nmap <Leader>v :e ~/.vimrc<cr>

" Autocmds
" Apply settings after saving
autocmd BufWritePost ~/.vimrc :so %

" Silent
"command! -nargs=1 Silent | execute ':silent !'.<q-args> | execute ':redraw!'

" Search the word on the Internet under cursor
nmap <Leader>s :silent !google-chrome 'https://google.com/\#q=<C-R><C-W>'<CR><C-L>

" fucking 80 characters
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
