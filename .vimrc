"Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" setting path for vim vundle
set rtp+=~/.vim/bundle/Vundle.vim
" begin the vundle call
call vundle#begin()

" All the Vundle plugins:
" =======================
Plugin 'VundleVim/Vundle.vim'
" plugin for browsing files in vim in the side window pane
Plugin 'scrooloose/nerdtree'
" a Git wrapper
Plugin 'tpope/vim-fugitive'
" simple quoting/parenthesizing
Plugin 'tpope/vim-surround'
" Vim plugin, insert or delete brackets, parens, quotes in pair
Plugin 'jiangmiao/auto-pairs'
" code-completion engine for vim
Plugin 'Valloric/YouCompleteMe'
" Fuzzy file, buffer, mru, tag, etc finder.
Plugin 'ctrlpvim/ctrlp.vim'

" End call to vundle
call vundle#end()

filetype plugin indent on

" YouCompleteMe settings
" ======================
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tag_files = 1

" turn on syntax highlight
" ========================
syntax on

set shiftwidth=4 softtabstop=4 expandtab

set tabstop=4

" Line number display in Vim
set number

" Set background as dark for better display
set background=dark

set autoindent
set cindent

" no map for 'recording' in vim
map q <Nop>

" Display curson in the middle of screen (currently not preferred)
"set so=999

" Scrolling
set scrolloff=5                 " Keep at least 5 lines above/below
set sidescrolloff=5             " Keep at least 5 lines left/right

noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Introduces 'red color' when white-space occurs
" ==============================================
if has('gui_running')
	hi WhiteSpaceEOL guibg=#FF0000
else
	hi WhiteSpaceEOL ctermbg=Red
endif
match WhitespaceEOL /\s\+\%#\@<!$/

" don't have close and re-open the file when I do changes
autocmd! bufwritepost .vimrc source %

" Better copy and paste
set pastetoggle=<F2>
set clipboard=unnamed

" setting spelling checker for *.txt and extensionless files
" ==========================================================
" setting spell checker all file with US English as language
"set spell spelllang=en_us
"au BufEnter *.* set nospell
" setting spell cheker for .txt files
au BufEnter *.txt set spell spelllang=en_us

" changes in file are automatically displayed
" ===========================================
set autoread

" Show filename at the bottom
set laststatus=2

" mapping the `\n` key for the previous tab and :tabp
" `\m` key for the next tab opened using :tabn
" `\` is the default Leader key
map <LEADER>n <esc>:tabprevious<CR>
map <LEADER>m <esc>:tabnext<CR>
