" the following g:tex_fast check is borrowed from $VIMRUNTIME/syntax/tex.vim
let s:tex_fast= "bcmMprsSvV"
if exists("g:tex_fast")
    if type(g:tex_fast) != 1
        " g:tex_fast exists and is not a string, so
        " turn off all optional region-based highighting
        let s:tex_fast= ""
    else
        let s:tex_fast= g:tex_fast
    endif
endif

" highlight cref
if s:tex_fast =~# 'r'
    syn region texRefZone  matchgroup=texStatement  start="\\cref{"  end="}\|%stopzone\>"  contains=@texRefGroup
endif

" The following line is obtained by taking the corresponding line from $VIMRUNTIME/syntax/tex.vim
" and adding texRestatableOne to the `nextgroup` list.
" This change must be kept in sync with $VIMRUNTIME/syntax/tex.vim.
syn match texBeginEnd  "\\begin\>"  nextgroup=texBeginEndName,texRestatableOuter

if s:tex_fast =~# 'V'
    " these prevent spell-check in restatable's arguments
    syn match texRestatableOuter  contained "{restatable}"  nextgroup=texRestatableType,texRestatableOption  contains=texRestatableInner
    syn region texRestatableInner  contained  matchgroup=texDelimiter  start="{"  end="}"
    syn region texRestatableOption  contained  matchgroup=texDelimiter  start="\["  end="]"  nextgroup=texRestatableType
    syn region texRestatableType  contained  matchgroup=texDelimiter  start="{"  end="}"  nextgroup=texRestatableCmd
    syn region texRestatableCmd  contained  matchgroup=texDelimiter  start="{"  end="}"
endif

hi def link texRestatableInner texBeginEndName
hi def link texRestatableType  texBeginEndName
