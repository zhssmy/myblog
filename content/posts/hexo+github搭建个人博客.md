---
title: "Hexo搭建个人博客"
date: 2018-09-11T15:28:04+08:00
draft: false
tags: [Hexo,Github]  
categories: [TECH,Hexo]
toc: true
dropCap: false
---

## 搭建环境
在搭建个人博客之前，首先我们配置下所需的一些环境，下载并安装以下两个工具

1. [`node.js`](https://nodejs.org/en/)

2. [`git`](https://git-scm.com/downloads)

安装过程比较简单，直接下一步即可。

> 注意记住它们的安装路径。

安装好之后，打开命令窗口（按住Win+R后输入CMD）
![](https://zccon.oss-cn-beijing.aliyuncs.com/Hugo/images/tech/2018/09/cmd.png "打开命令窗口")

分别输入 `node -v` 、`npm -v`及`git --version` 查看刚才我们安装的软件的版本
![](https://zccon.oss-cn-beijing.aliyuncs.com/Hugo/images/tech/2018/09/version.png "查看软件版本")

能看到上面红色框中的版本号就说明我们已经将`node.js`和`git`装好了。
## 配置GitHub
接下来我们需要一个github账号并对它进行配置。
### 生成SSH key
打开`Git Bash`，输入`ssh-keygen -t rsa`然后按三下回车
![](https://zccon.oss-cn-beijing.aliyuncs.com/Hugo/images/tech/2018/09/sskey.png)

接着就会在`C:\Users\Administrator.ssh`目录下生成`id_rsa`和`id_rsa.pub`两个文件，id_rsa是`密钥`，id_rsa.pub是`公钥`

![](https://zccon.oss-cn-beijing.aliyuncs.com/Hugo/images/tech/2018/09/04.png "公钥与私钥文件")

接下来需要将`id_rsa.pub`的内容添加到GitHub上，这样本地的`id_rsa`密钥才能跟GitHub上的`id_rsa.pub`公钥进行 ..配对.. ，才能够授权成功。

### 在GitHub上添加SSH Key
进入Settings
![](https://zccon.oss-cn-beijing.aliyuncs.com/Hugo/images/tech/2018/09/05.png)
![](https://zccon.oss-cn-beijing.aliyuncs.com/Hugo/images/tech/2018/09/06.png)
![](https://zccon.oss-cn-beijing.aliyuncs.com/Hugo/images/tech/2018/09/07.png)

把`id_sra.pub`的内容复制粘贴到`key`（id_sra.pub可以使用记事本打开），最后`Add SSH key`就可以了。

### 测试是否成功
SSH key 添加成功之后，输入`ssh -T git@github.com`进行测试，如果出现以下提示证明添加成功了。
![image.png](https://zccon.oss-cn-beijing.aliyuncs.com/Hugo/images/tech/2018/09/08.png)

## 创建 GitHub 仓库
![image.png](https://zccon.oss-cn-beijing.aliyuncs.com/Hugo/images/tech/2018/09/09.png)
注意：项目名称一定要使用 `你的名字 + .github.io`
![image.png](https://zccon.oss-cn-beijing.aliyuncs.com/Hugo/images/tech/2018/09/10.png)

## 设置本地博客的配置
### 安装Hexo
在你认为合适的地方创建一个文件夹，然后在文件夹空白处按住`Shift+鼠标右键`，然后点击在此处打开命令行窗口。（同样要记住啦，下文中会使用在当前目录打开命令行来代指上述的操作）

> 我的电脑出现了点问题，右键不能用，所以我这里先打开命令行然后自己进入Hexo文件夹

在命令行输入`npm install -g hexo`
然后输入 `npm install hexo --save`这时候你会看到命令窗口刷了一堆白字，然后输入 `hexo -v` 查看hexo是否安装成功了。

![image.png](https://zccon.oss-cn-beijing.aliyuncs.com/Hugo/images/tech/2018/09/hexoVersion.png)

### 初始化Hexo
在命令窗口中，继续输入 "hexo init"，等待下载好了之后输入 "hexo s"
![image.png](https://zccon.oss-cn-beijing.aliyuncs.com/Hugo/images/tech/2018/09/hexoS.png)
出现以上信息时就可以打开浏览器了，在地址栏中输入 [http://localhost:4000/](https://link.jianshu.com/?t=http://localhost:4000/) 我们就可以看到如下图的界面，这个就是我们的博客。
![image.png](https://zccon.oss-cn-beijing.aliyuncs.com/Hugo/images/tech/2018/09/11.png)

## 新建文章
命令窗口输入`hexo new 'filename'`我们的文件夹（`F:\Hexo\source\\_posts`）下面就会生成一个新的md文件

## 发布博客
复制我们的GitHub项目地址，比如我这边是：`https://github.com/zccon/zccon.github.io.git`
然后打开我们新建的文件夹（`F:\Hexo`）下面生成的`_config.yml`文件，在最下方作如下修改
![image.png](https://zccon.oss-cn-beijing.aliyuncs.com/Hugo/images/tech/2018/09/hexodeploy.png)

> `deploy`: 是部署的意思<br/>
> `type`: git 就是使用 git 进行部署<br/>
> `repo`: github仓库地址

接下来回到命令窗口，输入 `npm install hexo-deployer-git --save`

安装好Git上传插件之后，输入 `hexo g`，然后输入 `hexo d`就可以将我们的博客上传到我们的GitHub了，而且以后更新文章就只需要用这两个命令就可以了。这样别人也可以通过 `https://yourname.github.io`来访问我们的博客了（开头一定要用`https`，yourname是你的github的名字）。