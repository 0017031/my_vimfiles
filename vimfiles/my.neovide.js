// C:\Users\baic\AppData\Local\fvim\config.json

var fs = new ActiveXObject("Scripting.FileSystemObject")
var shell = new ActiveXObject("WScript.Shell")
var process_env = shell.Environment( "PROCESS" )
// 					 	"C:/Users/baic/Desktop/neovide.exe"
var runningDirBin =  	"C:/Users/baic/desktop"
var myCommandStr = '"' + fs.BuildPath(runningDirBin, "neovide.exe")  + '"' 
process_env( "MYVIMRC" ) = process_env( "userprofile" ) + "\\vimfiles\\vimrc2"
var arg0 = " -u " + process_env( "MYVIMRC" )

var arg=""
for (i=0; i<WScript.Arguments.length; i++)
{
    arg = arg + ' ' + 
		fs.GetAbsolutePathName(WScript.Arguments(i))
}

var TemporaryFolder = 2
var linkfile = fs.BuildPath(fs.GetSpecialFolder(TemporaryFolder), "my_nVim222.lnk")
var link = shell.CreateShortcut(linkfile)
link.TargetPath = myCommandStr
// link.Arguments = " -qwindowgeometry 1500x900+150+50  -- " + arg0 + arg // fvim store window-size at: %LOCALAPPDATA%\fvim\config.json
link.Arguments = arg0+arg
link.WorkingDirectory = runningDirBin
link.IconLocation = fs.BuildPath(runningDirBin, "neovide.exe")
link.Save()

process_env( "FVIM" ) = 1

process_env( "LANG" ) = "en_US.UTF-8"
process_env( "HOME" ) = process_env( "userprofile" )
process_env( "HOMEDRIVE" ) = "C:"
process_env( "HOMEPATH" ) = process_env( "userprofile" )
process_env.Remove("HOMESHARE")
process_env( "http_proxy" ) = "http://127.0.0.1:8123"
process_env( "https_proxy" ) = "http://127.0.0.1:8123"
process_env( "NVIM_PYTHON_LOG_FILE" ) = fs.BuildPath(process_env( "userprofile" ), "\\AppData\\Local\\nvim-data\\NVIM_PYTHON_LOG_FILE.txt")

process_env("PATH") = "C:\\Windows\\System32\\;C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\" 
process_env("PATH") = "F:\\node.js\\latest\\;" + process_env("PATH")
process_env("PATH") = "F:\\node.js\\latest\\node_modules\\yarn\\bin;" + process_env("PATH")
process_env("PATH") = "f:\\git\\cmd\\;" + process_env("PATH")
process_env("PATH") = "f:\\ruby\\latest\\bin;" + process_env("PATH")
process_env("PATH") = "f:\\ruby\\Ruby27-x64\\lib\\ruby\\gems\\2.7.0;" + process_env("PATH")
process_env("PATH") = "f:\\nvim\\latest\\bin\\;" + process_env("PATH")
process_env("PATH") = "C:\\Users\\baic\\Downloads\\app\\UltraEdit32-17.00.eng\\GNU\\;" + process_env("PATH")

shell.Run(linkfile)


//perl
// process_env("PATH") = "f:\\perl\\bin;" + process_env("PATH")
// process_env("PATH") = "f:\\perl\\site\\bin;" + process_env("PATH")
// process_env("PATH") = "f:\\perl\\mingw\\bin\\;" + process_env("PATH")
// process_env( "TERM" ) = ""
// process_env( "PERL_JSON_BACKEND" ) = ""
// process_env( "PERL_YAML_BACKEND" ) = ""
// process_env( "PERL5LIB" ) = ""
// process_env( "PERL5OPT" ) = ""
// process_env( "PERL_MM_OPT" ) = ""
// process_env( "PERL_MB_OPT" ) = ""



// WScript.Echo(WScript.Arguments.Count());
// WScript.Echo("arg=" + arg)
// WScript.Echo("arg0=" + arg0)
// WScript.Echo("link.Arguments=" + link.Arguments )
// WScript.Echo(WScript.ScriptFullName)
// WScript.Echo(fs.GetAbsolutePathName('.'))
// WScript.Echo("path=" + process_env("PATH"))
// WScript.Echo(process_env( "NVIM_PYTHON_LOG_FILE" ))

// process_env( "LC_CTYPE" ) = "en_US.utf8"
// process_env( "LC_COLLATE" ) = "C"
// process_env( "HOMESHARE" ) = "//SHAWFILEP01\\Users$\\BaiC" // !!! network home path will drag-down bundles like YouCompleteMe 
// process_env("PATH") = "F:\\nvim\\latest\\bin;" + process_env("PATH")
// process_env("PATH") = "f:\\gnuWin32\\bin\\;" + process_env("PATH")
// process_env("PATH") = "c:\\msys2\\mingw64\\bin\\;" + process_env("PATH")
// process_env("PATH") = "f:\\apps\\Scheme_Dr_Racket_v6.7\\lib\\;" + process_env("PATH")
// process_env( "MZSCHEME_VER") =  "3m_a1e474"
// C:\\Users\\baic\\Downloads\\apps\\Scheme_Dr_Racket_v6.7\\lib\\libracket3m_a1e474.dll
