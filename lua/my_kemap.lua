-- key_remap.lua

vim.g.mapleader = ','

local remap = vim.keymap.set

-- switch several keys
remap('n', ';', ':') ; remap('n', ':', ';')    -- swap ;            and :            charactor
remap('n', '\'', '"'); remap('n', '"', '\'') -- swap single-quote and double-quote charactor
remap('n', 'q', '<C-L>')
-- vim.cmd('inoremap <F9> <ESC>:w<CR>:s %<CR>zz')
remap('i', '<F9>', '<ESC>:w<CR>:s %<CR>zz')
-- F9 to source current file
remap('n', '<F9>', ':w<CR>:so %<CR>')
-- reformat file
remap('n', '<leader>f', 'gg=G<C-O>zz')

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
-- remap('n', '<ESC><ESC>', ':set hlsearch!<CR>')
vim.cmd([[
nnoremap <Esc><Esc> :nohlsearch<CR>
]])
-- <leader>z to toggle -- auto highlight words under cursor, when idle
remap('n', '<leader>z', function() my_Auto_Highlight_Toggle() end)

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


-- -- Map F10 to display the syntax highlighting group of the current word

vim.cmd [[
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




-- mru, list recent files
-- remap('c', 'mr', 'browse old!<CR>' )
-- remap('n', '<leader>mr', ':browse old!<CR>' )
remap('c', 'mr', 'Alpha<CR>' )
remap('n', '<leader>m', ':Alpha<CR>' )





