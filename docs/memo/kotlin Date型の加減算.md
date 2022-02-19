# kotlin Date型の加減算
```kt
val date = Date()
val calendar = Calendar.getInstance().apply { time = date }

calendar.add(Calendar.DATE, -1)  
val convertedDate = calendar.time
```

https://techback.info/kotlin-date-calculation/

---
## Related Notes
- 

## References
- 

## Tags
- `#kotlin`