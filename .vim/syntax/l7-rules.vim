" Vim syntax file
" Language: UTM L7 Rules File
" Maintainer: Igor Kislitsyn
" Latest Revision: 16 November 2016

if exists("b:current_syntax")
	finish
endif

let b:current_syntax = "l7-rules"

syn match rulesComment '//.*'
syn region rulesComment start='/\*' end='\*/'
syn match rulesOperator '[{}=\[\]?,*()]'
syn keyword rulesOperator or and not at after before in 
syn match rulesBlock '\w\+\(\n*\s*\n*{\)\@='
syn keyword rulesKeyword id priority strings condition
syn match rulesVar '\$\w\+'
syn region rulesString start=/"/ skip=/\\"/ end=/"/
syn match rulesNumber '\d\+\(\.\d\+\)\='
syn match rulesHex '[a-fA-F0-9]\+'

hi link rulesComment Comment
hi link rulesOperator Operator
hi link rulesBlock Function
hi link rulesKeyword Keyword
hi link rulesVar Identifier
hi link rulesString String
hi link rulesNumber Number
hi link rulesHex Number
