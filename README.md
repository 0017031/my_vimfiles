# my_vimfiles
my ~/vimfiles

link| source
--- | --- |
~/vimfiles\ |-> `w:\settings_for_sync\vim.my.settings\vimfiles`
~/.vim |-> `w:\settings_for_sync\vim.my.settings\vimfiles`

## gvim.js
~/vimfiles/vimrc


## nvim.js
1. __Define a enviroment-viable to use same vimrc both in nvim and gvim__<br>
>`myProcessEnv( "MYVIMRC" ) = myFsObj.BuildPath(myProcessEnv( "userprofile" ), "vimfiles/vimrc")`  
>`var arg0 = " -u " + myProcessEnv( "MYVIMRC" )`

2. __define `NVIM_QT` in nvim.js, to let vimrc know that now it's nvim__
>`myProcessEnv( "NVIM_QT" ) = 1`

3. __nvim-qt, set window size__<br>
>`link.Arguments = " -qwindowgeometry 1200x700+50+50  -- " + arg0 + arg`

4. __nvim-qt, set font at__ ginit.vim
>`Guifont! Fira Code Medium:h13`

