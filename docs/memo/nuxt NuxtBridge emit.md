# nuxt NuxtBridge emit

## 子
```vue
<script lang="ts" setup>  
const emit = defineEmits<{  
 (e: 'handler', src: string): void  
}>()  
const handler = (src: string) => {  
 emit('handler', src)  
}  
</script>
<template>
	<div @click="emit">Child Hello Vue Emit World</div>
</template>
```

## 親
```vue
<script lang="ts" setup>
const print = (test: string) => {
	console.log(test)
}
</script>
<template>
	<div @handler="print">Parent Hello Vue Emit World</div>
</template>
```

---
## Related Notes
- 

## References
- 

## Tags
- `#js/vue` 