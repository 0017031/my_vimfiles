if exists('g:fvim_loaded')
	" good old 'set guifont' compatibility
	" set guifont=JetBrains\ Mono:h18
	set guifont=Fira\ Code:h16
	" set guifont=Consolas:h18

	" Ctrl-ScrollWheel for zooming in/out
	set mouse=a
	nnoremap <silent> <C-ScrollWheelUp> :set guifont=+<CR>
	nnoremap <silent> <C-ScrollWheelDown> :set guifont=-<CR>
	nnoremap <A-CR> :FVimToggleFullScreen<CR>
	FVimCursorSmoothMove v:true
	FVimCursorSmoothBlink v:true
else

	if split(system('ver'))[-1][:-2] > 7
		" Guifont! Fira Code Retina:h11
		" Guifont! Consolas:h16
		" Guifont! Fira Code Medium:h22
		Guifont! JetBrains Mono:h14
	else
		" Guifont! Consolas:h12
		Guifont! Fira Code Medium:h15
	endif

endif
