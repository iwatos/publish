自作のオブジェクト`MyObject`のリストがあり、それを任意の順番で並べ替えたいとします。
```java:MyObject.java
public class MyObject {  
    String field;  
    
    MyObject(String field){  
        this.field = field;  
    }  
    
    String getField(){ return field; }  
}  
```

`Comparator<MyObject>`を実装した並び順定義のクラス`MySort`を作成します。
`order()`の処理で、`MyObject`のフィールド値から並び替え優先度を示す数値を算出し、それを利用して`compare()`を実装します。
```java:MySort.java
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

`stream().sorted((o1, o2) -> new MySort().compare(o1, o2))`としてやれば`MySort`で定義した順番で並べ替えられます。
`MySort`の`order()`の処理を変えることで複数フィールドを考慮した並び順も定義できます。

```java:main.java
public static void main(String[] args){
    List<MyObject> myObjects = new ArrayList<>(Arrays.asList(  
        new MyObject("lemon"),  
        new MyObject("cake"),  
        new MyObject("apple")  
    ));  
    
    myObjects = myObjects.stream()
        .sorted((o1, o2) -> new MySort().compare(o1, o2))
        .collect(Collectors.toList());

    for(MyObject myObject : myObjects){
        System.out.println(myObject.getField());
    }
    // 結果：
    // apple
    // lemon
    // cake
}
```

# 以下を参考にさせていただきました
https://cyzennt.co.jp/blog/2021/06/09/java%EF%BC%9A%E4%BB%BB%E6%84%8F%E3%81%AE%E9%A0%86%E7%95%AA%E3%81%A7%E3%81%AE%E3%82%BD%E3%83%BC%E3%83%88/

