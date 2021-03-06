---
title: "Blog中加入百度搜索"
date: 2020-01-07T14:56:04+08:00
draft: false
tags: [百度搜索框,Hugo]  
categories: [TECH,Hugo]
toc: true
---

前几天参照网上的资源自己弄了个搜索框，主要是因为现在大部分的网页搜索首页老是会有一些杂乱的东西弹出来，关还关不掉。于是就自己想着整一个搜索界面。我的目的很简单，让界面看起来尽量简洁，因为是用来搜索资源的，所以一些无关紧要的东西都可以不要。参考Google浏览器的样式，于是就有了下面的极简搜索页面：只显示一个搜索框，其他的东西统统扔掉。

![](https://zccon.oss-cn-beijing.aliyuncs.com/Hugo/images/tech/2020/01/Google_search.png "Google搜索界面")
![](https://zccon.oss-cn-beijing.aliyuncs.com/Hugo/images/tech/2020/01/search.png "自定义搜索界面")

今天突然想把这个搜索框整合到我的blog中来，哈哈哈，好像没多大的用，不过就是瞎折腾。这里我主要是记录一下加入百度搜索功能我做了哪些改变，说不定哪天不喜欢了我还可以参考这个记录把它给删掉。

# 新增一个菜单项
首先在<span class="filenamestyle">config.toml</span>配置文件中的相应位置添加以下代码
> 文件位置：Hugo\Sites\blog\config.toml
```diff
     [[menu.main]]
         url = "/about/"
         name = "关于"
         weight = 5
         pre = "internal"
         post = "user-circle"
+	[[menu.main]]
+        url = "/search/"
+        name = "百度"
+        weight = 6
+        pre = "internal"
+        post = "user-circle"
```
下面是效果图
![](https://zccon.oss-cn-beijing.aliyuncs.com/Hugo/images/tech/2020/01/%E6%96%B0%E5%A2%9E%E7%99%BE%E5%BA%A6%E8%8F%9C%E5%8D%95%E9%A1%B9.png "新增百度菜单项")

`post = "user-circle"`定义了菜单图标，这里我们先用..关于..菜单项的图标，等其他的问题解决了最后再来改图标。

# 添加搜索样式
打开文件<span class="filenamestyle">custom.scss</span>
> 文件位置：Hugo\Sites\blog\themes\meme\assets\scss\_custom\custom.scss
在文件末尾加入样式代码
```css
//设置百度search样式
.searchbar {     
	border: rgb(120, 120, 120) solid 2px;
	border-radius: 2em;    /*左右边框为半圆*/
	width: 80%;
	height: 40px;
	box-shadow: 0px 0px 10px rgb(125, 125, 125);
	margin: 0 auto;  /*重要！整个搜索框居中对齐*/
	padding: 4px;
	/*margin-top: 90px;	*/
}
.search{ 
	height: 38px;
	border:none;    /*取消默认的边框以设置自定义边框*/
	outline:none;   /*取消浏览器默认的蓝光边框以设置自定义的输入框*/   
	vertical-align: middle;
	/*background: #000000*/
	background-color:transparent;/*搜索框与搜索按钮透明*/
	
	width: 90%;
	margin-left: 10px;
	font: bolder;
	font-size: 20px;
	color:rgb(120, 120, 120);	
}

```

# 新建“百度”菜单的_index.md
在文件夹`blog/content`下新建文件夹`search`，并在search文件夹下新建文件<span class="filenamestyle">_index.md</span>，并写入以下代码

```html
<div class="searchbar">
<form action="https://www.baidu.com/baidu?ie=utf-8" target="blank">
<input class="search" type="text" placeholder="" autocomplete="off" name="word">
</form>
</div>
```

# 修改图标
在[SVG图标下载](https://fontawesome.com/icons?d=gallery&m=free)里找到相应的图标（直接搜索关键词`search`），下载下来之后将该图标的svg代码复制进<span class="filenamestyle">SVG.toml</span>文件中(有些小地方需要修改，svg标签中加入class="icon")，例如，下面是我的SVG.toml文件：
> 文件位置：Hugo\Sites\blog\themes\meme\data\SVG.toml
```diff
arrow-up = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" class="icon"><path d="M34.9 289.5l-22.2-22.2c-9.4-9.4-9.4-24.6 0-33.9L207 39c9.4-9.4 24.6-9.4 33.9 0l194.3 194.3c9.4 9.4 9.4 24.6 0 33.9L413 289.4c-9.5 9.5-25 9.3-34.3-.4L264 168.6V456c0 13.3-10.7 24-24 24h-32c-13.3 0-24-10.7-24-24V168.6L69.2 289.1c-9.3 9.8-24.8 10-34.3.4z"/></svg>'
+ search = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="icon"><path fill="currentColor" d="M505 442.7L405.3 343c-4.5-4.5-10.6-7-17-7H372c27.6-35.3 44-79.7 44-128C416 93.1 322.9 0 208 0S0 93.1 0 208s93.1 208 208 208c48.3 0 92.7-16.4 128-44v16.3c0 6.4 2.5 12.5 7 17l99.7 99.7c9.4 9.4 24.6 9.4 33.9 0l28.3-28.3c9.4-9.4 9.4-24.6.1-34zM208 336c-70.7 0-128-57.2-128-128 0-70.7 57.2-128 128-128 70.7 0 128 57.2 128 128 0 70.7-57.2 128-128 128z"></path></svg>'

```

再到<span class="filenamestyle">config.toml</span>文件中将百度菜单下的 `post = "user-circle"` 改为 `post = "search"`

# 最后效果
![](https://zccon.oss-cn-beijing.aliyuncs.com/Hugo/images/tech/2020/01/search_final.png "最后的效果")