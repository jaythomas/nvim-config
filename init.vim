" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'calebsmith/vim-lambdify'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'elmcast/elm-vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'gregsexton/MatchTag'
Plugin 'groenewege/vim-less'
Plugin 'kchmck/vim-coffee-script'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'leafgarland/typescript-vim'
Plugin 'leafo/moonscript-vim'
Plugin 'mattn/emmet-vim'
Plugin 'millermedeiros/vim-esformatter'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'slim-template/vim-slim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'timcharper/textile.vim'
Plugin 'tpope/vim-fugitive'

call vundle#end()

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
