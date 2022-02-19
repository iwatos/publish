# css 同じ行に中央寄せと端寄せを混在
```
.parent {
  display: flex;
  justify-content: center;
  position: relative;   //  これが必要
}

.child {
  position: absolute;  // これが必要
  right: 0;          // 右寄せ
}
```

---
## Related Notes
- 

## References
- https://qiita.com/nom0523/items/85ffdb75fc759ee37528

## Tags
- `#css` []