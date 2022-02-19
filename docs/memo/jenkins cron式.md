# jenkins cron式

```
+------------ 分 (0 - 59で指定もできるが、他ジョブでずれる可能性が高いため、H と指定を推奨)
| +---------- 時 (0 - 23)
| | +-------- 日 (1 - 31)
| | | +------ 月 (1 - 12)
| | | | +---- 曜日 (0 - 6) (日曜日=0)
| | | | |
H * * * *
```

[\[Jenkins\] ビルドトリガ（定期的に実行）設定についてのまとめ - Qiita](https://qiita.com/koara-local/items/79cb9c08e77ac9d94b1d)

---
## Related Notes
- 

## References
- 

## Tags
- `#jenkins` 