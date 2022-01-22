```sh
VAR1=123456 # 数値
VAR2=hogehoge # 文字列
VAR3=" a b c d e f g " # 文字列

# コマンド結果
VAR4=`echo abcde`
VAR5=`$VAR1 $VA2`


echo $VAR1
echo `$VAR1 $VA2`
```

`=`の前後にスペースを入れるとエラーになるので注意！

---
# Related Notes
- 

# References
- https://shellscript.sunone.me/variable.html

# Tags
- #cli 