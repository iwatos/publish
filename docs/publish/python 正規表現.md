https://qiita.com/luohao0404/items/7135b2b96f9b0b196bf3
https://note.nkmk.me/python-re-match-search-findall-etc/
検証　https://regex101.com/

```py
import re
content \= r'hellow python, 123, end.' 
pattern \= 'hel'

re.match # 文字列の先頭がマッチするかチェック
re.search # 先頭に限らずマッチするかチェック
re.fullmatch # 文字列全体がマッチするかチェック
re.findall # マッチする部分すべてをリストで取得: findall()
# マッチする部分を置換: sub(), subn()
# 正規表現パターンで文字列を分割: split()

フラグの設定
re.ASCII

```

---
# Related Notes
- 

# References
- 

# Tags
- #python 