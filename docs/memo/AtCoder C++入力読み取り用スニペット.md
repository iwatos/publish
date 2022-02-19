# AtCoder C++入力読み取り用スニペット
`#概要`
Atcoder入力読み取り用スニペット
中身の動作は以下参照
[[AtCoder C++入力読み取り用マクロ]]

Code→基本設定→ユーザスニペット
から設定

```json:cpp.json
{
	"AtCoderInput": {
		"prefix": "acin",
		"body": [
			"int $1, $2;",
			"cin >> $1 >> $2;"
		],
	},
	"AtCoderInput1": {
		"prefix": "acin1",
		"body": [
			"int $1;",
			"cin >> $1;",
			"vector<int> $2($1);",
			"for(int i = 0; i < $1; i++) {",
			"    cin >> $2[i];",
			"}"
		],
	},
	"AtCoderInput2": {
		"prefix": "acin2",
		"body": [
			"int $1, $2;",
			"cin >> $1 >> $2;",
			"vector<vector<int>> $3($2, vector<int>($1));",
			"for(int i = 0; i < $2; i++) {",
			"    for(int j = 0; j < $1; j++) {",
			"        cin >> $3[i][j];",
			"    }",
			"}",
		],
	},
}
```
