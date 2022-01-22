```dart
import 'package:flutter/material.dart';

class SamplePage extends StatefulWidget {
  const SamplePage({Key? key}) : super(key: key);

  @override
  _SamplePageState createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  var count = 0;
  
	@override  
	void initState() {  
	 super.initState(); 
	}
	
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Sample')),
        body: Column(
          children: [
            Text(count.toString()),
            OutlinedButton(
                onPressed: () {
                  setState(() {
                    count = count + 1;
                  });
                },
                child: const Text('+'))
          ],
        ));
  }
}

```

---
# Related Notes
- 

# References
- 

# Tags
- #flutter