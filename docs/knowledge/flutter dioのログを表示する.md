`dio.interceptors.add(LogInterceptor());`を利用する

```dart
final dio = Dio();
dio.interceptors.add(LogInterceptor());
final Response response = await dio.get('/endopoint');
```

---
# Related Notes
- 

# References
- https://qiita.com/umechanhika/items/d214b77d74f0633a95e6

# Tags
- #flutter