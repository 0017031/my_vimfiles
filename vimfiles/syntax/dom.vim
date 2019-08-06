if exists("b:current_syntax")
    finish
endif

" If the character is '@', all characters where isalpha() returns TRUE
syntax iskeyword @,0-9

":sy[ntax] keyword {group-name} [{options}] {keyword} .. [{options}]
" syntax keyword domProto  Proto  contained 
" syntax match domKeyword  "\[.*"
" syntax region domObj start='\[' end='\]'

syn match domVersion	"^#.*$" 
syn match domAttribute "\v\b\w+"
syntax region domPoint start="\[Point" end="]"
syntax region domString start="'" end="'"
highlight link domPoint Number
highlight link domString String
highlight link domVersion Comment
hi link domAttribute Identifier
   " :syntax keyword Todo    TODO    contained
   " :syntax match   Comment "//.*"  contains=Todo










let b:current_syntax = "dom"

