# 環境
OS: MacOS Big Sur
poetry: v1.1.4
python: pyenv v3.9.0

# 事象 
`poetry add numpy`でエラーが出る
```bash
Failed to build numpy
  ERROR: Could not build wheels for numpy which use PEP 517 and cannot be installed directly
  WARNING: You are using pip version 20.3.1; however, version 21.0.1 is available.
  You should consider upgrading via the '<ProjectPath>/.venv/bin/python -m pip install --upgrade pip' command.
  

  at /usr/local/Cellar/poetry/1.1.4/libexec/lib/python3.9/site-packages/poetry/utils/env.py:1074 in _run
      1070│                 output = subprocess.check_output(
      1071│                     cmd, stderr=subprocess.STDOUT, **kwargs
      1072│                 )
      1073│         except CalledProcessError as e:
    → 1074│             raise EnvCommandError(e, input=input_)
      1075│ 
      1076│         return decode(output)
      1077│ 
      1078│     def execute(self, bin, *args, **kwargs):
```

# 対応
1. 以下のコマンドを打つ
`poetry config experimental.new-installer false`

2. もう一度numpyを追加
`poetry add numpy`

でインストール成功した。


# 参考
- poetryのgithub issue
https://github.com/python-poetry/poetry/issues/3196#issuecomment-713011483

- experimental.new-installerとは
https://dev.classmethod.jp/articles/poetry-install-error/#experimental.new-installer%E3%81%A8%E3%81%AF
の`experimental.new-installerとは`参照
