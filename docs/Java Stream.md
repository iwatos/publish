#java 
```java
directionMap.getDirectionMap().stream()  
      .filter(d -> d.getNode().getId().equals(form.getNodeId()))  
      .collect(Collectors.toList())
```