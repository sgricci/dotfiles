"""""""""""""""""""" PLUGINS
set nocompatible
filetype off

set t_Co=256
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tomasr/molokai'
Plugin 'matchit.zip'
Plugin 'Lokaltog/vim-powerline'
Plugin 'kien/ctrlp.vim'
Plugin 'godlygeek/tabular'
Plugin 'chmllr/vim-colorscheme-elrodeo'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jgdavey/vim-railscasts'
Plugin 'wgibbs/vim-irblack'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'jnurmine/Zenburn'
Plugin 'endel/vim-github-colorscheme'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-scripts/AutoClose'
Plugin 'flazz/vim-colorschemes'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'mattsacks/vim-eddie'
Plugin 'nelstrom/vim-mac-classic-theme'
Plugin 'djjcast/mirodark'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'fholgado/minibufexpl.vim'
Plugin 'fatih/vim-go'
call vundle#end()            " required
"""""""""""""""""""" GLOBAL
let mapleader=","
colorscheme bubblegum
set gfn=Source\ Code\ Pro\ for\ Powerline\ 10
set go=

syntax on
filetype plugin indent on
set encoding=utf-8
set hidden
set t_vb=
set showcmd
set nowrap
set backspace=indent,eol,start
set autoindent
set copyindent
set number
set shiftround
set ignorecase
set smartcase
set hlsearch
set incsearch
set history=1000
set undolevels=1000
set title
set novisualbell
set noerrorbells
set ttyfast
set mouse=
set nocompatible
set backup
set backupdir=~/.vim_backup
set noswapfile
set fileformats=unix,dos,mac
set laststatus=2
set nolist
set noexpandtab
set softtabstop=4 tabstop=4 shiftwidth=4
set ruler
set wildignore=*.swp,*.bak,js_cache*,css_cache*,*.tpl.php,data_cache*,CodeCoverage,*.pyc
set wildmode=longest,list
set clipboard=unnamedplus,unnamed,autoselect,exclude:cons\|linux

"""""""""""""""""""" KEYBINDINGS

map cc <leader>c<space>
map  # {v}! par 72<CR>
map  & {v}! par 72j<CR>
map  <F6> :setlocal spell! spelllang=en<CR>
map  <F2> :set cc=81<CR>
map  <F12> :set invhls<CR>
cmap <C-g> <C-u><ESC>
map <C-t> :tabnew<CR>
command! -bang W w<bang>

"""""""""""""""""""" PLUGINS

let g:Powerline_symbols = 'fancy'
let g:CommandTMaxFiles=50000
let g:CommandTMaxHeight=48
map <C-o> :CtrlP<CR>
map <leader>t :CtrlP<CR>
let g:CommandTAcceptSelectionMap = '<CR>'
let g:CommandTCancelMap = '<Esc>'

"""""""""""""""""""" CUSTOM FUNCTIONS

""" Toggle relative/absolute numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <F10> :call NumberToggle()<cr>
nnoremap <Leader>m :MirodarkToggleHigherContrastMode<CR>

""" FocusMode
function! ToggleFocusMode()
  if (&foldcolumn != 12)
    set laststatus=0
    set numberwidth=10
    set foldcolumn=12
    set noruler
    hi FoldColumn ctermbg=none
    hi LineNr ctermfg=0 ctermbg=none
    hi NonText ctermfg=0
  else
    set laststatus=2
    set numberwidth=4
    set foldcolumn=0
    set ruler
    execute 'colorscheme ' . g:colors_name
  endif
endfunc
nnoremap <F1> :call ToggleFocusMode()<cr>

"Space/Tab conversion
command! -range=% -nargs=0 Tab2Space execute "<line1>,<line2>s/^\\t\\+/\\=substitute(submatch(0), '\\t', repeat(' ', ".&ts."), 'g')"
command! -range=% -nargs=0 Space2Tab execute "<line1>,<line2>s/^\\( \\{".&ts."\\}\\)\\+/\\=substitute(submatch(0), ' \\{".&ts."\\}', '\\t', 'g')"

autocmd BufRead *.tpl :set filetype=html
autocmd BufRead *.go :set filetype=go
autocmd BufRead *.mako :set filetype=html
autocmd BufRead,BufNewFile *.md :set filetype=markdown

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
map ; :

let g:ctrlp_working_path_mode = '1'
nmap <Tab> :bn<CR>
nmap <S-Tab> :bp<CR>
