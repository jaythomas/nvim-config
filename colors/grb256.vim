" Based on
runtime colors/ir_black.vim

let g:colors_name = "grb256"

hi pythonSpaceError ctermbg=red guibg=red

hi Comment ctermfg=darkgrey

hi StatusLine ctermbg=darkgrey ctermfg=white
hi StatusLineNC ctermbg=black ctermfg=lightgrey
hi TabLine ctermfg=lightgray ctermbg=none
hi TabLineFill ctermbg=none ctermfg=none cterm=none
hi TabLineSel ctermfg=white ctermbg=none cterm=bold
hi VertSplit ctermbg=black ctermfg=lightgrey
hi LineNr ctermfg=darkgray
hi CursorLine       guifg=none        guibg=#121212     gui=none      ctermfg=none       ctermbg=234    cterm=none
hi Function         guifg=#FFD2A7     guibg=none        gui=none      ctermfg=190        ctermbg=none   cterm=none
hi Visual           guifg=none        guibg=#262D51     gui=none      ctermfg=none       ctermbg=236    cterm=none

hi Error            guifg=none        guibg=none        gui=undercurl ctermfg=16         ctermbg=red    cterm=none     guisp=#FF6C60 " undercurl color
hi ErrorMsg         guifg=white       guibg=#FF6C60     gui=BOLD      ctermfg=16         ctermbg=red    cterm=none
hi WarningMsg       guifg=white       guibg=#FF6C60     gui=BOLD      ctermfg=16         ctermbg=red    cterm=none
hi SpellBad         guifg=white       guibg=#FF6C60     gui=BOLD      ctermfg=16         ctermbg=160    cterm=none

" ir_black doesn't highlight operators for some reason
hi Operator         guifg=#6699CC     guibg=none        gui=none      ctermfg=lightblue  ctermbg=none   cterm=none

highlight DiffAdd term=reverse cterm=bold ctermbg=lightgreen ctermfg=16
highlight DiffChange term=reverse cterm=bold ctermbg=lightblue ctermfg=16
highlight DiffText term=reverse cterm=bold ctermbg=lightgray ctermfg=16
highlight DiffDelete term=reverse cterm=bold ctermbg=lightred ctermfg=16

highlight PmenuSel ctermfg=16 ctermbg=156

" Used for statusline
hi User1 guifg=#EEA040 guibg=none ctermfg=166 ctermbg=none
hi User2 guifg=#DD3333 guibg=none ctermfg=160 ctermbg=none
hi User3 guifg=#EEEE40 guibg=none ctermfg=191 ctermbg=none
hi User4 guifg=#FFFFFF guibg=none ctermfg=15  ctermbg=none
