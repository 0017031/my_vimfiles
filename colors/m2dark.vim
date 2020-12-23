" Vim color scheme
"
" Name:        m2dark.vim
" Based on 'southernlights' color schemes, of which the starting point was 'torte'


set background=dark

hi clear

if exists("syntax_on")
	syntax reset
endif

let colors_name = "m2dark"

if &term =~ "xterm" || &term =~ "256" || $DISPLAY != ""
	set t_Co=256
endif

if &t_Co < 256 && !has("gui_running")
	hi String cterm=none ctermfg=white
	hi Boolean cterm=none ctermfg=red
	hi Special cterm=none ctermfg=darkyellow
	hi Number cterm=none ctermfg=magenta
	hi Comment cterm=none ctermfg=darkcyan
	hi Function cterm=none ctermfg=cyan
	hi PreProc cterm=none ctermfg=lightblue
	hi Type cterm=none ctermfg=lightgreen
	hi Pmenu	ctermfg=black	ctermbg=darkgreen
	hi PmenuSel	ctermfg=darkblue	ctermbg=lightgreen
	hi Character cterm=none
	hi SpellLocal ctermfg=black ctermbg=green
	"hi StatusLine	cterm=none ctermfg=white	ctermbg=gray
	"hi StatusLineNC	cterm=none ctermfg=black	ctermbg=gray
	"hi TabLineSel	cterm=none	ctermfg=white	ctermbg=gray
	"hi TabLine     	cterm=none	ctermfg=black	ctermbg=gray
	"hi TabLineFill      cterm=none	ctermfg=gray	ctermbg=black
	hi diffFile ctermfg=cyan
	hi diffAdded	ctermfg=green
	hi diffRemoved	ctermfg=darkyellow
	hi link wdiffOld diffRemoved
	hi link wdiffNew diffAdded
	hi mailQuoted1 ctermfg=green
	hi mailQuoted2 ctermfg=cyan
	hi mailQuoted3 ctermfg=darkcyan
	hi mailQuoted4 ctermfg=blue
	hi mailQuoted5 ctermfg=blue
	hi mailQuoted6 ctermfg=blue
	hi mailSignature ctermfg=darkcyan
	hi SignColumn ctermfg=yellow ctermbg=green
	hi ShowMarksHLl ctermfg=yellow ctermbg=green
	hi ShowMarksHLu ctermfg=yellow ctermbg=green
	hi ShowMarksHLo ctermfg=yellow ctermbg=green
	hi ShowMarksHLm ctermfg=yellow ctermbg=green
	finish
endif

hi Boolean	ctermfg=209	guifg=#ff875f
hi Character	ctermfg=223	guifg=#ffd7af
hi Comment	ctermfg=147	guifg=#594d53
hi Constant	ctermfg=219	guifg=#ffafff
hi Conceal	ctermfg=221	ctermbg=16	guifg=#ffd75f	guibg=black
hi Cursor	ctermfg=16	ctermbg=28	cterm=bold	guifg=Black	guibg=Cyan	gui=bold
hi CursorColumn	ctermbg=235	cterm=none	guibg=#262626	gui=none
hi ColorColumn	ctermbg=235	cterm=none	guibg=#262626	gui=none
hi DiffAdd	ctermfg=227	ctermbg=22	guifg=#d7ff5f	guibg=#005f00
hi DiffDelete	ctermfg=227	ctermbg=88	guifg=#ffafff	guibg=#870000
hi DiffChange	ctermfg=227	ctermbg=58	guifg=#ffafff	guibg=#5f5f00
hi DiffText	ctermfg=227	ctermbg=88	guifg=#ffafff	guibg=#870000	cterm=none	gui=none
hi Error	ctermfg=231	cterm=none	ctermbg=196	gui=none	guifg=White	guibg=Red
hi Directory	ctermfg=33	guifg=#0087ff
hi Folded	ctermfg=86	ctermbg=240	guifg=#00ffff	guibg=#585858
hi FoldColumn	ctermfg=86	ctermbg=240	guifg=#00ffff	guibg=#585858
hi Function	ctermfg=117	guifg=#87d7ff
hi Identifier	ctermfg=86	cterm=none	guifg=cyan	gui=none
hi CursorLineNr	ctermfg=16	ctermbg=243	guifg=Black	guibg=#585858
hi MatchParen	ctermfg=231	ctermbg=58	guifg=white	guibg=#5f5f00
hi NonText	ctermfg=21	guifg=#0000ff
hi Number	ctermfg=223	guifg=#ffd7af
hi MoreMsg	ctermfg=36	guifg=#00af87
hi ModeMsg	ctermfg=253	guifg=#dadada
hi Operator	ctermfg=204	guifg=#ff5f87
hi Pmenu	ctermfg=119	ctermbg=22	guifg=#87ff5f	guibg=#005f00
hi PmenuSel	ctermfg=226	ctermbg=28	guifg=Yellow	guibg=#008700
hi PmenuSbar	ctermbg=244	guibg=#808080
hi PmenuThumb	ctermbg=251	guibg=#c6c6c6
hi PreProc	ctermfg=201	ctermbg=none	guifg=MediumPurple
hi Question	ctermfg=115	guifg=#87d7af
hi Search	ctermfg=231	ctermbg=58	guifg=white	guibg=#5f5f00
hi IncSearch	ctermfg=231	ctermbg=58	guifg=white	guibg=#5f5f00
hi SignColumn	ctermfg=45	ctermbg=240	guifg=#ffff5f	guibg=#585858
hi Special	ctermfg=221	guifg=#ffd75f
hi SpecialKey	ctermfg=86	guifg=#00ffff
hi SpellBad	ctermfg=196	ctermbg=none	cterm=underline	guisp=#ff0000	gui=undercurl
hi SpellLocal	ctermfg=28	ctermbg=none	cterm=underline	guisp=#00AA00	gui=undercurl
hi SpellRare	ctermfg=201	ctermbg=none	cterm=underline	guisp=#ff00ff	gui=undercurl
hi SpellCap	ctermfg=33	ctermbg=none	cterm=underline	guisp=#0087ff	gui=undercurl
hi Statement	ctermfg=226	guifg=CornflowerBlue	cterm=none	gui=none
hi StatusLine	ctermfg=16	ctermbg=244	guifg=white	guibg=#4e4e4e	gui=none	cterm=none
hi StatusLineNC	ctermfg=16	ctermbg=240	guifg=black	guibg=#4e4e4e	gui=none	cterm=none
hi VertSplit	ctermfg=16	ctermbg=239	guifg=black	guibg=gray30	gui=none	cterm=none
hi TabLineSel	ctermfg=16	ctermbg=244	cterm=none	guifg=black	guibg=#808080	gui=none
hi TabLine	ctermfg=16	ctermbg=240	cterm=none	guifg=black	guibg=#585858	gui=none
hi TabLineFill	ctermfg=16	ctermbg=235	cterm=none	guifg=black	guibg=#262626	gui=none
hi String	ctermfg=229	guifg=#ffffaf
hi Title	cterm=bold	ctermfg=201	gui=bold	guifg=Magenta
hi Type		ctermfg=77	guifg=#5fd75f	gui=none
hi Visual	ctermfg=248	guifg=#a8a8a8	ctermbg=237 	guibg=#3a3a3a
hi VisualNOS	term=bold,underline		cterm=bold,underline		gui=bold,underline
hi WarningMsg	ctermfg=196
hi WildMenu	ctermfg=16	ctermbg=226	guifg=#000000	guibg=#ffff00
hi ErrorMsg ctermfg=231 ctermbg=196 guifg=#ffffff guibg=#ff0000

" TODO: Implement:
" CursorIM
" VisualNOS


" html
hi htmlLink			cterm=underline	ctermfg=105	gui=underline	guifg=#8787ff
hi htmlBold			cterm=bold			gui=bold
hi htmlBoldItalic		cterm=bold,italic		gui=bold,italic
hi htmlBoldUnderline		cterm=bold,underline		gui=bold,underline
hi htmlBoldUnderlineItalic	cterm=bold,underline,italic	gui=bold,underline,italic
hi htmlItalic			cterm=italic			gui=italic
hi htmlUnderline		cterm=underline			gui=underline
hi htmlUnderlineItalic		cterm=underline,italic		gui=underline,italic

" mail
hi mailHeader	ctermfg=229	guifg=#ffffaf
hi mailSubject	ctermfg=226	guifg=yellow
hi mailQuoted1	ctermfg=48	guifg=#00ff87
hi mailQuoted2	ctermfg=51	guifg=#00ffff
hi mailQuoted3	ctermfg=39	guifg=#00afff
hi mailQuoted4	ctermfg=33	guifg=#0087ff
hi mailQuoted5	ctermfg=27	guifg=#005fff
hi mailQuoted6	ctermfg=21	guifg=#0000ff
hi mailSignature ctermfg=209	guifg=#ff875f

" diff
hi diffAdded	ctermfg=40	guifg=#00d700
hi diffRemoved	ctermfg=210	guifg=#ff8787
hi diffFile	ctermfg=117	guifg=#87d7ff
hi diffOldFile	ctermfg=117	guifg=#87d7ff
hi diffNewFile	ctermfg=117	guifg=#87d7ff
hi diffLine	ctermfg=226	guifg=yellow

" wdiff
hi link	wdiffOld	diffRemoved
hi link	wdiffNew	diffAdded

" Vim help
hi helpHyperTextEntry	ctermfg=39	guifg=#00afff

" Vimscript
hi vimCommentTitle	ctermfg=135	guifg=#af5fff	gui=italic
hi vimCommentString	ctermfg=109	guifg=#87afaf	gui=italic

" R
hi rOKeyword	ctermfg=135	guifg=#af5fff	gui=italic

" ShowMarks plugin
hi ShowMarksHLl		ctermfg=227	ctermbg=28	guifg=#ffff5f	guibg=#008700
hi ShowMarksHLu		ctermfg=227	ctermbg=28	guifg=#ffff5f	guibg=#008700
hi ShowMarksHLo		ctermfg=227	ctermbg=28	guifg=#ffff5f	guibg=#008700
hi ShowMarksHLm		ctermfg=227	ctermbg=196	guifg=#ffff5f	guibg=#ff005f

" csv.vim plugin
hi CSVColumnHeaderOdd	ctermfg=46	ctermbg=236	guifg=#00ff00	guibg=#303030
hi CSVColumnHeaderEven	ctermfg=45	ctermbg=236	guifg=#00d7ff	guibg=#303030
hi CSVColumnOdd		ctermfg=40	guifg=#00d700
hi CSVColumnEven	ctermfg=39	guifg=#00afff

hi Normal	ctermfg=253	ctermbg=16	guifg=#dadada	guibg=Black
hi CursorLine	ctermbg=235	cterm=none	guibg=#262626	gui=none
hi LineNr	ctermfg=16	ctermbg=240	guifg=Black	guibg=#585858
augroup t1
	autocmd!
	autocmd InsertEnter * hi CursorLine	ctermbg=235	cterm=none	guibg=DarkBlue	gui=none
	autocmd InsertLeave * hi CursorLine	ctermbg=235	cterm=none	guibg=#262626	gui=none

	autocmd CmdLineLeave * hi CursorLine	ctermbg=235	cterm=none	guibg=#262626	gui=none
	autocmd CmdLineLeave * hi LineNr	ctermfg=16	ctermbg=240	guifg=Black	guibg=#585858

	autocmd CmdLineEnter * hi CursorLine	ctermbg=235	cterm=none	guibg=#000000	gui=none
	autocmd CmdLineEnter * hi LineNr	ctermfg=16	ctermbg=240	guifg=Black	guibg=Grey7
	autocmd CmdLineEnter * redraw
augroup end
