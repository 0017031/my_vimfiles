function my_Auto_Highlight_Toggle()
	if vim.g.ah2 then
		local _, _= pcall(function() vim.api.nvim_clear_autocmds({group = "ah2"}) end)
		vim.opt_local.updatetime=800; vim.fn.setreg('/', '');  vim.opt_local.hlsearch=false
		vim.g.ah2=false; print "2Highlight current word: off"
		return false
	else
		local ah2 = vim.api.nvim_create_augroup('ah2', { clear = true })
		-- au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
		vim.api.nvim_create_autocmd("CursorHold", { command = "let @/ = '\\V\\<'.escape(expand('<cword>'), '\\').'\\>'" , group = ah2, })
		vim.opt_local.updatetime=300;  vim.opt_local.hlsearch=true
		vim.g.ah2=true; print "2Highlight current word: ON"
		return true
	end
end

