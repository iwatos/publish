# jsp jstl propertiesファイルから文言を取得する
application.propertiesファイルが存在する場合
`<fmt:bundle basename="application" >`で囲んだ中で
`<fmt:message key="item.id"/>`を使用する

```java
<fmt:bundle basename="application" >
　　<fmt:message key="item.id"/><br>  
　　<fmt:message key="item.name"/><br>
</fmt:bundle>
```

http://struts.wasureppoi.com/jstl/03_bundle.html

---
## Related Notes
- 

## References
- 

## Tags
- `#java/jsp` 