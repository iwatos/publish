# 環境構築
## pythonインストール
[[anyenvの導入#pyenv]]

## poetryインストール
`brew install poetry`

## プロジェクト作成
1. ディレクトリ作成
```bash
mkdir python-env
cd python-env
```
2. pyproject.toml作成
```toml
[tool.poetry]
name = "python-env"
version = "0.1.0"
description = ""
authors = []

[tool.poetry.dependencies]
python = "^3.8"

[tool.poetry.dev-dependencies]
pytest = "*"
black = "*"
mypy = "*"
pylint = "*"
isort = "*"

[build-system]
requires = ["poetry>=1.0.0"]
build-backend = "poetry.masonry.api"

# black,pylint,isortの競合回避
# 
[tool.isort]
multi_line_output = 3
include_trailing_comma = true
force_grid_wrap = 0
use_parentheses = true
ensure_newline_before_comments = true
line_length = 88

[tool.pylint.messages_control]
disable = "C0330, C0326"

[tool.pylint.format]
max-line-length = "88"
```
3. インストール
`poetry install`

4. 補足
- `poetry run <モジュール名>` でpoetry環境でコマンド実行可能

---
## Related Notes
- 

## References
- 

## Tags
- #python 