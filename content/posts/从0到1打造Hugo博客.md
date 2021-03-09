---
title: "从0到1打造Hugo博客"
date: 2021-03-05T11:00:00+08:00
draft: false
tags: [Hugo]  
categories: [Tech,Hugo]
toc: true
dropCap: true
badge: false
---

本篇博文主要记录本Hugo博客从0到1的步骤，但其适用于其他大多数hugo博客的搭建流程，仅仅区别于主题的不同，欢迎大家参考并指出问题。

> 相关环境：Windows10 64位 + Hugo 0.81 + Git 2.30.1


## 具体流程

### 一、准备Hugo文件

下载hugo文件（extended扩展版）并解压放在自定文件夹（例：我存放的目录为`D:\Hugo\bin`）

> [Hugo下载地址](https://github.com/gohugoio/hugo/releases)

### 二、配置环境变量。

在`我的电脑->属性->高级系统设置->环境变量->系统变量->Path`中增加一条`D:\Hugo\bin`，即解压后的hugo.exe文件存放的目录。

{{< notice notice-note >}}
`D:\Hugo\bin`修改为自己对应文件位置路径
{{< /notice >}}

### 三、检查版本

打开cmd终端执行hugo version命令查看是否安装成功（是否输出Hugo版本信息）

```bash
hugo version
```

### 四、生成博客

打开bash命令窗口，进入`D:\Hugo\Sites`文件夹（生成站点的文件夹，自定义），输入命令

```bash
hugo new site myblog
```

{{< notice notice-info >}}
命令执行完成之后在`D:\Hugo\Sites\myblog`文件夹下自动生成博客需要的文件
{{< /notice >}}

### 五、安装主题

> [hugo主题网站](https://themes.gohugo.io/)

本篇博客使用的meme主题，作者：[reuixiy](https://io-oi.me) ，执行以下命令完成meme主题的安装。

```bash
cd myblog
git init
git submodule add --depth 1 https://github.com/reuixiy/hugo-theme-meme.git themes/meme
```

{{< notice notice-info >}}
`myblog`为上一步自动生成的文件夹
{{< /notice >}}

### 六、开始写作

将 `config.toml` 替换为示例配置。

```bash
rm config.toml && cp themes/meme/config-examples/zh-cn/config.toml config.toml
```

新建一篇文章和一个关于页面：

```bash
hugo new "posts/hello-world.md"
```
```bash
hugo new "about/_index.md"
```

### 七、本地启动

```bash
hugo server -t meme --buildDrafts
```

```bash
hugo server -D
```

### 八、准备GitHub

创建个人GitHub账号与仓库（命名为【GitHub账号名.github.io】）


### 九、部署到GitHub

```bash
hugo --theme=meme --baseUrl="https://zhssmy.github.io/" --buildDrafts
```
{{< notice notice-info >}}
在当前文件夹`myblog`下会生成public文件夹
{{< /notice >}}

接着将public文件夹上传至GitHub仓库

```bash
cd public
git init
git add .
git commit -m 'model：博客第一次提交'
git remote add origin https://github.com/zhssmy/zhssmy.github.io.git
git push -u origin master
```

### 十、访问网站

访问网址：[zhssmy.github.io](https://zhssmy.github.io)
