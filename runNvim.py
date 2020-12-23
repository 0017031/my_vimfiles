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

    'PATH': 'C:\\Windows\\System32\\;C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\'
})

my_env['PATH'] = r"C:\Windows\System32\;C:\Windows\System32\WindowsPowerShell\v1.0"
my_env['PATH'] = rf"F:\node.js\latest\node_modules\yarn\bin;{my_env.get('PATH')}"
my_env['PATH'] = rf"F:\node.js\latest\;{my_env.get('PATH')}"
my_env['PATH'] = rf"F:\git\cmd\;{my_env.get('PATH')}"

userprofile = Path(os.environ.get('USERPROFILE'))
exe_path = r'f:\nvim\l\nvim-qt.exe'
my_command = [exe_path, '-U', 'NONE']
my_command.extend(sys.argv[1:])
subprocess.run(my_command, env=my_env, cwd=r'c:\w\mygithub\python-scripts')
