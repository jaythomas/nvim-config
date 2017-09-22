" set the runtime path to include Vundle and initialize
call plug#begin('~/.local/share/nvim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'elixir-lang/vim-elixir'
Plug 'elmcast/elm-vim'
Plug 'flazz/vim-colorschemes'
Plug 'gregsexton/MatchTag'
Plug 'groenewege/vim-less'
Plug 'iCyMind/NeoSolarized'
Plug 'kchmck/vim-coffee-script'
Plug 'leafgarland/typescript-vim'
Plug 'leafo/moonscript-vim'
Plug 'mattn/emmet-vim'
Plug 'millermedeiros/vim-esformatter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'slim-template/vim-slim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tikhomirov/vim-glsl'
Plug 'timcharper/textile.vim'
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'

call plug#end()

filetype plugin on
syntax on

" Good ol settings
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set expandtab
set ignorecase
set nohlsearch
set noincsearch
set mouse-=a
set ruler
set relativenumber
set scrolloff=12
set smartcase
set smartindent
set tabstop=2
set termguicolors
set shiftwidth=2

nnoremap <BS> i

" Folding
set foldmethod=syntax "fold based on indent
set foldnestmax=5     "deepest fold level
set foldlevel=5

autocmd BufNewFile,BufRead *.slim set syntax=slim|set ft=slim

nmap <leader>r :w <CR> :!ruby %<CR>

" Halve/double whitespave indentation
nnoremap <silent> <leader>>    :call Preserve('%s/^\s*/&&/')<cr>
nnoremap <silent> <leader><lt> :call Preserve('%s/^\(\s*\)\1/\1/')<cr>
function! Preserve(cmd)
  let [s, c] = [@/, getpos('.')]
  exe a:cmd
  let @/ = s
  call setpos('.', c)
endfunction

"Custom commands
:command Q q
:command QA qa
:command Qa qa
:command W w
:command WQ wq
:command Wq wq

" Plugin specific
autocmd vimenter * NERDTree
autocmd vimenter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:ale_linters = {
  \ 'javascript': ['eslint']
  \ }
let g:elm_format_autosave = 1
let g:elm_format_fail_silently = 1
let g:elm_syntastic_show_warnings = 1
let g:NERDTreeWinSize = 36
let g:vim_markdown_folding_disabled=1

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc$|bower_components\|dist\|node_modules\|vendor',
  \ 'file': '\.exe$\|\.so$\|\.dat$|\.png$|\.jpg$|\.jpeg$|\.svg$|\.gif$|\.flv$|\.webm$'
  \ }

" Set a 24-bit color scheme
"set background=dark
"colorscheme NeoSolarized

" 256-color scheme
colorscheme grb256
