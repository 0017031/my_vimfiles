// WScript.Echo(WScript.Arguments.Count());
var myFsObj = new ActiveXObject("Scripting.FileSystemObject")
var myShellObj = new ActiveXObject("WScript.Shell")
var myProcessEnv = myShellObj.Environment( "PROCESS" )

// C:/Users/baic/Downloads/apps/gvim/Neovim/bin/nvim-qt.exe
var runningDirBin =  "C:/Users/baic/Downloads/apps/gvim/Neovim/bin/"
var myCommandStr = '"' + myFsObj.BuildPath(runningDirBin, "nvim-qt.exe")  + '"' 

myProcessEnv( "MYVIMRC" ) = myFsObj.BuildPath(myProcessEnv( "userprofile" ), "vimfiles\\vimrc")
var arg0 = " -u " + myProcessEnv( "MYVIMRC" )

var arg=""
for (i=0; i<WScript.Arguments.length; i++)
{
    arg = arg + ' ' + 
		myFsObj.BuildPath(myFsObj.GetAbsolutePathName('.'), WScript.Arguments(i))
		// ' "' + WScript.Arguments(i) + '"'
}

// Dynamically create a shortcut with the current directory as the working directory.
var TemporaryFolder = 2
var linkfile = myFsObj.BuildPath(myFsObj.GetSpecialFolder(TemporaryFolder), "my_nVim222.lnk")
var link = myShellObj.CreateShortcut(linkfile)
link.TargetPath = myCommandStr
link.Arguments = " -qwindowgeometry 1200x700+50+50  -- " + arg0 + arg
link.WorkingDirectory = runningDirBin
link.IconLocation = myFsObj.BuildPath(runningDirBin, "nvim-qt.exe")
link.Save()
// WScript.Echo("arg=" + arg)
// WScript.Echo("arg0=" + arg0)
// WScript.Echo("link.Arguments=" + link.Arguments )
// WScript.Echo(WScript.ScriptFullName)
// WScript.Echo(myFsObj.GetAbsolutePathName('.'))


// var the environment variable of the current process
myProcessEnv( "LANG" ) = "en_US.UTF-8"
// myProcessEnv( "LC_CTYPE" ) = "en_US.utf8"
// myProcessEnv( "LC_COLLATE" ) = "C"

// !!! network home path will drag-down bundles like YouCompleteMe 
myProcessEnv( "HOME" ) = myProcessEnv( "userprofile" )
myProcessEnv( "HOMEDRIVE" ) = "C:"
myProcessEnv( "HOMEPATH" ) = myProcessEnv( "userprofile" )
// myProcessEnv( "HOMESHARE" ) = "//SHAWFILEP01/Users$/BaiC"
myProcessEnv( "HOMESHARE" ) = ""
myProcessEnv( "NVIM_QT" ) = 1
myProcessEnv( "http_proxy" ) = "http://127.0.0.1:8123"
myProcessEnv( "https_proxy" ) = "http://127.0.0.1:8123"


// myProcessEnv( "MZSCHEME_VER") =  "3m_a1e474"
// C:/Users/baic/Downloads/apps/Scheme_Dr_Racket_v6.7/lib/libracket3m_a1e474.dll

// C:/Users/baic/Downloads/apps/python37_x86/python.exe

myProcessEnv("PATH") = "C:/Windows/System32/;C:/Windows/System32/WindowsPowerShell/v1.0/" 
// myProcessEnv("PATH") = "F:/python37_x86/;F:/python37_x86/Scripts/;" + myProcessEnv("PATH")
myProcessEnv("PATH") = "c:/msys2/mingw64/bin/;" + myProcessEnv("PATH")
myProcessEnv("PATH") = "c:/python27;c:/python27/Scripts;" + myProcessEnv("PATH")

myProcessEnv("PATH") = "F:/node.js/yarn/1.16.0/bin/;" + myProcessEnv("PATH")
myProcessEnv("PATH") = "F:/node.js/node-v10.8.0-win-x64/;" + myProcessEnv("PATH")
// myProcessEnv("PATH") = "F:/StrawberryPerl_x64/perl/bin/;" + myProcessEnv("PATH")
myProcessEnv("PATH") = "f:/git/cmd/;" + myProcessEnv("PATH")
myProcessEnv("PATH") = "f:/gnuWin32/bin/;" + myProcessEnv("PATH")
myProcessEnv("PATH") = "f:/gvim/Neovim/bin/;" + myProcessEnv("PATH")

// myProcessEnv("PATH") = "f:/apps/Scheme_Dr_Racket_v6.7/lib/;" + myProcessEnv("PATH")
// wscript.echo "path=" + myProcessEnv("PATH")


myShellObj.Run(linkfile)

