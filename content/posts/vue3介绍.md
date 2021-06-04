---
title: "Vue3介绍"
date: 2021-05-09T15:18:15+08:00
draft: false
tags: [vue]
categories: [tech, 前端,vue3基础介绍]
toc: true
dropCap: false
#是否显示更新时间
badge: false
---

### 一.cdn引入
```javascript
https://unpkg.com/vue@3.0.10/dist/vue.global.js

<div id="app">
   x:{{position.x}}<br/>
   y:{{position.y}}
</div>
<script src="https://unpkg.com/vue@3.0.10/dist/vue.global.js"></script>
<script>
   const app = Vue.createApp({
         setup(){
         const position={
         	x:0,
         	y:0
         }
         return {
         	position
         }       
      },
   });
   app.mount('#app');
</script>
```

### 二.创建Vue3项目
- 创建Vue3的3种方式
    + Vue-CLI
    + Webpack
    + Vite
- Vite是Vue作者开发的一款意图取代webpack的工具
- 其实现原理是利用ES6的import会发送请求去加载文件的特性,
  拦截这些请求, 做一些预编译, 省去webpack冗长的打包时间
```
- 安装Vite
    npm install -g create-vite-app
- 利用Vite创建Vue3项目
    create-vite-app projectName
- 安装依赖运行项目
    cd projectName
    npm install
    npm run dev
```
或者
```
  npm init vite-app <project-name>
  cd <project-name>
  npm install
  npm run dev
```

### 三.创建vue3.0实例-createApp
- createApp介绍
返回一个提供应用上下文的应用实例。应用实例挂载的整个组件树共享同一个上下文。可以在 createApp 之后链式调用其它方法。该函数第一个参数接收一个根组件选项的对象，第二个参数可以将 props 传递给应用程序.
``` js
createApp(
  App,
  {
    username: '张三' // 提供 props，App 组件内部通过 props: ['username'] 接收
  }
).mount('#app')
```
- createApp在main.js中的使用
``` js
import { createApp } from 'vue';
import App from './App.vue';
import router from './router';
import store from './store';
import './App.scss'

const app = createApp(App)
app.use(router).use(store).mount('#app');
```

### 四.template模板使用变化
- vue2.0里 template模板里只能有一个根标签, 而3.0可以使用多个根标签

### 五.Vue3.0七大亮点
- Performance：性能比Vue 2.x快1.2~2倍，在`Vue3.0`中使用`Proxy`重写了响应式的代码，并且对编译器做了一定的优化，重写了虚拟`DOM`,让渲染有了很大的性能提升

- Tree shaking support：按需编译,体积比Vue2.x更小

- Composition API: 增加了组合API(类似React Hooks)，90%的`API`还是兼容`2.x`

- Better TypeScript support：更好的 Ts 支持，`Vue3.0`全部使用`TypeScript`进行重写

- Custom Renderer API：暴露了自定义渲染API

- Fragment, Teleport(Protal), Suspense：更先进的组件

- Vite：使用该工具，在开发阶段，不需要进行打包，直接运行项目，提升了开发的效率

### 六.vue3.0源码组织
![](images/源码组织结构.png)

可以看到最开始是以`compiler`开头的包，这些都是与编译相关的代码

- `compiler-core`是与平台无关的编译器
- `compiler-dom`是浏览器平台下的编译器，依赖于`compiler-core`
- `compiler-sfc`:用来编译单文件组件，依赖于`compiler-core`与`compiler-dom`
- `compiler-ssr`:是服务端渲染的编译器，依赖于`compiler-dom`
- `reactivity`:数据响应式系统
- `runtime-core`:是与平台无关的运行时
- `runtime-dom`:是针对浏览器的运行时，用来处理元素`DOM`的`api`和事件等
- `runtime-test`:进行测试的运行时
- `server-renderer`：进行服务端渲染
- `shared`:是`VUE`内部使用的一些公共的`API`
- `size-check`:是一个私有的包，用来检查包的大小
- `template-explorer`:是在浏览器中运行的实时编译组件，会输出`render`函数
- `Vue`构建完整版的`Vue`,依赖于`compiler`与`runtime`

