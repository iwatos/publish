```dart
final dio = await DioHelper.createDefaultDio();  
dio.options.responseType = ResponseType.bytes;  
final Response response = await dio.get('画像URL');  
return Image.memory(response.data); // ←画像表示Widget
```

---
# Related Notes
- 

# References
- 

# Tags
- #flutter 