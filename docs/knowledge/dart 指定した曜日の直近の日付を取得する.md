```dart
  DateTime getLastWeekOfDayAndTimeDateTime(int weekOfDay, TimeOfDay timeOfDay) {
    final now = DateTime.now();
    final differenceInDays =
        (DateTime.daysPerWeek + now.weekday - weekOfDay) % DateTime.daysPerWeek;
    final lastWeekOfDayDate = now
        .subtract(Duration(days: differenceInDays != 0 ? differenceInDays : 7));
    return DateTime(lastWeekOfDayDate.year, lastWeekOfDayDate.month,
        lastWeekOfDayDate.day, timeOfDay.hour, timeOfDay.minute);
  }
```

---
# Related Notes
- 

# References
- https://sysrigar.com/2020/07/18/flutterdart-%E7%9B%B4%E8%BF%91%E3%81%AE%E9%81%8E%E5%8E%BB%E3%81%AE%E6%97%A5%E6%9B%9C%E6%97%A5%E3%81%AE%E6%97%A5%E4%BB%98%E3%82%92%E6%B1%82%E3%82%81%E3%82%8B%E3%82%B3%E3%83%BC%E3%83%89/

# Tags
- #notag