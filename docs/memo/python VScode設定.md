# python VScode設定
setting.jsonに以下を追記

```json
{
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
	  "python.pythonPath": "${workspaceFolder}/.venv/bin/python",
	  "python.envFile": "${workspaceFolder}/.env",
	  "python.linting.enabled": true,
	  "python.linting.pylintEnabled": true,
	  "python.linting.pycodestyleEnabled": false,
	  "python.formatting.provider": "black",
	  "python.formatting.blackPath": "${workspaceFolder}/.venv/bin/black",
	  "python.sortImports.path": "${workspaceFolder}/.venv/bin/isort",
	  "python.linting.mypyEnabled": true,
	  "python.linting.mypyPath": "${workspaceFolder}/.venv/bin/mypy",
	  "python.linting.mypyArgs": [
		"--config-file", "mypy.ini"
	  ],
	  "python.testing.unittestEnabled": false,
	  "python.testing.nosetestsEnabled": false,
	  "python.testing.pytestEnabled": true,
	  "python.testing.pytestArgs": [
		"-vv",
		"--show-capture=all",
		"tests"
	  ]
}
```


---
## Related Notes
- 

## References
- https://qiita.com/homines22/items/dca21cf6b2eff858672b

## Tags
- `#python` 
- `#vscode` 