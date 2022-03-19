更新日: {{ git_revision_date }}

# dart Futureでないvoid関数でawaitを使った場合の動作
awaitは機能し、`Future<void>`と同じ動きをする
![[Pasted image 20220310102512.png]]

```
import 'dart:async';

Future<String> fuga() async {
  return Future.delayed(Duration(seconds: 1), () => "fuga");
}

void hoge() async {
  print("start");
  print(await fuga());
  print("end");
}

void main() {
  hoge();
}

```

----
### Related Notes
- 

### References
- 

### Tags
- `#dart`