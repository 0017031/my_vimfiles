" Vim syntax file
" Language: common log file
" Latest Revision: 0.001, 2017.03.29 

if exists("g:commonLog_syntax_parsed") 
	finish
endif
let  g:commonLog_syntax_parsed=1

syn keyword clfInclude contained include
syn match clfComment "#.*$" contains=clfInclude

"----------------------------------------------------------------
" Celestia Star Catalog Numbers
" ----------------------------------------------------------------

" Regular int like number with - + or nothing in front
" syn match celNumber '\d\+' contained display
" syn match celNumber '[-+]\d\+' contained display

" " Floating point number with decimal no E or e (+,-)
" syn match celNumber '\d\+\.\d*' contained display
" syn match celNumber '[-+]\d\+\.\d*' contained display

" " Floating point like number with E and no decimal point (+,-)
" syn match celNumber '[-+]\=\d[[:digit:]]*[eE][\-+]\=\d\+' contained display
" syn match celNumber '\d[[:digit:]]*[eE][\-+]\=\d\+' contained display

" " Floating point like number with E and decimal point (+,-)
" syn match celNumber '[-+]\=\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+' contained display
" syn match celNumber '\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+' contained display

" syn region celString start='"' end='"' contained
" syn region celDesc start='"' end='"'

" syn match celHip '\d\{1,6}' nextgroup=celString
" syn region celDescBlock start="{" end="}" fold transparent contains=ALLBUT,celHip,celString

" syn keyword celBlockCmd RA Dec Distance AbsMag nextgroup=celNumber
" syn keyword celBlockCmd SpectralType nextgroup=celDesc


