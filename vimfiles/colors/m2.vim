" Vim color file

" This color scheme uses a light grey background.

" First remove all existing highlighting.
set background=light

"set bg&

hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "m2"

hi Normal ctermfg=Black ctermbg=LightGrey guifg=Black guibg=Grey100

hi Pmenu guifg=Grey20 guibg=LightBlue

" Groups used in the 'highlight' and 'guicursor' options default value.
hi Comment term=standout  guifg='#10b169'
hi cCommentString term=standout  gui=NONE guifg='#00cc69' 
hi vimCommentTitle term=standout  gui=bold guifg='#003181'
hi vimCommentString term=standout  gui=bold guifg='#22a181'
hi vimCommand gui=bold guifg=brown 
hi vimHiGroup guifg='#0000cd'
hi Identifier term=standout  term=NONE cterm=NONE gui=bold guifg='#1866b5' 
hi Constant term=standout  guifg='#d11141' 

hi Statement term=NONE cterm=NONE gui=NONE ctermfg=Blue guifg='#731d1d' 
hi vimIsCommand term=NONE cterm=NONE gui=NONE ctermfg=Blue guifg='#0000cc' 


hi String term=standout ctermbg=LightGray ctermfg=DarkBlue guibg='#ececec' guifg=DarkBlue
hi Number term=standout ctermbg=Gray ctermfg=DarkRed guibg=White guifg=DarkRed gui=bold
hi ErrorMsg term=standout ctermbg=DarkRed ctermfg=White guibg=Red guifg=White
hi IncSearch term=reverse cterm=reverse gui=bold guibg=#ffc0cb
hi ModeMsg term=bold cterm=bold gui=bold
hi StatusLine term=reverse,bold cterm=reverse,bold gui=reverse,bold
hi StatusLineNC term=reverse cterm=reverse gui=reverse
hi VertSplit term=reverse cterm=reverse gui=reverse
hi Visual term=reverse ctermbg=grey guibg='#f6cee6'
hi VisualNOS term=underline,bold cterm=underline,bold gui=underline,bold
hi DiffText term=reverse cterm=bold ctermbg=Red gui=bold guibg=Red
hi Cursor guibg=Green guifg=NONE
hi lCursor guibg=Cyan guifg=NONE
hi Directory term=bold ctermfg=DarkBlue guifg=Blue
hi LineNr term=underline ctermfg=Brown guifg=Grey50 guibg=Grey93
hi MoreMsg term=bold ctermfg=DarkGreen gui=bold guifg=SeaGreen
hi NonText term=bold ctermfg=Blue gui=bold guifg=DarkYellow guibg=Grey98
hi Question term=standout ctermfg=DarkGreen gui=bold guifg=SeaGreen
hi Search term=reverse ctermbg=Yellow ctermfg=NONE guibg=Yellow guifg=NONE
hi SpecialKey term=bold ctermfg=DarkBlue guifg=Blue
hi Title term=bold ctermfg=DarkMagenta gui=bold guifg=Magenta
hi WarningMsg term=standout ctermfg=DarkRed guifg=Red
hi WildMenu term=standout ctermbg=Yellow ctermfg=Black guibg=Yellow guifg=Black
hi Folded term=standout ctermbg=Grey ctermfg=DarkBlue guibg=Grey91 guifg=Green
hi FoldColumn term=standout ctermbg=Grey ctermfg=DarkBlue guibg=Grey93 guifg=Grey55
hi DiffAdd term=bold ctermbg=LightBlue guibg=LightBlue
hi DiffChange term=bold ctermbg=LightMagenta guibg=LightMagenta
hi DiffDelete term=bold ctermfg=Blue ctermbg=LightCyan gui=bold guifg=Blue guibg=LightCyan
hi CursorLine term=underline cterm=underline guibg=Grey91
hi CursorColumn term=reverse ctermbg=grey guibg=Grey93

" Colors for syntax highlighting
hi VimOption guifg='#007999' gui=bold
hi VimAutoEvent guifg=DarkBlue
hi VimHiGroup guifg=DarkBlue
hi vimSynType guifg=Blue
hi TagListTitle gui=underline guifg='#b25162'
hi TagListFileName gui=bold guifg='#5c1515' guibg='#e7eeee'
hi TagListTagName gui=bold guifg=DarkBlue gui=bold
" hi Constant term=underline ctermfg=DarkRed guifg=grey23 guibg=Grey98
hi Special term=bold ctermfg=DarkMagenta guifg=SlateBlue guibg=Grey97
hi Ignore ctermfg=LightGrey guifg=grey90

hi cType guifg=blue gui=NONE
hi cppType guifg=blue gui=NONE
hi cppAccess guifg=red gui=NONE
hi cppModifier guifg=blue gui=NONE

hi SchemeSyntax gui=bold guifg=darkblue
hi SchemeBoolean gui=bold 
hi schemeConstant guifg=DarkMagenta


hi Error guifg=Black guibg=LightRed
hi Delimiter guifg=Blue gui=bold
hi racketSyntax guifg=SeaGreen

hi helpNote guibg='#d6ebf2' 
hi helpExample guifg='#113c78' gui=bold guibg='#f8eafb'
" vim: sw=2
