# flutter 静的解析でfreezedの生成ファイルを外す
```yaml:analysis_options.yaml
analyzer:  
  exclude:  
    - "lib/datasource/model/**.g.dart"  
	- "lib/datasource/model/**.freezed.dart"
```

---
### Related Notes
- 

### References
- 

### Tags
- `#flutter` 