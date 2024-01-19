function my_Auto_Highlight_Toggle()
	if vim.g.ah2 then
		local _, _ = pcall(function() vim.api.nvim_clear_autocmds({ group = "my_Auto_Highlight_augrp" }) end)
		vim.opt_local.updatetime = 800; vim.fn.setreg('/', ''); vim.opt_local.hlsearch = false
		vim.g.ah2 = false; print "2Highlight current word: off"
		return false
	else
		vim.api.nvim_create_autocmd("CursorHold", {
			group = vim.api.nvim_create_augroup('my_Auto_Highlight_augrp', { clear = true }),
			command = "let @/ = '\\V\\<'.escape(expand('<cword>'), '\\').'\\>'",
		})
		vim.opt_local.updatetime = 300; vim.opt_local.hlsearch = true
		vim.g.ah2 = true; print "2Highlight current word: ON"
		return true
	end
end
