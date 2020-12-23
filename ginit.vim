if exists('g:fvim_loaded')
	" good old 'set guifont' compatibility
	" set guifont=JetBrains\ Mono:h18
	set guifont=Fira\ Code:h18
	" set guifont=Consolas:h18

	" Ctrl-ScrollWheel for zooming in/out
	set mouse=a
	nnoremap <silent> <C-ScrollWheelUp> :set guifont=+<CR>
	nnoremap <silent> <C-ScrollWheelDown> :set guifont=-<CR>
	nnoremap <A-CR> :FVimToggleFullScreen<CR>
	FVimCursorSmoothMove v:true
	FVimCursorSmoothBlink v:true
endif

if has('nvim')
	Guifont! JetBrains Mono:h14

	nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
	inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
	vnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
endif

colorscheme m2dark