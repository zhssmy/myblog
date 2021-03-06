---
title: "PHP学习开发环境的安装"
date: 2019-12-02T10:04:41+08:00
draft: false
tags: [Php,Xampp]  
categories: [TECH,前端]
toc: true
dropCap: false
badge: false
---


## 开发环境
`win10(64位)` + `Google Chorme` + `sublime text3` + `xampp` + `Navicat`


## 文件夹的设置
`目的`：显示文件的后缀<br/>
任意打开一个文件夹，点击 `查看` ，勾选上 `文件扩展名` 。
![](https://zccon.oss-cn-beijing.aliyuncs.com/Hugo/images/tech/2019/%E6%96%87%E4%BB%B6%E6%89%A9%E5%B1%95%E5%90%8D.png "勾选上文件扩展名")

## 安装编辑器 sublime text3
[sublime text3 下载地址](http://www.sublimetext.com/3)<br/>
安装过程就不用说了，直接下一步就好了。
![](https://zccon.oss-cn-beijing.aliyuncs.com/Hugo/images/tech/2019/sublime%20text3.png "sublime text3")

## 安装 xampp
[XAMPP 官方下载地址](https://www.apachefriends.org/zh_cn/download.html)<br/>
下载好之后点击 `.exe` 后缀文件，进行安装

![](https://zccon.oss-cn-beijing.aliyuncs.com/Hugo/images/tech/2019/xampp%E8%A7%A3%E5%8E%8B.png "选择解压路径")

> 注意：文件路径不要使用中文

安装好了之后直接打开xampp,这时候点击 `Apache` 和 `MySql` 的Start按钮，如果 `Apache` 和 `MySql` 都变成 ..绿底.. 并且拥有 ..端口号.. ，那么就代表 `xampp` 打开成功了！
![](https://zccon.oss-cn-beijing.aliyuncs.com/Hugo/images/tech/2019/xampp%E6%8E%A7%E5%88%B6%E9%9D%A2%E6%9D%BF.png "xampp控制面板")

如何验证成功了呢？<br/>
我们在浏览器地址栏中打开 `127.0.0.1` ，这时我们就能看到如下的页面
![](https://zccon.oss-cn-beijing.aliyuncs.com/Hugo/images/tech/2019/xampp_phpversion.png "index.html")

> 关于127.0.0.1：一个特殊的IP地址，在百度中直接搜索![](https://zccon.oss-cn-beijing.aliyuncs.com/Hugo/images/tech/2019/127.0.0.1.png "本地机")

那么这个地址代表的是本地哪里的文件呢？<br/>
在你的xampp安装路径下有个 `htdocs` 文件夹，下面会有一个 `index.html` 文件，127.0.0.1指的就是这个目录下的这个文件，可以自己创建一个 `index.html` 文件替换掉它再刷新网页试试效果
![](https://zccon.oss-cn-beijing.aliyuncs.com/Hugo/images/tech/2019/htdocs.png "index文件路径")
如果没有 `index.html` 文件，那么浏览器将会显示当前文件夹包含的 ..所有文件列表..

## 下载php手册
浏览器地址栏输入 `https://www.php.net/` 在里面找到中文版本的下载

其他php手册：这里是[w3school在线php手册](https://www.w3school.com.cn/php/php_ref.asp)

## 安装navicat
[Navicat for MySQL 官方下载地址](https://www.navicat.com.cn/products/navicat-for-mysql)<br/>
下载安装好了之后点击连接
![](https://zccon.oss-cn-beijing.aliyuncs.com/Hugo/images/tech/2019/navicat.png "navicat连接")

> 用户名和密码均为 `root`


到此为止，php的开发环境就已经安装好了。


[本文参考地址](https://www.w3cschool.cn/minicourse/play/phpinit#menulist)