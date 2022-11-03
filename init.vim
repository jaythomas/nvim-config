" set the runtime path to include Vundle and initialize
call plug#begin('~/.local/share/nvim/plugged')

Plug 'cespare/vim-toml'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'digitaltoad/vim-pug'
Plug 'editorconfig/editorconfig-vim'
Plug 'elixir-lang/vim-elixir'
Plug 'elzr/vim-json'
"Plug 'flazz/vim-colorschemes'
Plug 'gisraptor/vim-lilypond-integrator'
"Plug 'gregsexton/MatchTag' " Doesn't work half the time
Plug 'groenewege/vim-less'
Plug 'jaythomas/rhai.vim'
Plug 'jaythomas/vim-yaml'
Plug 'jparise/vim-graphql'
Plug 'junegunn/goyo.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'kburdett/vim-nuuid'
Plug 'kylef/apiblueprint.vim'
Plug 'lilydjwg/colorizer'
Plug 'leafgarland/typescript-vim'
Plug 'leafo/moonscript-vim'
Plug 'mattn/emmet-vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'posva/vim-vue'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html']
  \ }
Plug 'romainl/flattened' " True color scheme
Plug 'ruanyl/coverage.vim'
Plug 'scrooloose/nerdtree'
Plug 'slim-template/vim-slim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tikhomirov/vim-glsl'
Plug 'timcharper/textile.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'vhda/verilog_systemverilog.vim'
Plug 'w0rp/ale'
Plug 'webastien/vim-ctags'

call plug#end()

filetype plugin on
syntax on

" Good ol settings
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set expandtab
set ignorecase
set nohlsearch
set noincsearch
set mouse=
set ruler
set relativenumber
set scrolloff=12
set smartcase
set smartindent
set tabstop=2
"set termguicolors
set shiftwidth=2

" Backspace to insert
nnoremap <BS> i
" Copy text to system clipboard
vnoremap  <leader>y  "+y
" Paste (though shift+ctrl+v does the job too)
nnoremap <leader>p "+p

" Folding
set foldmethod=syntax "fold based on indent
set foldnestmax=5     "deepest fold level
set foldlevel=5

autocmd BufNewFile,BufRead *.slim set syntax=slim|set ft=slim

" Maps
map <C-t> :NERDTreeToggle<CR>
" Keys to delete text (as opposed to cutting with D)
nmap X "_d
nmap XX "_dd
vmap X "_d
vmap x "_d
" have x (removes single character) not go into the default registry
nnoremap x "_x

" Insert a single character
noremap f i <Esc>r

" lilypond compile
noremap <leader>r :!lilypond %<Enter><Enter>

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
:command Xmllint %!xmllint --format %

" NERDTree
"autocmd vimenter * NERDTree " Auto-start NERDtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " Auto-close vim if NERDTree's buffer is the only one open
let g:NERDTreeWinSize = 48
let g:NERDTreeMinimalMenu=1

" ctrl-p
autocmd vimenter * wincmd p
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc$|bower_components\|coverage\|dist\|jsdocs\|node_modules\|tmp\|vendor',
  \ 'file': '\.exe$\|\.so$\|\.dat$|\.png$|\.jpg$|\.jpeg$|\.svg$|\.gif$|\.flv$|\.webm$'
  \ }
let g:ctrlp_show_hidden = 1

"ALE
let g:ale_linters = {
  \ 'javascript': ['eslint'],
  \ 'scss': ['stylelint']
  \ }
let g:ale_fix_on_save = 0

" coverage.vim
let g:coverage_json_report_path = 'coverage/coverage-final.json'

" vim-json
let g:vim_json_syntax_conceal = 0

" vim-markdown
let g:vim_markdown_folding_disabled=1

" vim-vue
let g:vue_pre_processors = 'detect_on_enter'

" Set a 24-bit color scheme
"colorscheme flattened_dark
"set termguicolors

" 256-color scheme
colorscheme grb256

hi ErrorMsg   ctermfg=red     ctermbg=none  guifg=red      guibg=none  gui=none
hi WarningMsg ctermfg=yellow  ctermbg=none  guifg=yellow   guibg=none  gui=none
hi DiffAdd    ctermfg=green   ctermbg=none  guifg=green    guibg=none  gui=none
hi DiffChange ctermfg=blue    ctermbg=none  guifg=blue     guibg=none  gui=none
hi DiffDelete ctermfg=red     ctermbg=none  guifg=red      guibg=none  gui=none
hi SpellBad   ctermfg=red     ctermbg=none  guifg=red      guibg=none  gui=none
hi SpellCap   ctermfg=red     ctermbg=none  guifg=red      guibg=none  gui=none
hi SpellRare  ctermfg=red     ctermbg=none  guifg=red      guibg=none  gui=none
