# openpyxl
https://openpyxl.readthedocs.io/en/stable/tutorial.html
https://gammasoft.jp/support/how-to-use-openpyxl-for-excel-file/#file-open

```python
import openpyxl

# エクセルファイルの取得（数式の計算結果が必要な場合 data_only=True）
book = openpyxl.load_workbook("filepath/Sample.xlsx", data_only=False)

# シートの取得
sheet = book["Sheet1"]

# 行の取得
row = sheet[1]

# セルの取得
cell1 = sheet['A1']
cell2 = sheet.cell(row=1, column=1)
cell3 = sheet.cell(1, 1)
clee4 = row[0]

# セルの値の読み取り
cell1.value
```

---
# Related Notes
- 

# References
- 

# Tags
- #python 