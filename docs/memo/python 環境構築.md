更新日: {{ git_revision_date }}

# python 環境構築
## 環境構築
## pythonインストール
[[anyenv 導入]]

## poetryインストール
`brew install poetry`

## プロジェクト作成
参考）
[sandbox/python at main · iwatos/sandbox · GitHub](https://github.com/iwatos/sandbox/tree/main/python)

1. ディレクトリ作成
```bash
mkdir python-env
cd python-env
```

2. poetry環境準備
```toml:pyproject.toml
[tool.poetry]
name = "python-env"
version = "0.1.0"
description = ""
authors = []

[tool.poetry.dependencies]
python = "^3.9"

[tool.poetry.dev-dependencies]
pytest = "^5.2"
black = "^19.10b0"
pylint = "^2.5"
isort = "^5.9.3"
mypy = "^0.941"

[build-system]
requires = ["poetry-core>=1.0.0"]
build-backend = "poetry.masonry.api"

[tool.poetry.scripts]
main = "src.main:main"

## blackとの競合回避 https://black.readthedocs.io/en/stable/guides/using_black_with_other_tools.html`#pylint`
[tool.isort]
profile = "black"

[tool.pylint.messages_control]
disable = "C0330, C0326"

[tool.pylint.format]
max-line-length = "88"
```

上記ファイル作成後 `poetry install` を実行


## VSCode
.vscode/settings.json
.vscode/extensions.json
を作成する

```json:.vscode/settings.jon
{
    "python.defaultInterpreterPath": "${workspaceFolder}/.venv/bin/python",

    "python.formatting.blackPath": "${workspaceFolder}/.venv/bin/black",
    "python.sortImports.path": "${workspaceFolder}/.venv/bin/isort",
    "python.formatting.provider": "black",
    "[python]": {
        "editor.tabSize": 4,
        "editor.formatOnSave": true,
        "editor.formatOnPaste": false,
        "editor.formatOnType": false,
        "editor.insertSpaces": true,
        "editor.codeActionsOnSave": {
            "source.organizeImports": true
        },
    },

    "python.linting.pylintPath": "${workspaceFolder}/.venv/bin/pylint",
    "python.linting.pylintEnabled": true,

    "python.linting.mypyPath": "${workspaceFolder}/.venv/bin/mypy",
    "python.linting.mypyEnabled": true,
    "python.linting.mypyArgs": [
        "--config-file",
        "mypy.ini"
    ],

    "python.testing.unittestEnabled": false,
    "python.testing.pytestEnabled": true,
    "python.testing.pytestArgs": [
        "-vv",
        "--show-capture=all",
        "tests"
    ],

    "extensions.ignoreRecommendations": false,

    "python.languageServer": "Pylance",
    "python.analysis.completeFunctionParens": true,
    "python.analysis.typeCheckingMode": "strict",

    "autoDocstring.docstringFormat": "google",

    "python.envFile": "${workspaceFolder}/.env"
}
```

```json:.vscode/extensions.jon
{
    "recommendations": [
        "njpwerner.autodocstring",
        "ms-python.python",
        "ms-python.vscode-pylance"
    ]
}
```

---
## Related Notes
- 

## References
- 

## Tags
- `#python` 