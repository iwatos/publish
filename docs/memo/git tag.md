更新日: {{ git_revision_date }}

# git tag
## タグ一覧
`git tag -l`

## タグ付け
事前に直前のコミットが意図したものか確認すること
```
git tag 1.0.0
git push origin 1.0.0 ## リモートへのプッシュ
```

## タグ消し
```
git tag -d 1.0.0
git push origin :1.0.0
```

---
## Related Notes
- 

## References
- 

## Tags
- `#cli` 