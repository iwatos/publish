# spreadsheet 一つの文章に対して複数文言を置換する
SpreadSheetでSUBSTITUTE関数をネストして使用する
```js
=SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE([置換したい文字列]
,[置換前],[置換後],1)
,[置換前],[置換後],1)
,[置換前],[置換後],1)
```

---
## Related Notes
- 

## References
- 

## Tags
- `#spreadsheet` 