# java StreamAPIでMapを使う
`entrySet()`をりようする
```java
map.entrySet().stream()
	.map(e -> e.getKey() + ": " + e.getValue())
	.forEach(System.out::println);
```

---
## Related Notes
- 

## References
- 

## Tags
- `#java` 