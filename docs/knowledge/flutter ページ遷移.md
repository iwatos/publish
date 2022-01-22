createPageRoute()を用意

```dart
import 'package:flutter/material.dart';

class SamplePage extends StatelessWidget {
  const SamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Sample')),
        body: const SizedBox());
  }

  static PageRoute createPageRoute() {
    return MaterialPageRoute(builder: (context) {
      return const SamplePage();
    });
  }
}
```
を用意して
```dart
Navigator.of(context).push(SamplePage.createPageRoute());
```
を実行

---
# Related Notes
- 

# References
- 

# Tags
- #flutter