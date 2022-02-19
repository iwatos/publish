# jsp JSTLでforEach
List
```java
<c:forEach items="${list}"  var="entry" varStatus="status">  
	名前：<c:out value="${entry.name}"/><br>
</c:forEach>
```

Map
```java
<c:forEach items="${map}" var="entry" varStatus="status">
    Key = ${entry.key}, value = ${entry.value}<br>
</c:forEach>
```


## References
http://struts.wasureppoi.com/jstl/02_foreach.**html**

---
## Related Notes
- 

## References
- 

## Tags
- `#java/jsp` 