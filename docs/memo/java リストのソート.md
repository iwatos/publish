# java リストのソート

```java
List<Item> sorted = list.stream()
        .sorted(Comparator.comparing(Item::getId))
        .collect(Collectors.toList());
```

https://blog1.mammb.com/entry/2019/04/12/223737`#Java8-Stream-%E3%81%AB%E3%81%8A%E3%81%91%E3%82%8B%E6%AD%A3%E3%81%97%E3%81%84%E3%82%BD%E3%83%BC%E3%83%88`

---
## Related Notes
- 

## References
- 

## Tags
- `#java` 