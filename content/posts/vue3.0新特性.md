---
title: "Vue3.0新特性"
date: 2021-04-23T17:52:56+08:00
draft: false
tags: [vue]
categories: [tech, 前端]
toc: true
dropCap: false
#是否显示更新时间
badge: false
---

## `Home.vue`文件结构

```vue
<template>

</template>

<script>
import NavHeader from "@/components/navHeader/NavHeader";
import { defineComponent } from "vue";
export default defineComponent({
  name: "Home", //组件名称
  //接受父组件数据
  props: {},
  //定义子组件
  components: {
    NavHeader,
  },

  setup(props, ctx) {
    return {};
  },
});
</script>

<style scoped lang="scss"></style>
```

> 其中`NavHeader `为子组件

## `ref`定义单个数据

### 引入ref

```javaScript
import { ref } from 'vue'
```

### 定义数据

```javaScript
setup(props,ctx){
  let name = ref('jack')
  let num = ref(10)
  let arr = ref(['a','b','c','d'])
  let obj = ref({
    age:20
  })
  return{
    name,
    num,
    arr,
    obj
  }
}
```

### 在页面中应用
```html
<template>
  <div>{{name}}</div>
  <div>{{num}}</div>
  <div>{{arr}}</div>
  <div>{{obj.age}}</div>
</template>
```

## `reactive`定义对象类型数据

### 引入reactive

```javaScript
import { ref, reactive } from 'vue'
```

### 定义数据

```javaScript
setup(props,ctx){
  let data = reactive({
    name:'jack',
    age:20,
    obj:{
      price:25,
      arr:['a','b','c']
    }
  })
  return{
    data
  }
}
```

### 在页面中应用
```html
<template>
  <div>{{data.name}}</div>
  <div>{{data.age}}</div>
  <div>{{data.arr}}</div>
  <div>{{data.obj.age}}</div>
</template>
```

> 如果数据太多不想输入`data.`前缀，使用`toRefs`来解决

首先引入toRefs
```javaScript
import { ref, reactive，toRefs } from 'vue'
```

在`return`中`data`改为`...toRefs(data)`
```javaScript
setup(props,ctx){
  return{
    ...toRefs(data)
  }
}
```

此时，在页面中访问时就不需要带`data.`前缀

{{< notice notice-warning >}}
data解构出来的变量不可以与setup()中已有的变量重复
{{< /notice >}}