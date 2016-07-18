" Vim syntax file
" Language: Summer School 2016 Parallel Programming Language
" Maintainer: Igor Kislitsyn
" Latest Revision: 12 July 2016

if exists("b:current_syntax")
	finish
endif

let b:current_syntax = "ss"

" got it from github.com/justinmk/vim-syntax-extra
syn match ssOperator "\(<<\|>>\|[-+*/%&^|<>!=]\)="
syn match ssOperator "<<\|>>\|&&\|||\|++\|--\|->"
syn match ssOperator "[.!~*&%<>^|=,+-]"
syn match ssOperator "/[^/*=]"me=e-1
syn match ssOperator "/$"
syn match ssOperator "&&\|||"
syn match ssOperator "[][]"

syn keyword ssKeyword if fi else while done return func proc import
syn keyword ssType void int real string byte
syn match ssNumber '\d\+\(\.\d\+\)\='
syn match ssComment '#.*$'
syn match ssFunction '\w\+\((\)\@='
syn match ssProcess '\w\+\(:\)\@='
syn match ssFilename '<\w\+>'
syn region ssString start=/"/ skip=/\\"/ end=/"/

hi link ssKeyword Keyword
hi link ssType Type
hi link ssNumber Number
hi link ssComment Comment
hi link ssFunction Function
hi link ssProcess Function
hi link ssString String
hi link ssFilename String
hi link ssOperator Operator
