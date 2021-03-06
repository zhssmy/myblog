---
title: "Hexo写博客及语法规则"
date: 2018-09-12T10:15:53+08:00
tags: [Hexo, Markdown] 
categories: [TECH,Hexo]
draft: false
dropCap: falseto
toc: true
---

## 新建一篇文章
命令：

```
$ hexo new "文章标题"
```

例如，执行命令：`hexo new "Helloworld"`,**\source\\_posts**文件夹下会出现对应的文件**Helloworld.md**,打开即可编辑。

## 为文章设置标签
在新建的文章头部tags:标签后输入标签名（冒号与标签名之间有空格）

```
 ---
 title: Helloworld
 date: 2018-09-12 10:15:53
 tags:
 ---
```

例如，`tags: Hexo`,这样就为本篇文章贴上了**Hexo**标签，如果想加入多个标签，则输入`tags: [标签1, 标签2]`

## 为文章设置分类
在**tags**标签下加入**categories**，并添加自定义分类(如：article)，如下:

```
 ---
 title: Helloworld
 date: 2018-09-12 10:15:53
 tags: Hexo
 categories: article
 ---
```

## 字体样式
语法：
```
*斜体*，_斜体_
**粗体**
***加粗斜体***
```

效果：<br/>
*斜体*，_斜体_<br/>
**粗体**<br/>
***加粗斜体***<br/>

## 字体大小与颜色
语法：
```
<font face="黑体">我是黑体字</font>
<font face="楷体">我是楷体</font>
<font face="STCAIYUN">我是华文彩云</font>
<font color=#0099ff size=2 face="幼圆">我是幼圆 size=2 color=#0099ff</font>
<font color=#00ffff size=3>size=3 color=#00ffff</font>
<font color=gray size=4>size=4 color=gray</font>
```
效果：
<font face="黑体">我是黑体字</font><br/>
<font face="楷体">我是楷体</font><br/>
<font face="STCAIYUN">我是华文彩云</font><br/>
<font color=#0099ff size=2 face="幼圆">我是幼圆 size=2 color=#0099ff</font><br/>
<font color=#00ffff size=3>size=3 color=#00ffff</font><br/>
<font color=gray size=4>size=4 color=gray</font>


## 文字底色
语法：
```
<table><tr><td bgcolor=PowderBlue>背景色：PowderBlue，颜色值：#B0E0E6，rgb(176, 224, 230)</td></tr></table>
```

效果：
<table><tr><td bgcolor=PowderBlue>背景色：PowderBlue，颜色值： #B0E0E6，rgb(176, 224, 230)</td></tr></table>

## 分级标题
语法：
```
# 一级标题
## 二级标题
### 三级标题
#### 四级标题
##### 五级标题
###### 六级标题
```
（注：#与标题之间有空格）

## 超链接
语法：
```
链接：[百度](https://www.baidu.com)
```

效果：
链接：[百度](https://www.baidu.com)

## 插入图片
首先将图片放入**source/image**下，使用如下命令：

语法：
```
![](/image/egg.jpg)
```

## 插入视频
```html
//方法一
<video src="/videos/a.mp4" poster="/images/b.jpg"  style="object-fit:fill" controls></video>
```
```
//方法二
![](/videos/a.mp4 "说明文字")

```

效果：
![](/images/tech/2018/09/12/egg.jpg)

## 添加音乐
在网页搜索想要加入的音乐，点击*生成外链播放器*![](/images/tech/2018/09/12/送别.png)复制代码到博文中![](/images/tech/2018/09/12/送别2.png)

## 列表
### 无序列表
语法：
`* 无序列表1`
`+ 无序列表2`
`- 无序列表3`

效果：

* 无序列表1

+ 无序列表2

- 无序列表3


### 有序列表
语法：
`1.有序列表1`
`2.有序列表2`
`3.有序列表3`

效果：

1.有序列表1

2.有序列表2

3.有序列表3

## 表格

语法：
`|表头1|表头2|表头3|表头4`
`|:-:|:-:|:-:|:-:|`
`|内容1|内容2|内容3|内容4|`

效果：

|表头1|表头2|表头3|表头4|
|:-:|:-:|:-:|:-:|
|内容1|内容2|内容3|内容4|