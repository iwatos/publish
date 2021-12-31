# python csv操作
https://docs.python.org/ja/3/library/csv.html

```python
import csv

with open('filepath/sample.csv') as f:
    reader = csv.reader(f)
    for row in reader:
        print(row)
		## 行単位でリストで返される
		## ['21', '22', '23', '24']
```

---
## Related Notes
- 

## References
- 

## Tags
- `#python` 