```java
Map<String, List<Product>> grpByType = 
	prdList.stream()
	.collect(Collectors.groupingBy(Product::getProductType));
```

# References
https://qiita.com/KevinFQ/items/c4e7b5835487180d9659

---
# Related Notes
- 

# References
- 

# Tags
- #java 