```py
import csv
import json


with requests.Session() as s:
	res = s.get(CAMPAIGNS_PATH)  
	content = res.content.decode("shift-jis")  
	# ヘッダー行がある場合
	reader = csv.DictReader(content.splitlines(), delimiter=",")  
	for row in reader:
		try:
			print(row)
		except Exception as e:  
            logger.error("Error in reading campaign csv row : %s", json.dumps(row))
 			logger.error(e)
```

---
# Related Notes
- 

# References
- 

# Tags
- #python 