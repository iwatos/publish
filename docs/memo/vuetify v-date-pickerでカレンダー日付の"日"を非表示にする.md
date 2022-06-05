更新日: {{ git_revision_date }}

# vuetify v-date-pickerでカレンダー日付の"日"を非表示にする
`day-format`に以下の設定をする
```vue
 <v-date-picker
	:day-format="date => new Date(date).getDate()"
 ></v-date-picker>
```

----
### Related Notes
- 

### References
- [VuetifyのDate Pickerを日本語化したら"日"ってついてくる、やだキモい - nanisore oishisou](https://arm4.hatenablog.com/entry/2018/08/17/155344)

### Tags
- 