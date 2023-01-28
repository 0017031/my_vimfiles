import os
import subprocess
import sys
from pathlib import Path

my_env = os.environ.copy()
my_env.update({
    'HOME': os.environ.get('USERPROFILE'),
    'HOMEDRIVE': 'C:',
    'HOMEPATH': my_env.get('USERPROFILE'),
    'HOMESHARE': '',

    'LANG': 'en_US.UTF-8',
    'LC_COLLATE': 'C',

    'GVIM': '1',
    'http_proxy': 'http://127.0.0.1:8123',

    'PATH': r"C:\\Windows\\System32\\;C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\"
    r"F:\node.js\latest\node_modules\yarn\bin;F:\node.js\latest;"
    r"F:\git\cmd\;"
    r"F:\nvim\l\bin;",

    'MYVIMRC' : rf"{os.environ.get('USERPROFILE')}\vimfiles\vimrc"
    })


dest = Path(my_env.get('USERPROFILE'))/ "vimfiles/init.vim"
src = Path(my_env.get('MYVIMRC'))
dest.write_text(src.read_text()) #for text files


exe_path = r'f:\nvim\neovide.exe'
# var arg0 = " -u " + myProcessEnv( "MYVIMRC" )
# link.Arguments = " -qwindowgeometry 1500x900+150+50  -- " + arg0 + arg
my_command = [exe_path,"--geometry=222x58"]
my_command.extend(sys.argv[1:])
print(my_command)
subprocess.run(my_command, env=my_env )
