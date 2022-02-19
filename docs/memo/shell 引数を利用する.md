# shell 引数を利用する
|記法|表現される値| `sh hoge.sh A BB CCC` を実行した場合|
|-|-|-|
|`$1 - $n`| 引数に指定した変数|`${1}=A`, `${2}=BB`, `${3}=CCC`|
|`$0`| 指定したシェルスクリプトのパス|`hoge.sh`|
|`$`#`|引数の数|`3`|`


---
## Related Notes
- 

## References
- [Bash Reference Manual](https://www.gnu.org/software/bash/manual/bash.html)
- [引数を処理する | UNIX & Linux コマンド・シェルスクリプト リファレンス](https://shellscript.sunone.me/parameter.html)

## Tags
- `#cli`