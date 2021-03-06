var myFsObj = new ActiveXObject("Scripting.FileSystemObject")
var myShellObj = new ActiveXObject("WScript.Shell")
var myProcessEnv = myShellObj.Environment( "PROCESS" )
// 					 	"f:\\nvim\\latest\\bin\\nvim-qt.exe"
var runningDirBin =  	"f:\\nvim\\latest\\bin\\"
var myCommandStr = '"' + myFsObj.BuildPath(runningDirBin, "nvim-qt.exe")  + '"' 
myProcessEnv( "MYVIMRC" ) = myFsObj.BuildPath(myProcessEnv( "userprofile" ), "vimfiles\\vimrc")
var arg0 = " -u " + myProcessEnv( "MYVIMRC" )
var arg=""
for (i=0; i<WScript.Arguments.length; i++)
{
		arg = arg + ' ' + 
				// myFsObj.BuildPath(myFsObj.GetAbsolutePathName('.'), WScript.Arguments(i)) // ' "' + WScript.Arguments(i) + '"'
				myFsObj.GetAbsolutePathName(WScript.Arguments(i))
}

var TemporaryFolder = 2
var linkfile = myFsObj.BuildPath(myFsObj.GetSpecialFolder(TemporaryFolder), "my_nVim222.lnk")
var link = myShellObj.CreateShortcut(linkfile)
link.TargetPath = myCommandStr
// link.Arguments = " -qwindowgeometry 1500x900+150+50  -- " + arg0 + arg
link.Arguments = " -- "+ arg0 + arg
link.WorkingDirectory = runningDirBin
link.IconLocation = myFsObj.BuildPath(runningDirBin, "nvim-qt.exe")
link.Save()

myProcessEnv( "NVIM_QT" ) = 1
//myProcessEnv( "VIM" ) = myFsObj.GetAbsolutePathName(myFsObj.BuildPath(runningDirBin, "..\\share\\nvim"))


myProcessEnv( "LANG" ) = "en_US.UTF-8"
myProcessEnv( "HOME" ) = myProcessEnv( "userprofile" )
myProcessEnv( "HOMEDRIVE" ) = "C:"
myProcessEnv( "HOMEPATH" ) = myProcessEnv( "userprofile" )
myProcessEnv.Remove("HOMESHARE")
myProcessEnv( "http_proxy" ) = "http://127.0.0.1:8123"
myProcessEnv( "https_proxy" ) = "http://127.0.0.1:8123"
myProcessEnv( "NVIM_PYTHON_LOG_FILE" ) = myFsObj.BuildPath(myProcessEnv( "userprofile" ), "\\AppData\\Local\\nvim-data\\NVIM_PYTHON_LOG_FILE.txt")

myProcessEnv("PATH") = "C:\\Windows\\System32\\;C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\" 
myProcessEnv("PATH") = "F:\\node.js\\latest\\node_modules\\yarn\\bin;" + myProcessEnv("PATH")
myProcessEnv("PATH") = "F:\\node.js\\latest\\;" + myProcessEnv("PATH")
myProcessEnv("PATH") = "f:\\git\\cmd\\;" + myProcessEnv("PATH")
myProcessEnv("PATH") = myProcessEnv("userprofile")+ "\\scoop\\apps\\racket\\current;" + myProcessEnv("PATH")

//perl
// myProcessEnv("PATH") = "f:\\perl\\bin;" + myProcessEnv("PATH")
// myProcessEnv("PATH") = "f:\\perl\\site\\bin;" + myProcessEnv("PATH")
// myProcessEnv("PATH") = "f:\\perl\\mingw\\bin\\;" + myProcessEnv("PATH")
// myProcessEnv( "TERM" ) = ""
// myProcessEnv( "PERL_JSON_BACKEND" ) = ""
// myProcessEnv( "PERL_YAML_BACKEND" ) = ""
// myProcessEnv( "PERL5LIB" ) = ""
// myProcessEnv( "PERL5OPT" ) = ""
// myProcessEnv( "PERL_MM_OPT" ) = ""
// myProcessEnv( "PERL_MB_OPT" ) = ""


myShellObj.Run(linkfile)


// WScript.Echo(WScript.Arguments.Count());
// WScript.Echo("arg=" + arg)
// WScript.Echo("arg0=" + arg0)
// WScript.Echo("link.Arguments=" + link.Arguments )
// WScript.Echo(WScript.ScriptFullName)
// WScript.Echo(myFsObj.GetAbsolutePathName('.'))
// WScript.Echo("path=" + myProcessEnv("PATH"))
// WScript.Echo(myProcessEnv( "NVIM_PYTHON_LOG_FILE" ))

// myProcessEnv( "LC_CTYPE" ) = "en_US.utf8"
// myProcessEnv( "LC_COLLATE" ) = "C"
// myProcessEnv( "HOMESHARE" ) = "//SHAWFILEP01\\Users$\\BaiC" // !!! network home path will drag-down bundles like YouCompleteMe 
// myProcessEnv("PATH") = "F:\\nvim\\latest\\bin;" + myProcessEnv("PATH")
// myProcessEnv("PATH") = "f:\\gnuWin32\\bin\\;" + myProcessEnv("PATH")
// myProcessEnv("PATH") = "c:\\msys2\\mingw64\\bin\\;" + myProcessEnv("PATH")
// myProcessEnv("PATH") = "f:\\apps\\Scheme_Dr_Racket_v6.7\\lib\\;" + myProcessEnv("PATH")
// myProcessEnv( "MZSCHEME_VER") =  "3m_a1e474"
// C:\\Users\\baic\\Downloads\\apps\\Scheme_Dr_Racket_v6.7\\lib\\libracket3m_a1e474.dll
