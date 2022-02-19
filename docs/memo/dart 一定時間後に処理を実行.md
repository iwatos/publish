# dart 一定時間後に処理を実行
```dart
Timer t = Timer(Duration(seconds: myDuration), () {
    checkAnswer('');
    jumpToNextQuestion();
  });
  // and later, before the timer goes off...
  t.cancel();
```

---
## Related Notes
- 

## References
- https://stackoverflow.com/questions/56119923/how-do-i-cancel-future-delayed

## Tags
- `#notag`