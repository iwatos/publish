# dart DateTimeをISO形式に変換（ミリ秒非表示、TimeZone付き）
```dart
String makeTimeZoneString(DateTime dateTime) {  
 final offset = dateTime.timeZoneOffset;  
 final sign = offset.isNegative ? "-" : "+";  
 final hour = offset.inHours.toString().padLeft(2, '0');  
 final minutes = (offset.inMinutes % 60).toString().padLeft(2, '0');  
 final timeZone = "$sign$hour:$minutes";  
 return timeZone;  
}  
  
String toIso8601StringWithTimeZoneWithoutMillSeconds(DateTime dateTime) {  
 return DateFormat("yyyy-MM-dd'T'HH:mm:ss${makeTimeZoneString(dateTime)}")  
 .format(dateTime);  
}
```

---
### Related Notes
- [[dart DateTimeの利用方法まとめ]]

### References
- https://stackoverflow.com/questions/60854312/how-do-i-format-datetime-with-utc-timezone-offset

### Tags
- `#dart`