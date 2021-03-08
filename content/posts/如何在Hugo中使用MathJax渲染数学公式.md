---
title: "如何在Hugo中使用MathJax渲染数学公式"
date: 2020-02-20T21:30:12+08:00
draft: false
tags: [MathJax, Hugo]
categories: [Tech, Hugo]
toc: false
dropCap: false
---

今天收到一位博友的咨询邮件，关于如何在 Hugo 博客中添加数学公式的问题。（在这篇文章还没写之前，我的博客其实是不支持数学公式渲染的）。

由于在写博文的时候还没有需要插入数学公式的场景，所以我也一直没有折腾过这方面的东西。为了解决这位博友的问题同时完善自己的博客，于是我抱着试一试的想法在网上查找相关资料。

以下提供`两种`解决方法:

### 方法一、在 footer.html 文件中添加代码

在主题文件夹`\themes\meme\layouts\partials\custom`下的<span class="filenamestyle">footer.html</span>文件中，添加下面代码

```js
<script type="text/x-mathjax-config">
    MathJax.Hub.Config({
        tex2jax: {
            inlineMath: [['$','$'], ['\\(','\\)']],
            displayMath: [['$$','$$'], ['\\[','\\]']],
            processEscapes: true,
            processEnvironments: true,
            skipTags: ['script', 'noscript', 'style', 'textarea', 'pre'],
            TeX: {
                equationNumbers: { autoNumber: "AMS" },
                extensions: ["AMSmath.js", "AMSsymbols.js"]
            }
        }
    });
</script>
<script type="text/javascript" async src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/MathJax.js?config=TeX-MML-AM_CHTML"></script>
```

保存以上代码就可以实现在自己的博客中插入数学公式了。

### 方法二、配置 config.toml 文件

```toml
# 是否开启（全局设置）
enableMathJax = true
```

配置参数`enableMathJax`值为 true 便可以实现插入 MathJax 数学公式了。

> 关于如何插入各种类型的数学公式及符号，请参考文章[LaTeX 数学符号公式汇总](https://zhssmy.github.io/posts/latex%E6%95%B0%E5%AD%A6%E7%AC%A6%E5%8F%B7%E4%B8%8E%E6%95%B0%E5%AD%A6%E5%85%AC%E5%BC%8F%E6%B1%87%E6%80%BB/)
