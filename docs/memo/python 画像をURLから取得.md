# python 画像をURLから取得
```py

image = None

try:  
    with requests.Session() as s:  
        res = s.get(IMAGE_PATH)  
 		res.raise_for_status()
		image = res.content
	except Exception as e:  
    	logger.error("Error in fetching image : %s", image_path)  
 		logger.error(e)

## ファイル書き出し
with open(FILE_PATH, mode='wb') as f:
    f.write(image)
```

---
## Related Notes
- 

## References
- 

## Tags
- `#python` 