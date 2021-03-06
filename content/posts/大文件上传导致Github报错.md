---
title: "大文件上传致Github报错"
date: 2019-11-23T23:38:20+08:00
tags: [Hexo, Git, Trouble]  
categories: [TECH,Hexo]
draft: false
dropCap: false
toc: true
---
## start
今天用Hexo写博客的时候在本地加入了一个`大视频文件`（270M）做本地测试，结果不小心使用`hexo d`部署到了github上，中途出现问题。

## 一、问题描述：

![](/images/tech/2019/11/large_file.png "问题描述")

上面标注的地方已经提示的很明显了，就是我上传的一个视频文件过大（大于100M），导致部署失败。

```bash
remote: error: GH001: Large files detected. You may want to try Git Large File Storage - https://git-lfs.github.com.
remote: error: Trace: 1ed90a12b5f48203c8ec19d87330097b
remote: error: See http://git.io/iEPt8g for more information.
remote: error: File statics/file.mp4 is 271.90 MB; this exceeds GitHub's file size limit of 100.00 MB
To https://github.com/zccon/zccon.github.io.git
 ! [remote rejected] HEAD -> master (pre-receive hook declined)
error: failed to push some refs to 'https://github.com/zccon/zccon.github.io.git'
FATAL Something's wrong. Maybe you can find the solution here: http://hexo.io/docs/troubleshooting.html
```
按照上面错误提示`第三行`给出的一个地址` http://git.io/iEPt8g`，里面github提供了一个方法（不过我用这个方法并没有解决）。

## 二、定位问题
进入该[地址](http://git.io/iEPt8g):
![](/images/tech/2019/11/large_file2.png)
主要看前两个介绍：
首先我们来看看`Conditions for large files`里面讲了些啥

**Conditions for large files**

![](/images/tech/2019/11/large_file3.png)

<blockquote class="colorquote info"><p>当单个push的文件大于`50M`时会被发出警告（`warning`），但是push操作仍会继续；</p></blockquote>

<blockquote class="colorquote info"><p>当单个push的文件大于`100M`时就会报错了（`error`），这时此次push操作会被拒绝（reject），commits 也不会保存到github的repository 中。</p></blockquote>

根据前面的提示找到引起错误的文件，例如我的文件是放在`主题文件夹/source/statics/xxx.mp4`里，引起错误的就是`xxx.mp4`这个文件。

找到之后就想着怎么恢复之前的状态，来看看`Removing files from a repository's history`里面怎么操作的吧！

## 三、解决问题

### 3.1方法一
**Removing files from a repository's history**
<blockquote class="colorquote warning"><p>注：这个方法并没有解决我的问题</p></blockquote>
![](/images/tech/2019/11/large_file4.png)

首先选择自己对应的系统，（比如我这里是windows系统），然后下面给出了具体的解决步骤以及指令。

> 1.Open Git Bash.<br/>
	打开Git Bash<br/>


> 2.Change the current working directory to your local repository.<br/>
	切换当前目录至本地仓库<br/>


> 3.To remove the file, enter git rm --cached:<br/>输入`git rm --cached giant_file`以移除文件<br/>
```
$ git rm --cached giant_file
# Stage our giant file for removal, but leave it on disk
```
> 4.Commit this change using --amend -CHEAD:<br/>
	输入`git commit --amend -CHEAD`使得change生效<br/>
```
$ git commit --amend -CHEAD
# Amend the previous commit with your change
# Simply making a new commit won't work, as you need
# to remove the file from the unpushed history as well
```
> 5.Push your commits to GitHub:<br/>
	push至github<br/>
```
$ git push
# Push our rewritten, smaller commit
```
<br/>

按照要求，我们首先找到本地仓库在哪。我这里在Hexo文件夹下有一个`.deploy_git`的文件夹，在这里面就是我们所有push到github的内容。可以看到我们之前的`大文件`在这里面也有一份。进入路径后直接按照流程指令来操作，注意自己的文件位置和名称！
![](/images/tech/2019/11/large_file5.png)
结果以失败告终，后面push的时候还是提醒有大文件，说明前面的操作并没有移除文件。

### 3.2方法二
因为是在提交的过程中报错，需要先撤销已提交的commit，直接重置到原来的commit
目录切换至`.deploy_git`

> 1. 查看提交记录
```bash
$ git log
```
> 2.找到提交前的commit,重置
```bash
$ git reset xxxxx
```
![](/images/tech/2019/11/large_file6.png)
这里可以查到我最近提交的几次commit和时间以及对应的一串`数字字母组合`，找到你想恢复的那个commit的那串`数字字母组合`，输入指令`git reset xxxxxxxxxxxxxxxxxxx`,发现问题就解决了
![](/images/tech/2019/11/large_file7.png)
在确定恢复哪一个commit时，我们可以到github中查看更详细的信息，包括每一个commit的push时间，编号以及更改的具体代码，这样我们就更加清楚我们需要恢复到哪一个commit中去。
![](/images/tech/2019/11/large_file8.png)
这里列出了最近的commit条目
![](/images/tech/2019/11/large_file9.png)
每次都更改了哪些内容：
![](/images/tech/2019/11/large_file10.png)

## end