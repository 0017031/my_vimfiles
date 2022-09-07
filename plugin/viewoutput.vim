" viewoutput.vim Version 2.0
" Description: use ':OO myCmd' to view output of vim command in new buffer
" Author: Yakov Lerner
" Thanks to: Antony Scriven, Charles Campbell

if exists("loaded_viewoutput") | finish | endif
let loaded_viewoutput=1

let g:viewoutput_newbuffer="new+resize" "new + max_height
"let g:viewoutput_newbuffer="new"
"   g:viewoutput_newbuffer -- command to create new preview window 
"let g:viewoutput_newbuffer="5new"     | " create preview window 5 lines high
"let g:viewoutput_newbuffer="bot 5new" | " bottom preview window 5 lines high
"let g:viewoutput_newbuffer="top 5new" | " top preview window 5 lines high

function! ViewOutput(myCmd)
  let mm2 = ':'.a:myCmd	"prefix the ':' to the command, so that we don't need to type it manually
	let save_reg=@a
	redir @a
	" silent exec a:myCmd
	silent exec mm2
	redir END
	if strlen(substitute(@a, "[^\n]", "", "g")) < 4
		" fix for 'silent map' bug which produces output without newlines
		let save_more=&more "backup the 'more' setting
		set nomore
		redir @a
		exec a:myCmd
		redir END
		let &more = save_more
	endif
	exec g:viewoutput_newbuffer
	put a
	1,2g/^$/d "remove the first 2 empty lines, c.f. :[range]g[lobal]/{pattern}/[cmd]
	0 put = 'Command: ' . a:myCmd "display the command name at the top
	setfiletype vim
	set bufhidden=hide noswapfile noreadonly nomodified
	" set buftype=nofile
	let @a=save_reg
endfunction

" VO - view output of vim command in new buffer
command! -narg=+ VO :call ViewOutput(<q-args>) "use a !bang, to 'redefine' the command
command! -narg=+ OO :call ViewOutput(<q-args>)
