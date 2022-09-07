nnoremap ; :
nnoremap ' "
nnoremap " '
let mapleader = ","

" F9 , save and source current file
nnoremap <F9> :w<CR>:so % <CR>
inoremap <F9> <ESC>:w<CR>:so %<CR>
" alt-F8 to format whole file
nnoremap <M-F8> gg=G<C-O><C-O> 
inoremap <M-F8> <ESC>gg=G<C-O><C-O> 
" nohl
nnoremap <nowait> <C-C> :nohl<CR><C-C>
nnoremap <nowait> <C-L> :nohl<CR><C-L>
" ctrl-p, past to end of line, adding a space
nnoremap <C-P> $a <ESC>p 
" remap <ctrl-G> to <ctrl-]> (go to definition)
nnoremap <C-g> <C-]>

"plain vim, source defaults.vim
if has('nvim') 
    "nvim here
else
    "vim/gvim here
    source $VIMRUNTIME/defaults.vim | let g:skip_defaults_vim = 1 " Do not source defaults.vim again (after loading this system vimrc)
    "gvim
    if has('gui_running') 
        set guifont=Fira\ Code\ Retina:h12 
        " set guifont=Dejavu_sans_mono:h13 
        set wrap |set lines=45 columns=164 |simalt ~X
        nnoremap <M-Space> :simalt ~<CR> 
        let no_buffers_menu = 1 
        set guioptions -=T "no tool-bar in gui
    endif
endif

set backup                                                     " keep a backup file (restore to previous version)
if has('persistent_undo')| set undofile | endif                " keep an undo file (undo changes after closing)
if &t_Co > 2 || has('gui_running') | set hlsearch | endif      " Switch on highlighting the last used search pattern

set mouse= | set ttymouse=
"let g:python3_host_prog='C:/Python38-32/python.exe'
"let g:python_host_prog='C:/python27/python.exe'
" let g:perl_host_prog = 'f:/perl/bin/perl.exe'

set helplang=en | set langmenu=en_US.UTF-8 |set encoding=UTF-8 " sets the language of the menu (gvim)
set laststatus=2                                               " make the status two lines deep so you can see status always
set wildmode=longest,list,full | set wildmenu                  " bash/readline alike tab-completion
set cursorline |set cmdheight=2 |set nowrapscan                                
set relativenumber | set number | set ignorecase | set smartcase |  set nowrap |set textwidth=120
set tabstop=4 |set softtabstop=4 |set shiftwidth=4 | set expandtab | set autoindent
set formatoptions-=ro
" -----------------

set viminfo='10,<30,s10,h,rV:,rU:,rB:,rv:,ru:,rb "limit oldfile history to 30

" au BufNewFile, BufReadPost *.rkt,*.rktl,*.alt,*.scm set filetype=scheme "racket
" au BufNewFile, BufReadPost *.dom set filetype=st
" au BufNewFile, BufReadPost * set formatoptions-=ro
" au FileType c,cpp,java set matchpairs+=<:>
" au Filetype vim,gitconfig      setlocal tabstop=2 sts=2 sw=2 "formatoptions-=ro " Don't insert a " at the start of the new line.    
" au Filetype c,cpp,st,haskell   setlocal tabstop=4 sts=4 sw=4 "formatoptions-=ro    
" au filetype lisp,scheme setlocal equalprg=scmindent.cmd

" au FileType json,jsonc,haskell nnoremap  <buffer> <M-F8>   :call CocAction('format')<CR>
" au FileType c,cpp,javascript,java,cs nnoremap  <buffer> <M-F8>   :call FormatFile()<CR>
" au FileType c,cpp,javascript,java,cs noremap   <buffer> <M-F12>  :py3f f:/gnuWin32/bin/clang-format.py3<CR>
" au FileType c,cpp,javascript,java,cs inoremap  <buffer> <M-F12>  :py3f f:/gnuWin32/bin/clang-format.py3<CR>
" function! FormatFile()
"   let l:lines="all" 
"   py3f f:/gnuWin32/bin/clang-format.py3
" endfunction

" input the lambda(λ) character 
inoremap <C-l>l <C-k>l*
" scroll down half screen
nmap <C-j> <C-d>zz
nmap <C-k> <C-b>kzz
" alt-left/right to navigate
nnoremap <M-Left> <C-O>
nnoremap <M-RIGHT> <C-I>
" ctrl-tab for switching buffer/window
nnoremap <C-Tab> :bn!<CR>
nnoremap <C-F4>  :bw<CR>
" ctrl-s to save file
nnoremap <C-S> :w<CR>
nnoremap <C-S> <ESC>:w<CR>
" ctrl-q to toggle comment current line,  see commentary.txt
nnoremap <C-Q> :Commentary<CR>
inoremap <C-Q> :Commentary<CR>
nmap <leader>q :Commentary<CR>
" ctrl-j join lines withouth space, shift-j join lines with space inserted
"" nnoremap <C-J> gJ

nmap <leader>ww :set wrap!<CR>
nmap <leader>e  :execute "edit " . $MYVIMRC<CR>
" <leader>z to toggle -- auto highlight words under cursor, when idle
nmap <leader>z :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
"----------------------------------------- copy current file/path/directory. for example: ",ef" to copy absolute path.
" absolute path  (/something/src/foo.txt) 
nmap <leader>ef :let @*=expand("%:p")<CR> 
" filename       (foo.txt) 
nmap <leader>ee :let @*=expand("%:t")<CR>
" directory name (/something/src)
nmap <leader>ed :let @*=expand("%:p:h")<CR>
" relative path  (src/foo.txt) 
nmap <leader>et :let @*=expand("%")<CR> 

"mru, list recent files
cnoreabbrev <expr> mr 'browse old!'
" <leader>m to remove "^M" in dos format 
nnoremap <leader>m :%s#\r\n#\r#g<CR>

" Map F10 to display the syntax highlighting group of the current word
nmap <F10> :echom "hi<"     . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"
            \ . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>
nmap <leader>h :echom "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' 
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" 
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" 
            \ . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

" -----------------
"commandline key-mapping
"note. now use https://github.com/tpope/vim-rsi


" ----------------- "for ms-windows, arrow-keys don't leave visaul-mode
"if has('win32')
set keymodel-=stopsel
"endif
" ----------------- "virtual block -- when in visual-block-mode, cursors can move beyond eof.
set virtualedit=block

call plug#begin('/app/Documents/vim_plugged')
Plug 'mhinz/vim-startify' 
Plug 'tpope/vim-rsi'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" gc
Plug 'tpope/vim-commentary'
" gs
Plug 'tpope/vim-surround'
" gr
Plug 'inkarkat/vim-ReplaceWithRegister' 
" :RunInInteractiveShell
Plug 'christoomey/vim-run-interactive'
call plug#end()

if index(g:plugs_order,  'coc.nvim') >=0
    "Map <tab> for trigger completion, completion confirm, snippet expand and jump like VSCode
    inoremap <silent><expr> <TAB>
                \ coc#pum#visible() ? coc#_select_confirm() :
                \ coc#expandableOrJumpable() ?
                \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
                \ CheckBackSpace() ? "\<TAB>" :
                \ coc#refresh()

    function! CheckBackSpace() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    let g:coc_snippet_next = '<tab>'
    <
    " <leader>, <leader>. to navigate diagnostics, Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
    nmap <silent> <leader>. <Plug>(coc-diagnostic-prev)
    nmap <silent> <leader>, <Plug>(coc-diagnostic-next)
endif

" ----------------- " Help File speedups, <enter> to follow tag, shift-<enter> to go back
au filetype help nnoremap <buffer> <S-Tab> ?<Bar>\zs\k*\ze<Bar><CR>
au filetype help nnoremap <buffer><TAB> /\|\zs\S\{-}\|/<CR> 
au filetype help nnoremap <buffer><CR> <C-]>
au filetype help nnoremap <buffer><S-CR> <C-T>
au filetype help nnoremap <buffer>q :q<CR>
set splitbelow " Split windows, ie Help, make more sense to me below
au filetype help wincmd _   " Maximze the help on open
au filetype help set number|set rnu

" ----------------- auto highlight words under cursor
" autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
" ----------------- auto highlight words under cursor, when idle
function! AutoHighlightToggle() " Type <leader>z to toggle highlighting on/off.
    let @/ = ''
    if exists('#auto_highlight')
        au! auto_highlight
        augroup! auto_highlight
        setl updatetime=4000
        echo 'Highlight current word: off'
        return 0
    else
        augroup auto_highlight
            au!
            au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
        augroup end
        setl updatetime=650
        echo 'Highlight current word: ON'
        return 1
    endif
endfunction


" <    To enable mode shapes, "Cursor" highlight, and blinking: >
" set guicursor=n-v:block,i-c-ci-ve:ver11,r-cr:hor20,o:hor50,a:blinkwait100-blinkoff400-blinkon250,sm:block-blinkwait175-blinkoff150-blinkon175
" set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20

" set renderoptions=type:directx,contrast:0.5,geom:1,renmode:5                           "looks good on win10
colorscheme m2dark

"" ----------------------- "s-expression for lisp/scheme
"" https://github.com/junegunn/vim-plug/issues/536#issuecomment-254049916 (open for certarin file extension )
"" Plug 'guns/vim-sexp',  { 'for': 'scheme' } 
"" Plug 'tpope/vim-sexp-mappings-for-regular-people',  {'for': ['clojure', 'scheme', 'racket'] }
"" Plug 'jpalardy/vim-slime', { 'for': 'scheme' }

"" Plug 'wlangstroth/vim-racket'

"Plug 'xolox/vim-colorscheme-switcher'
"Plug 'flazz/vim-colorschemes'
"Plug 'xolox/vim-misc'

"Plug '0017031/vim-system-copy' 
"Plug 'vim-jp/syntax-vim-ex' 

"Plug '0017031/jsonc.vim'
"if has('nvim')
" Plug 'neovim/nvim-lspconfig'
" Plug 'parsonsmatt/intero-neovim', { 'for': 'haskell' }
" Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
"endif

"" Plug 'rhysd/wandbox-vim'
"" Plug 'PProvost/vim-ps1'
"" Plug 'dawikur/algorithm-mnemonics.vim' ", { 'on':  'Algorithm-mnemonics' }

"" http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
"" Plug 'godlygeek/tabular'

"" Plug 'andymass/vim-matchup'
"" Plug 'preservim/nerdtree'
"" Plug 'JuliaEditorSupport/julia-vim'

"" Plug 'tpope/vim-repeat'
"" Plug 'thinca/vim-ambicmd'

"if index(g:plugs_order,  'vim-ambicmd') >=0
" cnoremap <expr> <Space> ambicmd#expand("\<Space>")
"endif

"if index(g:plugs_order, 'comfortable-motion.vim') >=0
"  set mouse=a
"  let g:comfortable_motion_no_default_key_mappings = 1
"  let g:comfortable_motion_impulse_multiplier = 1  " Feel free to increase/d:ecrease this value.
"  let g:comfortable_motion_interval = 1000.0/15.0
"  let g:comfortable_motion_friction = 0.0
"  let g:comfortable_motion_air_drag = 4.0
"  noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(80)<CR>
"  noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-80)<CR>
"  nnoremap <silent> <C-d> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 2)<CR>
"  nnoremap <silent> <C-u> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -2)<CR>
"  nnoremap <silent> <C-f> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 4)<CR>
"  nnoremap <silent> <C-b> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -4)<CR>
"endif

"if index(g:plugs_order, 'haskell-vim') >=0
"  let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
"  let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
"  let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
"  let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
"  let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
"  let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
"  let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
"endif

"if index(g:plugs_order, 'vim-system-copy')>=0
"  let g:system_copy#copy_command='win32yank -i'
"  let g:system_copy#paste_command='win32yank -o'
"  nmap cc <Plug>SystemCopy
"  nmap cyy <Plug>SystemCopyLine
"  nmap cp <Plug>SystemPaste
"  nmap cpp <Plug>SystemPasteLine
"endif

