" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

let mapleader=","

"-----------------------------------------------

set nocompatible
set background=dark
set t_Co=256
set textwidth=120
set t_ut=

set linebreak " turn on word wrapping

set tabstop=2
set softtabstop=0 noexpandtab "number of spaces per tab when editing a file
set expandtab "turn <TAB> into 4 spaces. Good for python and bash
set shiftwidth=2

set relativenumber " Show relative numbers
set number " Show line numbers

set showcmd "show command in bottom bar

syntax on "enable syntax highlighting
set wildmenu "enable commmand line completion

set lazyredraw " redraw only when you have to. Can make things faster

set showmatch " Highlights matching parenthases

set incsearch " search as characters are entered
set hlsearch  " highlight matches

"map Ctrl-L in command mode to turn off highlighting after search.
nnoremap <C-L> :nohl<CR><C-L>

set ignorecase " case insensitive search
set smartcase

set backspace=indent,eol,start " allow backspacing over autoindent
set autoindent " when opening a new line, keep the same indent as the previous line,
	       " unless there's a filetype specific indentation. i.e. after an
	       " open curly brace
	       
set nostartofline " stop cursor from going to start of line when scrolling down
set ruler " Display cursor position in status line. Better readability

set laststatus=2 " always display status line, even if there's only 1 window.  Can be changed if you want

set confirm " ask if you wish to save changes to file instead of failing command
set visualbell " get visuals instead of beeping when doing something wrong
set t_vb= " don't visual bell either.

set mouse=a "Enable the mouse

set cmdheight=2 "Sets the command line height to 2 lines

set modelines=0 "special comments at the end of the file that allow certain settings to only be for this file

set foldenable " enable folding. ie. you can minimize your functions
set foldlevelstart=10 "open up to 5 folds when opening file
set foldmethod=indent "tells vim where to fold. Syntax is also an option, as well as some others

set rtp +=~/.fzf

"-------------------PLUGINS---------------------

call plug#begin('~/.vim/bundle')


" Automation
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'
Plug 'godlygeek/tabular'

" Integration
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-fugitive'

" Languages
Plug 'kchmck/vim-coffee-script'
Plug 'elixir-lang/vim-elixir'
Plug 'rust-lang/rust.vim'
Plug 'yalesov/vim-emblem'
Plug 'tpope/vim-rails'
Plug 'leafgarland/typescript-vim'

" Navigation
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'

" Easy Tags
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'

" Color Schemes
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'vim-airline/vim-airline'
Plug 'zcodes/vim-colors-basic'
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'

" All of your Plugins must be added before the following line
call plug#end()

" Filetypes

filetype on
filetype indent on "Sets filetype-specific indents
filetype plugin on "Sets filetype-specific indents

" ColorScheme
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'soft'
let g:airline_theme="gruvbox"

" filenames like *.xml, *.html, *.xhtml, ...
" Then after you press <kbd>&gt;</kbd> in these files, this plugin will try to close the current tag.
"
let g:closetag_filenames = '*.html.eex, *.html.erb, *.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non closing tags self closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" YCM
let g:ycm_autoclose_preview_window_after_insertion  = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_confirm_extra_conf = 0

"-------------------MAPPINGS--------------------

nnoremap ;; :s/\v(.)$/\=submatch(1)==';' ? '' : submatch(1).';'<CR> :noh <CR> " toggle semicolon at end of line

" Allow jj to trigger ESC
imap jj <Esc>

" Nerd Tree
map <C-n> :NERDTreeToggle<CR>

map Y y$
if executable('rg')
  set grepprg=rg\ --vimgrep
endif

augroup myvimrc
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l*    lwindow
augroup END"
" Vim Autocompletion Configuration

let g:ycm_global_ycm_extra_conf = '~/.ycm_global_ycm_extra_conf'
let g:ycm_rust_src_path = '/home/ftlc/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'



nnoremap <leader>b :ls<CR>:b<space>

nnoremap <leader>w :w<CR>

nnoremap <leader>f :find<space>
nnoremap <leader>s :sfind<space>
nnoremap <leader>v :vert sfind<space>
nnoremap <leader>g :grep!<space>

" Tags
nnoremap <leader>t :tag<space>
nnoremap <leader>tn :tnext<CR>
nnoremap <leader>tp :tprev<CR>
nnoremap <leader>p :pop<CR>

" Tabular
vnoremap <leader>t :Tabular<space> /

" File Open
nnoremap <leader>F :Files<CR>
nnoremap <leader>S :sp<CR>:Files<CR>
nnoremap <leader>V :vs<CR>:Files<CR>

nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Grip
nnoremap <leader>G :!i3-msg split v && i3-msg exec "urxvt -e sh -c 'wait $(grip -b %:p)'"<CR>

" Panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set path+=$PWD/**

autocmd FileType ruby compiler ruby

let g:fzf_nvim_statusline = 1


" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
"-----------------------------------------------
