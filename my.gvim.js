var myFsObj = new ActiveXObject("Scripting.FileSystemObject")
var myShellObj = new ActiveXObject("WScript.Shell")
var myProcessEnv = myShellObj.Environment( "PROCESS" )
var runningDirBin =  	"f:\\gvim\\"
var myCommandStr = '"' + myFsObj.BuildPath(runningDirBin, "gvim.exe")  + '"' 
myProcessEnv( "MYVIMRC" ) = myFsObj.BuildPath(myProcessEnv( "userprofile" ), "vimfiles\\vimrc")
var arg0 = " -u " + myProcessEnv( "MYVIMRC" ) + ' -U NONE'
var arg=""
for (i=0; i<WScript.Arguments.length; i++)
{
    arg = arg + ' ' + 
		myFsObj.BuildPath(myFsObj.GetAbsolutePathName('.'), WScript.Arguments(i)) // ' "' + WScript.Arguments(i) + '"'
}
var TemporaryFolder = 2
var linkfile = myFsObj.BuildPath(myFsObj.GetSpecialFolder(TemporaryFolder), "my_gVim333.lnk")
var link = myShellObj.CreateShortcut(linkfile)
link.TargetPath = myCommandStr
link.Arguments = arg + arg0
link.WorkingDirectory = runningDirBin
link.IconLocation = myFsObj.BuildPath(runningDirBin, "gvim.exe")
link.Save()

myProcessEnv( "GVIM" ) = 1

myProcessEnv( "LANG" ) = "en_US.UTF-8"
myProcessEnv( "HOME" ) = myProcessEnv( "userprofile" )
myProcessEnv( "HOMEDRIVE" ) = "C:"
myProcessEnv( "HOMEPATH" ) = myProcessEnv( "userprofile" )
myProcessEnv.Remove("HOMESHARE")
myProcessEnv( "http_proxy" ) = "http://127.0.0.1:8123"
myProcessEnv( "https_proxy" ) = "http://127.0.0.1:8123"

myProcessEnv("PATH") = "C:\\Windows\\System32\\;C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\" 
myProcessEnv("PATH") = "F:\\node.js\\latest\\node_modules\\yarn\\bin;" + myProcessEnv("PATH")
myProcessEnv("PATH") = "F:\\node.js\\latest\\;" + myProcessEnv("PATH")
myProcessEnv("PATH") = "f:\\git\\cmd\\;" + myProcessEnv("PATH")
myProcessEnv("PATH") = "f:\\ruby\\latest\\bin;" + myProcessEnv("PATH")
myProcessEnv("PATH") = "f:\\ruby\\Ruby27-x64\\lib\\ruby\\gems\\2.7.0;" + myProcessEnv("PATH")
myProcessEnv("PATH") = "f:\\ConEmu\ConEmu\;" + myProcessEnv("PATH")

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
// myProcessEnv( "LC_CTYPE" ) = "en_US.utf8"
// myProcessEnv( "LC_COLLATE" ) = "C"
// myProcessEnv( "HOMESHARE" ) = "\\\\SHAWFILEP01\\Users$\\BaiC"
// myProcessEnv("PATH") = "c:/msys2/mingw64/bin/;" + myProcessEnv("PATH")
// myProcessEnv("PATH") = "F:/StrawberryPerl_x64/perl/bin/;" + myProcessEnv("PATH")
