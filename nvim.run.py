import os
import subprocess
import sys
from pathlib import Path
import _winapi

try:
    source = r'C:\Users\baic\d33\OneDrive - Boston Scientific\work_one_drive.vdi\settings_for_sync\my.vimfiles'
    target = rf"{os.environ.get('USERPROFILE')}\AppData\Local\nvim"
    _winapi.CreateJunction(source, target)

except FileExistsError:
    pass

my_env = os.environ.copy()
my_env.pop('HOMESHARE', None)
my_env.update({
    'HOME': my_env.get('USERPROFILE'),
    'HOMEDRIVE': 'C:',
    'HOMEPATH': my_env.get('USERPROFILE'),

    'LANG': 'en_US.UTF-8',
    'LC_COLLATE': 'C',

    # 'GVIM': '1',
    'http_proxy': 'http://127.0.0.1:1082',
    # 'XDG_CONFIG_HOME':rf"{my_env.get('USERPROFILE')}\.local"
    
    'PATH': r"C:\Windows\System32\;" # ;C:\Windows\System32\WindowsPowerShell\v1.0\;
            r"D:\scoop\apps\nodejs\current\;D:\scoop\apps\nodejs\current\node_modules\corepack\shims\;"
            r"D:\scoop\apps\git\current\bin\;",
    'MYVIMRC' : rf"{my_env.get('USERPROFILE')}\vimfiles\vimrc"
    })

# exe_path = r'D:\scoop\apps\neovim\current\bin\nvim-qt.exe'
# my_command = [exe_path,"-qwindowgeometry", "1500x900+150+50",  "--", "-u",  my_env['MYVIMRC']]

exe_path = r'D:\scoop\apps\neovim\current\bin\nvim.exe'
my_command = [exe_path,"--", "-u",  my_env['MYVIMRC']]

my_command.extend(sys.argv[1:])
print(my_command)
subprocess.Popen(my_command, env=my_env, start_new_session=True)
