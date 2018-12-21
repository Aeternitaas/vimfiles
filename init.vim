set nocompatible

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'elixir-editors/vim-elixir'
Plugin 'hashivim/vim-terraform'
Plugin 'kchmck/vim-coffee-script'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'morhetz/gruvbox'
Plugin 'majutsushi/tagbar'
Plugin 'mhinz/vim-mix-format'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-syntastic/syntastic'
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'slashmili/alchemist.vim'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-fugitive'
Plugin 'w0rp/ale'
Plugin 'shougo/deoplete.nvim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'juliosueiras/vim-terraform-completion'

call vundle#end()

filetype plugin indent on
"execute pathogen#infect()

syntax enable
filetype plugin indent on

"Deoplete
let g:deoplete#enable_at_startup = 1
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

"Ale
"let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_column_always = 1
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_javascript_eslint_use_global = 1
let g:ale_javascript_eslint_executable = 'eslint'
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'tf' : ['terraform-fmt']
\}

"Ale Elixir Workaround
"augroup AleGroup
    "autocmd!
    "autocmd User ALELint call TouchOpenFile()
"augroup END

""func! TouchOpenFile()
    "let g:ale_enabled = 0
    "sleep 500m
    "w
    "let g:ale_enabled = 1
"endfunc

"Tagbar
nmap <F8> :TagbarToggle<CR>

"TexBox
filetype plugin on
let g:tex_flavor='latex'

set t_Co=256
set noeb vb t_vb=
set background=dark
colorscheme gruvbox
let g:solarized_termcolors=256

"Gitgutter
set updatetime=100    "Lowers auto update time

"Scrooloose/Syntastic Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_javascript_eslint_exe = 'npm run lint --'
let g:syntastic_java_checkstyle_classpath = 1
let g:syntastic_disabled_filetypes=['.ex']

"CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

"NERDTree
autocmd vimenter * NERDTree
nmap <F9> :NERDTreeToggle<CR>

"Airline
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

set guifont=Hack

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

" Ctags
let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
    \ 'f:functions',
    \ 'functions:functions',
    \ 'c:callbacks',
    \ 'd:delegates',
    \ 'e:exceptions',
    \ 'i:implementations',
    \ 'a:macros',
    \ 'o:operators',
    \ 'm:modules',
    \ 'p:protocols',
    \ 'r:records',
    \ 't:tests'
    \ ]
\ }

set number
set ruler
set backspace=indent,eol,start
set showcmd
set incsearch
set hlsearch
set history=1000
set linebreak
set encoding=utf-8
set expandtab
set tabstop=2
set shiftwidth=2
set expandtab
set cursorline
set cursorcolumn
