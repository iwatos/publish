# css 点滅アニメーションの実装
1秒間隔の点滅
```html
<div class="flash">点滅</div>
```

```css
.flash{
  animation: flash 1s linear infinite;
}

@keyframes flash {
  0% {
    opacity: 1;
  }

  50% {
    opacity: 0;
  }
  
  
  100% {
    opacity: 1;
  }
}
```

----
### Related Notes
- https://1-notes.com/flash-animation/

### References
- 

### Tags
- `#css` 