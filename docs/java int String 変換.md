# java int String 変換
s## 推奨
```java
// int → String
String s = String.valueOf(i);

// String → int
int i = Integer.parseInt(s);
```


## 非推奨
```java
// int → String
String s = "" + i;
String s = new Integer(i).toString();
String s = Integer.toString(i);

// String → int
int i = new Integer(s).intValue();
int i = Integer.valueOf(s).intValue();

```

---
## Related Notes
- 

## References
- 

## Tags
- `#java` 