---
title: "Annie主题+Gitalk评论"
date: 2019-11-23T13:21:36+08:00
tags: [Hexo, Annie, Gitalk]  
categories: [TECH,Hexo]
draft: false
---
本文是以`Annie主题`+`Gitalk评论插件`搭建的博客评论功能，其中涉及到`Github仓库`的创建和`OAuth应用`的申请。

# 新建github仓库
首先登陆个人的[github](https://github.com/),点击`	New repository`创建..新的仓库..

![](/images/tech/2019/11/Annie_gitalk.png "创建新的仓库")

# 注册OAuth应用
Gitalk评论插件的授权机制依赖于`OAuth Application`，故使用Gitalk之前注册新应用。[注册链接](https://github.com/settings/applications/new "注册OAuth应用")

进入..注册应用界面..：

![](/images/tech/2019/11/Annie_gitalk2.png "注册应用界面")

|参数|说明|示例|
|:-:|:-:|:-:|
|Application name|应用名称(可任意填写)|`Gitalk`|
|Homepage URL|仓库地址(这里填写`步骤一`中仓库`Blog-Comments`的地址)|`https://github.com/zccon/Blog-Comments`|
|Application description|应用描述（可任意填写）|`Gitalk`|
|Authorization callback URL|博客地址（这里填写个人博客主页地址）|`https://zccon.github.io/`|




# 获取Client ID和Client Secret

![](/images/tech/2019/11/Annie_gitalk3.png "获取Client ID和Client Secret")

# 编辑主题配置文件
打开..主题目录..下的`_config.yml`文件，配置`Gitalk`评论插件的参数

```yml
comment:
    enable: true

gitalk:
    enable: true
    clientID: '1a2...' 
    clientSecret: '3cf...' 
    id: location.pathname
    repo: 'Blog-Comments'
    owner: 'zccon' 
    admin: 'zccon'
    distractionFreeMode: true
    #去除 more、index.html、?query=123等格式尾部 
    hrefTrimend: '#.*$,\\?.*$,index.html$' 
    
```

|参数|说明|示例|
|:-:|:-:|:-:|
|comment中的enable|comment总开关，`true`：启用|true|
|gitalk中的enable|gitalk开关，`true`：启用|true|
|clientID|`步骤三`中获取的`Client ID`|'1a2...'|
|clientSecret|`步骤三`中获取的`Client Secret`|'3cf...'|
|id|解决“未找到相关的issue进行评论，请联系@XXX初始化创建”问题|location.pathname|
|repo|`步骤一`中创建的仓库名（issues的容器）|'Blog-Comments'|
|owner|博客仓库的拥有者|'zccon'|
|admin|博客仓库的管理者|'zccon'|
|distractionFreeMode|Gitalk插件的参数（无干扰模式，`true`启用）|true|
|hrefTrimend|`Post url`处理（删除url中的#、index等字符，缩短url）|默认不变|

> 更多问题，请查看Gitalk评论插件的[ISSUES](https://github.com/gitalk/gitalk/issues)
