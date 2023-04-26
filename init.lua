require('settings')
require('plugins_lazy')

-- Map <tab> for trigger completion, completion confirm, snippet expand and jump like VSCode: >
-- < Note: the `coc-snippets` extension is required for this to work.
vim.cmd([[
inoremap <silent><expr> <TAB>
    \ coc#pum#visible() ? coc#_select_confirm() :
    \ coc#expandableOrJumpable() ?
    \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
    \ CheckBackspace() ? "\<TAB>" :
    \ coc#refresh()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

nmap <silent> <leader><F2> <Plug>(coc-diagnostic-prev)
nmap <silent> <F2> <Plug>(coc-diagnostic-next)
]])

-- coc, Use <CR> to confirm completion, use: >
vim.cmd([[
inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"
]])

