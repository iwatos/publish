更新日: {{ git_revision_date }}

# git revert
## 通常のrevert
```sh
git revert -m 1 f60f24d
```

## mergeコミットのrevert
```sh
git revert -m 1 f60f24d
```

## 複数コミットのrevert
```sh
## --no-commitをつけないと位置コミットごとにrevertコミットされる
git revert --no-commit <戻したい一番古いコミットID>..HEAD
```

---
## Related Notes
- 

## References
- 

## Tags
- `#cli` 