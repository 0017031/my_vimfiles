# my ~/vimfiles

link| source|for
--- | --- | ---
~/vimfiles\ |-> `c:\w\settings_for_sync\my.vimfiles` | gvim
~/.vim |-> `c:\w\settings_for_sync\my.vimfiles` | vim-console (git)
%localappdata%\nvim  |-> `c:\w\settings_for_sync\my.vimfiles` | nvim, nvim-qt


## my.gvim.js
~/vimfiles/vimrc


## my.nvim.js
1. __Define a enviroment-viable and set its value to the same vimrc which is used by both nvim and gvim__<br>
>`myProcessEnv( "MYVIMRC" ) = myFsObj.BuildPath(myProcessEnv( "userprofile" ), "vimfiles/vimrc")`  
>`var arg0 = " -u " + myProcessEnv( "MYVIMRC" )`

2. __define `NVIM_QT` in nvim.js, to let vimrc know that now it's nvim__
>`myProcessEnv( "NVIM_QT" ) = 1`

3. __nvim-qt, set window size__<br>
>`link.Arguments = " -qwindowgeometry 1200x700+50+50  -- " + arg0 + arg`

4. __nvim-qt, set font at__ ginit.vim
>`Guifont! Fira Code Medium:h13`

## viewoutput.vim
```
" VO - view output of vim command in new buffer
command! -narg=+ VO :call ViewOutput(<q-args>) "use a !bang, to 'redefine' the command
command! -narg=+ OO :call ViewOutput(<q-args>)
```

## guifont

  settings |for
---| ---
~/vimfiles/vimrc | gvim, neovide
~/vimfiles/ginit.vim | nvim-qt

# better less color
    export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
    export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
    export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
    export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
    export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
    export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
    export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
