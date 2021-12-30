[JSTLでプロパティが存在するかを取得する - azuki note](https://kenichiro22.hatenablog.com/entry/20101221/1292896320)

```java
<c:catch var="exception">
    <c:set var="dummy" value="${user.admin}"/>
</c:catch>
<c:set var="admin" value="${!empty exception && user.admin}"></c:set>
<c:if test="${admin}">
 ...
</c:if>
```

---
# Related Notes
- 

# References
- 

# Tags
- #java/jsp 