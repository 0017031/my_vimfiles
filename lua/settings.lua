require('_auto_highlight_toogle')

local my_color_scheme='m2dark'
local remap=vim.keymap.set

vim.g.mapleader = ','
-- vim.g.python3_host_prog='python3'

-- switch several keys
remap('n', ';', ':')
remap('n', '\'', '"')
remap('n', '"', '\'')
remap('n', 'q', '<C-L>')
-- vim.cmd('inoremap <F9> <ESC>:w<CR>:s %<CR>zz')
remap('i', '<F9>', '<ESC>:w<CR>:s %<CR>zz')
-- F9 to source current file
remap('n', '<F9>', ':w<CR>:so %<CR>')
-- Alt-f8 to reformat file
remap('n', '<M-F8>', 'gg=G<C-O>zz' )

-- alt-left/right to navigate
remap('n', '<M-Left>', '<C-O>')
remap('n', '<M-RIGHT>', '<C-I>')
-- ctrl_k/j  to scroll up/down half screen
remap('n', '<C-j>', '<C-d>zz')
remap('n', '<C-k>', '<C-b>zz')

-- double 'ctrl_l>' to  input the lambda(λ) character in Insert mode
remap('i', '<C-l>l', '<C-k>l*')
remap('i', '<C-l><C-l>', '<C-k>l*')

-- ctrl-j to join lines withouth space, 
-- gJ join lines with space inserted

-- <leader>ww  to toggle wrap
remap('n', '<leader>w', ':set wrap!<CR>')
-- <ESC><ESC>  to toggle search-result-hightlight
remap('n', '<ESC><ESC>', ':set hlsearch!<CR>')
-- <leader>z to toggle -- auto highlight words under cursor, when idle
remap('n', '<leader>z',function()  my_Auto_Highlight_Toggle() end)

------ copy current file/path/directory. for example: ",ef" to copy absolute path.
-- absolute path  (/something/src/foo.txt) 
remap('n', '<leader>ef', ':let @*=expand("%:p")<CR> ')
-- filename       (foo.txt) 
remap('n', '<leader>ee', ':let @*=expand("%:t")<CR>')
-- directory name (/something/src)
remap('n', '<leader>ed', ':let @*=expand("%:p:h")<CR>')
-- relative path  (src/foo.txt) 
remap('n', '<leader>et', ':let @*=expand("%")<CR> ')

--ctrl-q to toggle comment current line,  see :h commentary.api
remap('n', '<C-Q>', '<Plug>(comment_toggle_linewise_current)')

-- mru, list recent files
-- vim.cmd"cnoreabbrev <expr> mr 'browse old!'"
vim.cmd.cnoreabbrev{ "<expr>", "mr", "'browse old!'", }
vim.cmd([[
autocmd VimLeave * set guicursor= | call chansend(v:stderr, "\x1b[ q")
]])
--
--
-- -- Map F10 to display the syntax highlighting group of the current word
vim.cmd[[
nmap <F10> :echom "hi<"     . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"
\ . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

nmap <leader>h :echom "hi<"     . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"
\ . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

aug HelpSpeedup
au!
au filetype help nnoremap <buffer> <S-Tab> ?<Bar>\zs\k*\ze<Bar><CR>
au filetype help nnoremap <buffer><TAB> /\|\zs\S\{-}\|/<CR> 
au filetype help nnoremap <buffer><CR> <C-]>
au filetype help nnoremap <buffer><S-CR> <C-T>
au filetype help nnoremap <buffer>q :q<CR>
au filetype help set splitbelow " Split windows, ie Help, make more sense to me below
au filetype help wincmd _   " Maximze the help on open
au filetype help set number
aug end

]]

local value_options = {
	modeline = false, modelines = 0, -- Avoid modeline vulnerability
	helplang = 'en', langmenu = 'en_US.UTF-8', encoding = 'UTF-8',
	wildmenu = true, wildmode = 'longest,list,full',
	cmdheight = 2,
	tabstop = 4, textwidth = 120,
	viminfo="'10,<30,s10,h,rV:,rU:,rB:", -- "limit oldfile history to 30
	guicursor='',
}

local TRUE_options = {
	'cursorline', -- highlight current line
	'number', 'relativenumber',
	'smartcase', 'ignorecase',
	'termguicolors',
	'undofile',
}

local FALSE_options = {
	'backup',
	'wrap',
	'wrapscan', -- Searches DON'T wrap around the end of the file.
}

for _, v in ipairs(TRUE_options) do
	vim.opt[v] = true
end

for _, v in ipairs(FALSE_options) do
	vim.opt[v] = false
end

for k, v in pairs(value_options) do
	vim.opt[k] = v
end

-- HiLight yank
local My_yank_hilight_augrp = vim.api.nvim_create_augroup("My_yank_hilight_augrp", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", { callback = function() vim.highlight.on_yank{timeout=800} end, group = My_yank_hilight_augrp, })

-- myfiles autocmd
local My_file_augrp = vim.api.nvim_create_augroup("My_file_augrp", { clear = true })
vim.api.nvim_create_autocmd("Filetype", {pattern={'lua', 'vim', 'gitconfig'},command='setlocal ts=2 sts=2 sw=2', group = My_file_augrp, })

-- override hlsearch background color in the color-theme
local My_hlsearch_bg_augrp = vim.api.nvim_create_augroup ("My_hlsearch_bg_augrp", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", { command='highlight clear Search | highlight Search guibg=#d16002', group = My_hlsearch_bg_augrp, })
vim.cmd.colorscheme(my_color_scheme)

-- override hlsearch background color in the color-theme
-- local My_recover_cursor_grp= vim.api.nvim_create_augroup ("My_recover_cursor_grp", { clear = true })
-- vim.api.nvim_create_autocmd("VimLeave", { command='set guicursor= |call chansend(v:stderr, "\x1b[ q"', group = My_recover_cursor_grp, })
