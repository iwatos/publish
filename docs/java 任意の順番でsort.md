# java 任意の順番でsort
```java
public class MyObject {  
 String field;  
 MyObject(String field){  
 this.field = field;  
 }  
 String getField(){ return field; }  
}  
```

```java
public class MySort implements Comparator<MyObject> {  
 @Override  
 public int compare(MyObject o1, MyObject o2) {  
 return order(o1) - order(o2);  
 }  
  
 public int order(MyObject o) {  
 List<String> linkOrder = new ArrayList<>(Arrays.asList(  
 "apple",  
 "lemon",  
 "peach"  
 ));  
 int index = linkOrder.indexOf(o.getField());  
  
 // 定義されていない路線IDの場合は最後にする  
 return index != -1 ? index : linkOrder.size();  
 }  
}  
```

```java
List<MyObject> myObjects = new ArrayList<>(Arrays.asList(  
 new MyObject("lemon"),  
 new MyObject("cake"),  
 new MyObject("apple")  
));  
  
myObject.stream().sorted((o1, o2) -> new MySort().compare(o1, o2)).collect(Collectors.toList());
```

https://cyzennt.co.jp/blog/2021/06/09/java%EF%BC%9A%E4%BB%BB%E6%84%8F%E3%81%AE%E9%A0%86%E7%95%AA%E3%81%A7%E3%81%AE%E3%82%BD%E3%83%BC%E3%83%88/



---
## Related Notes
- 

## References
- 

## Tags
- `#java` 