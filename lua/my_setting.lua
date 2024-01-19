require('_auto_highlight_toogle')

local my_color_scheme = 'm2dark'

vim.g.clipboard = {
	name = 'win32yank',
	copy = {
		['*'] = 'clip.exe',
		['+'] = 'win32yank.exe -i --crlf',
	},
	paste = {
		['*'] = 'win32yank.exe -o --lf',
		['+'] = 'win32yank.exe -o --lf',
	},
	cache_enabled = 0
}

-- Restore cursor shape on exit
vim.api.nvim_create_autocmd("VimLeave", {
	group = vim.api.nvim_create_augroup("My_Restore_CursorShape_OnExit_augrp", { clear = true }),
	command = "set guicursor= | call chansend(v:stderr, \"\\x1b[ q\")",
	desc = "Restore cursor shape on exit",
})

-- HiLight yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("My_yank_hilight_augrp", { clear = true }),
	callback = function() vim.highlight.on_yank { timeout = 800 } end,
	desc = "HiLight yank",
})

-- set ts sta sw for lua/vim/gitconfig
vim.api.nvim_create_autocmd("Filetype", {
	pattern = { 'lua', 'vim', 'gitconfig' },
	group = vim.api.nvim_create_augroup("My_file_augrp", { clear = true }),
	command = 'setlocal ts=2 sts=2 sw=2',
	desc = "set ts sta sw for lua/vim/gitconfig",
})

-- override hlsearch background color in the color-theme
vim.api.nvim_create_autocmd("ColorScheme", {
	group = vim.api.nvim_create_augroup("My_hlsearch_bg_augrp", { clear = true }),
	command = 'highlight clear Search | highlight Search guibg=#ff6900',
	desc = 'override hlsearch background color in the color-theme'
})
vim.cmd.colorscheme(my_color_scheme)
