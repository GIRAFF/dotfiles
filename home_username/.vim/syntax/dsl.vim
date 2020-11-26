let b:current_syntax = "dsl"

syn match dslNumber "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
syn region dslString start=+"+ skip=+\\\\\|\\"+ end=+"\|$+

syn keyword dslCommentTodo TODO FIXME XXX TBD contained
syn match dslLineComment "\/\/.*" contains=dslCommentTodo
syn region dslComment start="/\*" end="\*/" contains=dslCommentTodo

syn keyword dslConditional if else
syn keyword dslKeyword context external start node do transitions set done wait
syn keyword dslKeyword goto on digression priority output input import onexit
syn keyword dslKeyword conditions enable disable save apply return exit library
syn keyword dslKeyword preprocessor for while var block type
syn keyword dslBoolean true false null
"syn keyword dslNull null

syn keyword dslFunction function
syn match dslBraces "[{}\[\]()]"
syn match dslDelimiter "[;:]"

syn match dslVariable "\$\w\+\>"
syn match dslSyscall "#\w\+\>"
syn match dslTransition "\w\+\>:"
syn keyword dslType string boolean number unknown

hi def link dslNumber Number
hi def link dslLineComment Comment
hi def link dslComment Comment
hi def link dslCommentTodo Todo
hi def link dslConditional Conditional
hi def link dslKeyword Keyword
hi def link dslFunction Function
hi def link dslBraces Operator
hi def link dslVariable Identifier
hi def link dslType Type
hi def link dslString String
hi def link dslSyscall Operator
hi def link dslTransition Operator
hi def link dslDelimiter Delimiter
hi def link dslBoolean Boolean
"hi def link dslNull Label
