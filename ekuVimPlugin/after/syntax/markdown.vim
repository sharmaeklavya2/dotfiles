" Stock markdown.vim omits $ from its escape set (see markdownEscape); add it.
syn match markdownEscape "\\\$"

syn region markdownMath matchgroup=markdownMathDelim
      \ start="\\\@<!\$\$" end="\$\$" skip="\\\$" keepend contains=@NoSpell
syn region markdownMath matchgroup=markdownMathDelim
      \ start="\\\@<!\$\ze[^ \t$]" end="\$" skip="\\\$" keepend oneline contains=@NoSpell
syn cluster markdownInline add=markdownMath

hi def link markdownMath      Identifier
hi def link markdownMathDelim Delimiter
