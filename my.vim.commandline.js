var myFsObj = new ActiveXObject("Scripting.FileSystemObject")
var myShellObj = new ActiveXObject("WScript.Shell")
var myProcessEnv = myShellObj.Environment( "PROCESS" )
// 					 	"f:\\nvim\\latest\\bin\\nvim-qt.exe"
var runningDirBin =  	"C:/Users/baic/Downloads/apps/git/usr/bin"
var myCommandStr = '"' + myFsObj.BuildPath(runningDirBin, "vim.exe")  + '"' 
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
link.Arguments = arg0 + arg
link.WorkingDirectory = runningDirBin
link.Save()


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


