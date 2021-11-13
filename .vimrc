""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Filename: .vimrc                                                         "
" Maintainer: Sandeep Pradhan                                                "
""        URL:                                                               "
"                                                                            "
"                                                                            "
"                                                                            "
" Sections:                                                                  "
"   01. General ................. General Vim behavior                       "
"   02. Events .................. General autocmd events                     "
"   03. Theme/Colors ............ Colors, fonts, etc.                        "
"   04. Vim UI .................. User interface behavior                    "
"   05. Text Formatting/Layout .. Text, tab, indentation related             "
"   06. Language Support ........ Any custom command aliases                 "
"   07. Plugin specific config                                               "
"
"
"
" Brief help
" :PlugInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PlugSearch foo - searches for foo; append `!` to refresh local cache
" :PlugClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
"
"
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""i


" plugins
let need_to_install_plugins = 0
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
         \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
     "autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
     let need_to_install_plugins = 1
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 01. General                                                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set nocompatible         " get rid of Vi compatibility mode. SET FIRST!
let mapleader = ","      " change default leader key
set history=1000         " Increase command history limit
set splitbelow           " Create new horizontal windows below
set splitright           " Create new horizontal windows to the right

" mouse
set mouse=a
let g:is_mouse_enabled = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 02. Events                                                                 "
" Initiate pathogen before enabling filetype detection

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'ap/vim-buftabline'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/The-NERD-tree'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/indentpython.vim'
Plug 'lepture/vim-jinja'
Plug 'pangloss/vim-javascript'
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'davidhalter/jedi-vim'
Plug 'vim-airline/vim-airline'
call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on " filetype detection[ON] plugin[ON] indent[ON]

" In Makefiles DO NOT use spaces instead of tabs
autocmd FileType make setlocal noexpandtab
" In Ruby files, use 2 spaces instead of 4 for tabs
autocmd FileType ruby setlocal sw=2 ts=2 sts=2

" Enable omnicompletion (to use, hold Ctrl+X then Ctrl+O while in Insert mode.
set ofu=syntaxcomplete#Complete

" Enable spell check on commit message
autocmd BufNewFile,BufRead COMMIT_EDITMSG set spell

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 03. Theme/Colors                                                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256              " enable 256-color mode.
syntax enable             " enable syntax highlighting (previously syntax on).
"colorscheme Tomorrow-Night-Eighties       " set colorscheme
"colorscheme Tomorrow                      " set colorscheme


" Prettify Markdown files
"augroup markdown
"   au!
"  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
"augroup END

" Highlight characters that go over 80 columns (by drawing a border on the 81st)
if exists('+colorcolumn')
  set colorcolumn=81
  highlight ColorColumn ctermbg=grey
else
  highlight OverLength ctermbg=red ctermfg=white guibg=#592929
  match OverLength /\%81v.\+/
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 04. Vim UI                                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=5           " minimal number of lines before and after cursor
set number                " show line numbers
set numberwidth=2         " make the number gutter 6 characters wide
set cul                   " highlight current line
set laststatus=2          " last window always has a statusline
set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set ruler                 " Always show info along bottom.
set showmatch
set visualbell
set backspace=2           " backspace over everything in insert mode
let g:airline#extensions#tabline#enabled = 1 " Vim-airline smarter tab line

" Make search results appear on the middle of the screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" move through split windows
nmap <leader><Up> :wincmd k<CR>
nmap <leader><Down> :wincmd j<CR>
nmap <leader><Left> :wincmd h<CR>
nmap <leader><Right> :wincmd l<CR>

nmap <leader>h :tabprevious<CR>
nmap <leader>l :tabprevious<CR>

" move through buffers
nmap <leader>[ :bp!<CR>
nmap <leader>] :bn!<CR>
nmap <leader>x :bd<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 05. Text Formatting/Layout                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4             " tab spacing
set softtabstop=4         " unify
set shiftwidth=4          " indent/outdent by 2 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set smartindent           " automatically insert one extra level of indentation
set smarttab              " use tabs at the start of a line, spaces elsewhere
set nowrap                " don't wrap text
set autoindent            " auto-indent
set undofile              " Maintain undo history between sessions
set undodir=~/.vim/undodir

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 06. Language support                                                       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on

"""""""""""""""""""""""""""""""Rust Setup""""""""""""""""""""""""""""""""""""
" https://github.com/rust-lang/rust.vim
let g:rustfmt_autosave=1

""""""""""""""""""""""""""""""Go lang Setup"""""""""""""""""""""""""""""""""""
autocmd Filetype go setlocal tabstop=4 shiftwidth=4 softtabstop=4
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
" go-vim plugin specific commands
" Also run `goimports` on your current file on every save
" Might be be slow on large codebases, if so, just comment it out
let g:go_fmt_command = "goimports"

" Status line types/signatures.
let g:go_auto_type_info = 1

"""""""""""""""""""""""""""""Python Setup"""""""""""""""""""""""""""""""""""""
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 07. Plugin specifc config                                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerd tree used for file browse
let NERDTreeIgnore=['\.pyc$', '__pycache__']
:nnoremap <C-g> :NERDTreeToggle<CR>


" air-line plugin specific commands
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
