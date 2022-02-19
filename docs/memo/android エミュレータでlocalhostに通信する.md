# android エミュレータでlocalhostに通信する
Androidエミュレータからlocalhostに通信する場合は
`localhost` `127.0.0.1` ではなく
`10.0.2.2` を指定する
```dart
// NG
"http://localhost:3000/endpoint"
"http://127.0.0.1:3000/endpoint"

// OK	
"http://10.0.2.2:3000/endpoint"
```

---
## Related Notes
- 

## References
- 

## Tags
- `#android` 