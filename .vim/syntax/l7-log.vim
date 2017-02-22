" Vim syntax file
" Language: UTM L7 Log File
" Maintainer: Igor Kislitsyn
" Latest Revision: 20 February 2017

if exists("b:current_syntax")
	finish
endif

let b:current_syntax = "l7-log"

" Great thanks for Lech Lorens <lech.lorens@gmail.com> who made awsome xxd
" highlighting plugin
let s:cpo_save = &cpo
set cpo-=C

augroup dumphighlight
	autocmd! CursorMoved,CursorMovedI,WinEnter <buffer> call DumpHighlightMatching()
augroup END

function! DumpHighlightMatching()
	let [buf,c_lnum,col,off] = getpos('.')
	let line = substitute(getline('.'), '\v\s', ' ', 'g')

	"let addr = substitute(line, '\v(^\x+:\s+).*', '\1', '')
	let addr = substitute(line, '\v(^.+ DMP\s+).*', '\1', '')
	let addrLen = strlen(substitute(addr, '.', 'x', 'g'))

	let col -= addrLen

	3match none

	if col <= 0
		return
	endif

	let rest = substitute(line, '\v^.+ DMP\s+(.*)', '\1', '')

	" Let's check whether the cursor is in the hex representation part or in
	" the ASCII representation part of the line.

	let hexPairs = substitute(rest, '\v^(%(\x+ ?)+).*', '\1', '')
	let onlyHex = substitute(hexPairs, ' ', '', 'g')
	let hexBytes = strlen(onlyHex) / 2
	let hexPart = substitute(rest, '\v^(.*).{' . hexBytes . '}$', '\1', '')
	let hexLen = strlen(substitute(hexPart, '.', 'x', 'g'))

	if col <= hexLen
		" The cursor's in the hex part.
		let chars = split(hexPart, '\zs')
		if chars[col - 1] == ' '
			return
		endif

		let charIdx = 0
		if col > 1
			let hexBefore = substitute(hexPart, '\v^(.{' . (col - 1) . '}).*',
			            \ '\1', '')
			let onlyHex = substitute(hexBefore, ' ', '', 'g')
			let charIdx = strlen(onlyHex) / 2
		endif
		let c_col = addrLen + hexLen + charIdx + 1
		let c_after = c_col + 1
	else
		" The cursor's in the ASCII part.
		let matchOffset = 0

		let charIdx = col - hexLen - 1
		if charIdx > 0
			let hexBefore = substitute(hexPart,
			            \ '\v^(%(\x\x ?){' . charIdx . '}).*',
			            \ '\1', '')
			let matchOffset += strlen(hexBefore)
		endif
		let c_col = addrLen + matchOffset + 1
		let c_after = c_col + 2
	endif

	exe '3match MatchParen /\v%' . c_lnum . 'l%' . c_col . 'c.*\ze%' . c_after . 'c/'
endfunction

let &cpo = s:cpo_save
unlet s:cpo_save

syn keyword logKeyword INF DBG MASK OFFSET DMP
syn match logToken '^[0-9a-f]\+ '
syn match logData '[0-9]\{2\}\/[a-zA-Z]\{2,3\}\/[0-9]\{4\}'
syn match logTime '[0-9]\{1,2\}:[0-9]\{2\}:[0-9]\{2\}'
syn match logDump '\v(DMP\s+)@<=(\x{2} )+'
" TODO why is it so slow?
"syn match logDumpStr '\v(DMP.+)@<=.{16}$'
" TODO this breaks Token statements
"syn region logString start=+'+ skip=+\\'+ end=+'+

hi link logToken Keyword
hi link logData Constant
hi link logTime Constant
hi link logKeyword Operator
hi link logDump Keyword
"hi link logDumpStr String
"hi link logString String
