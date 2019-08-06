// WScript.Echo(WScript.Arguments.Count());
var myFsObj = new ActiveXObject("Scripting.FileSystemObject")
var myShellObj = new ActiveXObject("WScript.Shell")
var myProcessEnv = myShellObj.Environment( "PROCESS" )

// C:\Users\baic\Downloads\apps\gvim\gvim_8.1.0897_x86\vim\vim81\gvim.exe
var runningDirBin =  "C:\\Users\\baic\\Downloads\\apps\\gvim\\gvim_8.1.0897_x86\\vim\\vim81"
var myCommandStr = '"' + myFsObj.BuildPath(runningDirBin, "gvim.exe")  + '"' 

myProcessEnv( "MYVIMRC" ) = myFsObj.BuildPath(myProcessEnv( "userprofile" ), "vimfiles\\vimrc")
var arg0 = " -u " + myProcessEnv( "MYVIMRC" )

var arg=""
for (i=0; i<WScript.Arguments.length; i++)
{
    arg = arg + " " + WScript.Arguments(i)
}

// Dynamically create a shortcut with the current directory as the working directory.
var TemporaryFolder = 2
var linkfile = myFsObj.BuildPath(myFsObj.GetSpecialFolder(TemporaryFolder), "my_nVim222.lnk")
var link = myShellObj.CreateShortcut(linkfile)
link.TargetPath = myCommandStr
link.Arguments = arg + arg0
link.WorkingDirectory = runningDirBin
link.IconLocation = myFsObj.BuildPath(runningDirBin, "nvim-qt.exe")
link.Save()


// var the environment variable of the current process
myProcessEnv( "LANG" ) = "en_US.UTF-8"
// myProcessEnv( "LC_CTYPE" ) = "en_US.utf8"
// myProcessEnv( "LC_COLLATE" ) = "C"

// !!! network home path will drag-down bundles like YouCompleteMe 
myProcessEnv( "HOME" ) = myProcessEnv( "userprofile" )
myProcessEnv( "HOMEDRIVE" ) = "C:"
myProcessEnv( "HOMEPATH" ) = myProcessEnv( "userprofile" )
// myProcessEnv( "HOMESHARE" ) = "\\\\SHAWFILEP01\\Users$\\BaiC"
myProcessEnv( "HOMESHARE" ) = ""


// myProcessEnv( "MZSCHEME_VER") =  "3m_a1e474"
// C:\\Users\\baic\\Downloads\\apps\\Scheme_Dr_Racket_v6.7\\lib\\libracket3m_a1e474.dll

// C:\\Users\\baic\\Downloads\\apps\\python37_x86a\\python.exe
myProcessEnv("PATH") = "F:\\python37_x86a\\;F:\\python37_x86a\\Scripts\\;" + myProcessEnv("PATH")
// myProcessEnv("PATH") = "F:\\StrawberryPerl_x64\\perl\\bin\\;" + myProcessEnv("PATH")
myProcessEnv("PATH") = "f:\\git\\cmd\\;" + myProcessEnv("PATH")
myProcessEnv("PATH") = "f:\\gnuWin32\\bin\\;" + myProcessEnv("PATH")
// myProcessEnv("PATH") = "f:\\apps\\Scheme_Dr_Racket_v6.7\\lib\\;" + myProcessEnv("PATH")
// wscript.echo "path=" + myProcessEnv("PATH")


myShellObj.Run(linkfile)

