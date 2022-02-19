# flutter DEBUGの帯を消す
main.dartのbuildファンクションに  ”debugShowCheckedModeBanner: false” を追加する。

```dart
 @override
Widget build(BuildContext context){
	return MaterialApp(debugShowCheckedModeBanner: false, ...)
}
```


---
## Related Notes
- 

## References
- https://note.com/y_shimooka/n/na873331cfb45

## Tags
- `#flutter` 