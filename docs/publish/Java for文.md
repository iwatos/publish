```java
//通常
for (int i = 0; i < list.size(); i++) {  
	System.out.println(i + " : " + list.get(i));  
}    

// 拡張for文
for (String str : strArray) {  
	System.out.print(str);  
}

// stream
Arrays.stream(strArray)
	.forEach(str -> System.out.print(str));

```

---
# Related Notes
- 

# References
- 

# Tags
- #java 