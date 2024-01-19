require('my_setting')
require('my_kemap')
require('my_nvim_option')
require('my_plugin_lazy')
-- require('plugins_lazy')


-- augroup BgHighlight
-- autocmd!
-- autocmd WinEnter * set cul
-- autocmd WinLeave * set nocul
-- autocmd WinEnter * hi LineNr	ctermfg=16	ctermbg=240	guifg=Black	guibg=Grey7
-- autocmd WinLeave * hi LineNr	ctermfg=16	ctermbg=240	guifg=Black	guibg=#585858
-- augroup END


-- autocmd WinEnter * set colorcolumn=80
-- autocmd WinLeave * set colorcolumn=0

-- Map <tab> for trigger completion, completion confirm, snippet expand and jump like VSCode: >
-- < Note: the `coc-snippets` extension is required for this to work.
-- vim.cmd([[
-- inoremap <silent><expr> <TAB>
-- \ coc#pum#visible() ? coc#_select_confirm() :
-- \ coc#expandableOrJumpable() ?
-- \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
-- \ CheckBackspace() ? "\<TAB>" :
-- \ coc#refresh()

-- function! CheckBackspace() abort
-- let col = col('.') - 1
-- return !col || getline('.')[col - 1]  =~# '\s'
-- endfunction

-- let g:coc_snippet_next = '<tab>'
-- ]])



-- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
-- parser_config.buildfile = {
-- 	install_info = {
-- 		url = "Z:\\tree-sitter-buildfile", -- local path or git repo
-- 		files = {"src/parser.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
-- 		-- optional entries:
-- 		branch = "main", -- default branch in case of git repo if different from master
-- 		generate_requires_npm = false, -- if stand-alone parser without npm dependencies
-- 		requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
-- 	},
-- 	filetype = "buildfile", -- if filetype does not match the parser name
-- }
