" Vim syntax file
" Language: luna
" Maintainer: Safin Albert
" Latest Revision: 15 January 2015

if exists("b:current_syntax")
  finish
endif
let b:current_syntax = "luna"

setlocal matchpairs=(:),{:}

syn match lunaComment "//.*$"
syn match lunaHashTag "#\(\w\|_\)\+"
syn match lunaConst "$\(\w\|_\)\+"
syn match lunaNumber '\d\+'

syn region lunaString start=+"+ end=+"+

syn match lunaPpDirective '^##.*$'

syn keyword lunaKeywords import sub cf df if while for as
syn keyword lunaTypes int name value real string

syn match lunaCall '[a-zA-Z_0-9]\+\( *(\)\@='

hi def link lunaString      String
hi def link lunaPpDirective PreProc
hi def link lunaComment     Comment
hi def link lunaHashTag     Comment
hi def link lunaConst       Constant
hi def link lunaKeywords    Keyword
hi def link lunaTypes       Type
hi def link lunaCall        Function
