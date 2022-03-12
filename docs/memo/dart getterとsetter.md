# dart getterとsetter
```dart
class Box {
  Box(this.width, this.height);
  int width, height;
	
  int get area () => width * height;
  void set area(int area) {
    width = area/height;
  }
}

main() {
  Line Box = new Box(10, 5);

  print('(${box.area}');

  // メンバー変数と同じ方法で代入もできる。
  line.length = 20;
	
  // 4 * 5 = 20
  print('${box.width} * ${box.height} = ${box.area}');
}
```

----
### Related Notes
- 

### References
- http://dart-ing.blogspot.com/2012/03/dartgetset.html?m=1

### Tags
- `#dart` 