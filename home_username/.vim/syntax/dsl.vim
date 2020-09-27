let b:current_syntax = "dsl"

syn match dslNumber "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
syn region dslString start=+"+ skip=+\\\\\|\\"+ end=+"\|$+

syn keyword dslCommentTodo TODO FIXME XXX TBD contained
syn match dslLineComment "\/\/.*" contains=dslCommentTodo

syn keyword dslConditional if else
syn keyword dslKeyword context external start node do transitions set done wait

syn keyword dslFunction function
syn match dslBraces "[{}\[\]()]"
syn match dslDelimiter "[;:]"

syn match dslVariable "\$\w\+\>"
syn match dslSyscall "#\w\+\>"
syn keyword dslType string

hi def link dslNumber Number
hi def link dslLineComment Comment
hi def link dslCommentTodo Todo
hi def link dslConditional Conditional
hi def link dslKeyword Keyword
hi def link dslFunction Function
hi def link dslBraces Operator
hi def link dslVariable Identifier
hi def link dslType Type
hi def link dslString String
hi def link dslSyscall Operator
hi def link dslDelimiter Delimiter
