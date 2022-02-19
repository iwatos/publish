# java ジェネリクスT
```java
public class TestGenerics<T> {

	private T pClass;
	
	public T getT() {
		return pClass;
	}
	
	public void  setT(T clazz) {
		this.pClass = clazz;
	}
}

public class TestMain {

	public static void main(String[] args) {
		TestGenerics<String> testGeneString = new TestGenerics<>();
		String testStr = "String型で指定した総称型です";
		testGeneString.setT(testStr);
		String testStr2 = testGeneString.getT();
		System.out.println(testStr2);

		TestGenerics<Integer> testGeneInteger = new TestGenerics<>();
		Integer testInteger = 10;
		testGeneInteger.setT(testInteger);
		Integer testInteger2 = testGeneInteger.getT();
		System.out.println(testInteger2);
	}

}
```

## References
https://layerprogram.com/javagenerics/

---
## Related Notes
- 

## References
- 

## Tags
- `#java` 