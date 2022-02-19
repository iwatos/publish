# vuetify v-autocompleteでitem-textの値をプロパティ以外に設定
下記のように指定できる
```vue
<v-select
  v-model="selectedItem"
  :items="items"
  item-value="id"
  :item-text="(item) => `テキスト:${item.text}`">
</v-select>
```

---
### Related Notes
- 

### References
- https://qiita.com/akido_/items/30c2aa8298f42ca159cd

### Tags
- `#js/vue/vuetify` 