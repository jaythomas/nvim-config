"============================================================================
"File:        mooncheck.vim
"Description: moon static analysis using mooncheck
"Maintainer:  Nymphium
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"============================================================================

if exists('g:syntastic_extra_filetypes')
    call add(g:syntastic_extra_filetypes, 'moon')
else
    let g:syntastic_extra_filetypes = ['moon']
endif

if exists("g:loaded_syntastic_moon_mooncheck_checker")
    finish
endif
let g:loaded_syntastic_moon_mooncheck_checker = 1

let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_moon_mooncheck_GetLocList() dict
    let makeprg = self.makeprgBuild({})

    let errorformat = '%t: %f:%l: %m,%f:%l %m,%-G%.%#'

    return SyntasticMake({
        \ 'makeprg': makeprg,
        \ 'errorformat': errorformat,
        \ 'subtype': 'Style',
        \ 'defaults': {'bufnr': bufnr(''), 'text': 'Syantax Error', 'type': 'W' },
        \ 'returns': [0, 1, 2] })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'moon',
    \ 'name': 'mooncheck'})

let &cpo = s:save_cpo
unlet s:save_cpo
