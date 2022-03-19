更新日: {{ git_revision_date }}

# flutter dioでContentTypeの指定
```dart
dio.post(
  '/info',
  data: {'id': 5},
  options: Options(contentType: Headers.formUrlEncodedContentType),
);
```

---
### Related Notes
- 

### References
- https://pub.dev/packages/dio`#using-applicationx-www-form-urlencoded-format`

### Tags
- `#flutter` 