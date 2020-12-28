import os
import subprocess
import sys
from pathlib import Path

my_env = os.environ.copy()
my_env.pop('HOMESHARE',None)
my_env.update({
    'HOME': os.environ.get('USERPROFILE'),
    'HOMEDRIVE': 'C:',
    'HOMEPATH': my_env.get('USERPROFILE'),

    'LANG': 'en_US.UTF-8',
    'LC_COLLATE': 'C',

    'http_proxy': 'http://127.0.0.1:8123',
    'https_proxy': 'http://127.0.0.1:8123',

    'PATH': r"C:\\Windows\\System32\\;C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\;"
            r"C:\Windows\System32\;C:\Windows\System32\WindowsPowerShell\v1.0;"
            r"F:\node.js\l\node_modules\yarn\bin;F:\node.js\l;"
            r"F:\racket\l;"
            r"F:\haskell\stack\l;F:\haskell\local_bin;F:\haskell\ghc-8.8.4\bin;"
            r"F:\git\cmd;" ,
})


my_command = [r'f:\gvim\l\gvim.exe']
my_command.extend(sys.argv[1:])

# print(my_command)

subprocess.run(my_command, env=my_env)
