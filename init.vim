" set the runtime path to include Vundle and initialize
call plug#begin('~/.local/share/nvim/plugged')

Plug 'calebsmith/vim-lambdify'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'elixir-lang/vim-elixir'
Plug 'elmcast/elm-vim'
Plug 'flazz/vim-colorschemes'
Plug 'gregsexton/MatchTag'
Plug 'groenewege/vim-less'
Plug 'kchmck/vim-coffee-script'
Plug 'Lokaltog/vim-distinguished'
Plug 'leafgarland/typescript-vim'
Plug 'leafo/moonscript-vim'
Plug 'mattn/emmet-vim'
Plug 'millermedeiros/vim-esformatter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'slim-template/vim-slim'
Plug 'terryma/vim-multiple-cursors'
Plug 'timcharper/textile.vim'
Plug 'tpope/vim-fugitive'

call plug#end()

filetype plugin on
syntax on

" Good ol settings
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
:command WQ wq
:command Wq wq
:command W w
:command Q q

" Plugin specific
autocmd vimenter * NERDTree
autocmd vimenter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:elm_format_autosave = 1
let g:elm_format_fail_silently = 1
let g:elm_syntastic_show_warnings = 1
let g:NERDTreeWinSize = 36
let g:vim_markdown_folding_disabled=1
let g:syntastic_lua_checkers = ['luacheck']

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc$|\bower_components$|\node_modules$|\vendor$',
  \ 'file': '\.exe$\|\.so$\|\.dat$|\.png$|\.jpg$|\.jpeg$|\.svg$|\.gif$|\.flv$|\.webm$'
  \ }

set t_Co=256
colo grb256

hi ErrorMsg   ctermfg=red   ctermbg=none  guifg=White guibg=cyan gui=None
hi WarningMsg ctermfg=white ctermbg=cyan  guifg=White guibg=cyan gui=None
hi DiffAdd    ctermfg=green ctermbg=none
hi DiffChange ctermfg=blue  ctermbg=none
hi DiffDelete ctermfg=red   ctermbg=none
hi SpellBad   ctermfg=red   ctermbg=none
hi SellCap    ctermfg=cyan  ctermbg=none
