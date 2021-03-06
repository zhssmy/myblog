---
title: "MathJax渲染数学公式"
date: 2020-02-20T21:30:12+08:00
draft: false
tags: [MathJax]  
categories: [Tech,Hugo]
toc: false
dropCap: false
---

今天被一个博友咨询如何往博客中添加数学公式，（在这篇文章没写之前，我的博客还是不支持数学公式的），由于还没有支持数学公式的需求，所以我也一直没有折腾过这个。不过之前有看到过相关的文章，于是在网上找找资料便自己试了试，下面的内容是从网上摘录下来的部分笔记，完整的内容我已贴在了文章的最下面，欢迎访问原文。（本文只作自己的修改记录）

# 在footer.html文件中添加代码
在主题文件夹（\themes\meme\layouts\partials\custom）下的<span class="filenamestyle">footer.html</span>中，添加下面代码
```js
<script type="text/x-mathjax-config">
    MathJax.Hub.Config({
        tex2jax: {
            inlineMath: [['$','$'], ['\\(','\\)']],
            displayMath: [['$$','$$'], ['\[','\]']],
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

这样自己的博客就已经可以插入数学公式了。

在下篇文章《LaTeX数学符号公式汇总》中进一步了解如何使用各种数学符号与数学公式。

{{<notice notice-note>}}
作者：一念一觉一圣人</br>
链接：https://www.jianshu.com/p/5fd2c9b3b638</br>
来源：简书</br>
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
{{</notice>}}
