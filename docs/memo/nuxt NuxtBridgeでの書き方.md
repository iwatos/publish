# nuxt NuxtBridgeでの書き方
```ts
<script lang='ts' setup>  
import { computed, reactive, watch, withDefaults } from '@vue/runtime-core'  
  
// Props -----------------------------  
interface Props {  
 msg?: string  
 labels?: string[]  
}  
// const props = defineProps<Props>()  
const props = withDefaults(defineProps<Props>(), {  
 msg: 'hello',  
 labels: () => ['one', 'two']  
})  
  
// State------------------------------  
interface State {  
 id: number  
 name: string  
}  
const state = reactive<State>({  
 id: 1,  
 name: "hogename",  
})  
  
// computed ------------------------  
const doubleId = computed(()=> state.id * 2)  
  
// method ---------------------------  
const setId = (id: number) => {  
 state.id = id  
}  
  
// watch -------------------------------  
watch(() => state.id, (next, prev) => { console.log(next,prev) })  
  
// emit --------------------------------------  
const emit = defineEmits<{  
 (e: 'change', id: number): void,  
 (e: 'hogehoge', fugafuga: string): void  
}>()  
  
const handle = () => {  
 emit('hogehoge', 'hfhf')  
}  
  
</script>
```

---
## Related Notes
- 

## References
- 

## Tags
- `#js/vue/vuetify` 