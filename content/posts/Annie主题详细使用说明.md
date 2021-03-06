---
title: "Annie主题详细使用说明"
date: 2019-11-21T23:16:25+08:00
tags: [Hexo, Annie]  
categories: [TECH,Hexo]
draft: false
dropCap: false
toc: true
---

> 开始之前的说明<br/>
> 文中所有的指令都是在..Hexo..文件夹下开启的命令行中执行的 

1. 代码对比

```diff
  This is a diff block.
+ This is add!
- This is subtract!
```

2. Bash指令

```bash
bash指令
```

3. 提示信息

<blockquote class="colorquote info"><p>这是一个info提示</p></blockquote>

<blockquote class="colorquote success"><p>这是一个success提示 </p></blockquote>

<blockquote class="colorquote warning"><p>这是一个warning提示</p></blockquote>

<blockquote class="colorquote danger"><p>这是一个danger提示</p></blockquote>


4. 文件目录

|序号|名词|说明|目录|
|:-:|:-:|:-:|:-:|
|1|<font color=#ff4444 face="幼圆">站点配置文件</font>|..站点目录..下的`_config.yml`文件|Hexo/_config.yml|
|2|<font color=#0099ff face="幼圆">主题配置文件</font>|..主题目录..下的`_config.yml`文件|Hexo/themes/Annie/_config.yml|
|3|文章目录|文章.md文件|Hexo/source/_posts|

## LOGO和FAVICON
编辑<font color=#0099ff face="幼圆">主题配置文件</font>，设置`favicon`和`logo`的路径即可。

> 当然，你可以使用..文字..logo或..图片..logo，即logo的值为空时，主题使用`title`的值作为logo！


```diff
# favicon & logo
# if the value of logo is false, the 'title' is optional.
- favicon: /img/favicon.ico
- logo: /img/logo.png
- title: Welcome 
+ favicon: /img/your-favicon.ico
+ logo: /img/your-logo.png
+ title: your-title
```

> 这里的..img..是指的`Hexo/themes/Annie/source/img`目录

## 页头背景图片
文章详情页的..页头背景图片..为该文章的封面图，其他页的..页头背景图片..为随机图片或固定图片。

> 原则上:<br/>
> 使用..固定图片..时，应将参数`mode`设为normal，然后设置`normal_url`的路径；<br/>
> 使用..随机图片..时，应将参数`mode`设为random，然后设置`random_url`的路径。

```
# background_image
# /img/1.jpg
# https://source.unsplash.com/collection/954550/1920x1080
# https://sariay.github.io/Random-img/
# May be cause CROS bug!
background_image:
    mode: normal #normal or random
    normal_url: /img/1.jpg
    random_max: 110 
    random_url: https://sariay.github.io/Random-img/

```

<blockquote class="colorquote warning"><p>注意跨域问题，尽量不使用跨域的图片（即背景图片和网页最好托管在一起，存放于同一服务器）</p></blockquote>

编辑<font color=#0099ff face="幼圆">主题配置文件</font>，找到`background_image`标签进行相应设置。

1. 使用..固定图片..，请确保参数`mode`设为normal，然后设置参数`normal_url`的值

```diff
background_image:
+   mode: normal #normal or random
+   normal_url: /img/1.jpg
    random_max: 110 
    random_url: https://sariay.github.io/Random-img/
```

2. 使用unplash..随机图片..，请确保参数`mode`设为normal，然后设置参数`normal_url`的值

```diff
background_image:
+   mode: normal #normal or random
+   normal_url: https://source.unsplash.com/collection/954550/1920x1080
    random_max: 110 
    random_url: https://sariay.github.io/Random-img/
```

3. 使用自定义..随机图片..，请确保参数`mode`设为random，然后设置参数`random_max`、`random_url`的值
- 第一步、fork [随机图片集](https://github.com/Sariay/Random-img)；
- 第二步、开启你所fork的仓库的page服务；
- 第三步、获取相对地址；
- 第四步、设置random_url为获得的相对地址。

```diff
background_image:
+   mode: random #normal or random
    normal_url: https://source.unsplash.com/collection/954550/1920x1080
+   random_max: 110 
+   random_url: https://sariay.github.io/Random-img/
```

你可以将**随机图片集**上传到云（腾讯云、七牛云等），然后获取**https://....../Random-img/**格式的地址，最后将`random_url`的值设置为该地址。

你也可以在主题目录下的img文件夹中新建Random-img文件夹，将**0.jpg**、**1.jpg**、**2.jpg**、**3.jpg**……**110.jpg**命名格式的图片放入其中，然后将`random_url`的值设置为**/img/Random-img/**。

<blockquote class="colorquote warning"><p>图片的命名使用连续的整数，random_max的值小于等于（0、1、2、3…..110）的最大整数。（ps：如你偏爱访问速度🙃，尽可能使用固定图片）</p></blockquote>

## 随机名言与当地时间

每次刷新网页，网页页头展示一条随机名言，获取并展示该时区的标准时间。
```diff
# show motto
motto:
    enable: true
    
# show current time
+ #This is only a demo, please go to "https://time.is" to set your city time!
timejs:
    enable: true
```

编辑<font color=#0099ff face="幼圆">主题配置文件</font>，设置`motto`和`timejs`下的enable为true的参数即可。

## 预加载遮罩
预加载遮罩的作用为：确保背景图片加载完成和背景构造完成。<br/>
当背景加载并构造完成时，主题立即移除遮罩。预加载行为的超时时间默认设为10s，即最多10s左右后，不管背景是否加载并构造完成，主题都移除遮罩。你可以决定是否使用：
```diff
# 002-PROLOADER
# animation: spinner | transition | cyclic
preloader:
  + enable: true
  + animation: transition
```

编辑<font color=#0099ff face="幼圆">主题配置文件</font>，设置`preloader`下的enable为true并设置`animation`参数（spinner, transition or cyclic）。

## 首页文章展示样式
首页文章展示有两种模式：..图文模式..`cart`和..纯净模式..`pure`

编辑<font color=#0099ff face="幼圆">主题配置文件</font>，设置`index_style`的参数即可。
```diff
# 003-INDEX
# index-style: pure | cart
+ index_style: cart

# index_cart_cover
+ cover: /img/cart_cover.jpg
+ lazy_image: /img/placeholder.jpg
```
<blockquote class="colorquote info">未设置图片的文章默认设置cover路径下的图片，文章图片未加载出来时显示lazy_image下的图片</blockquote>

### 设置文章封面图
在每篇文章的头部添加`cover`标签设置每篇文章的背景，路径可为相对路径或绝对路径。
```diff
---
  title: title
  date: 2019-01-01 08:00:00
  tags: [tag1, tag2, tag3]
  categories: Note
  description: 
  abstract: 
+ cover: /img/1.jpg
---
```

### 首页的分页
hexo博客默认首页分页，编辑<font color=#ff4444 face="幼圆">站点配置文件</font>，设置参数`per_page`为1、2、3…..以达到分页目的，0则不分页。
```diff
# Home page setting
# path: Root path for your blogs index page. (default = '')
# per_page: Posts displayed per page. (0 = disable pagination)
# order_by: Posts order. (Order by date descending by default)
+index_generator:
  path: ''
+ per_page: 5
  order_by: -date
```

### 文字的截断
编辑<font color=#0099ff face="幼圆">主题配置文件</font>
`excerpt_cart`为图文模式的截取字数，推荐小于等于100;
`excerpt_pure`为纯净模式的截取字数，推荐字数为300;
`excerpt_link`为阅读更多按钮展示与否的开关。

```diff
# post_excerpt for index page
excerpt_cart: 80
excerpt_pure: 300   
excerpt_link: true
```

## 其他page的使用

### 归档页(archive)

Annie主题的归档页按年归档，不分页。当然，可以置参数`archive_generator.per_page`（<font color=#ff4444 face="幼圆">站点配置文件</font>）为1、2、3…..以达到分页目的。
<blockquote class="colorquote warning"><p>Annie主题中无效，分页是对该页面[主页、归档页、标签页、分类页]的文章进行分页，即每次（每页）展示指定数量的文章</p></blockquote>
```yml
archive: 1
category: 1
tag: 1

archive_generator:
  per_page: 10

tag_generator:
  per_page: 0

category_generator: 
  per_page: 0
```
### 分类页(categories)

执行命令`$ hexo new page categories`，..创建分类页..
```bash
$ hexo new page categories
```
编辑..站点目录..下的`source/categories/index.md`
```diff
---
title: categories
date: 2018-09-11 20:31:03
+ type: "categories"
---
```
### 标签页(tags)

执行命令`$ hexo new page tags`，..创建标签页..
```bash
$ hexo new page tags
```
编辑..站点目录..下的`source/tags/index.md`
```diff
---
title: tags
date: 2018-09-11 21:41:02
+ type: "tags"
---
```
### 关于页(about)

执行`$ hexo new page about`命令，..创建关于页..
```bash
$ hexo new page about
```
编辑..站点目录..下的`source/about/index.md`
```diff
---
title: about
date: 2018-09-11 20:30:08
---

---

+ <font color=#000000 size=4>这里可以添加介绍文字</font>

---
```
### 相册页(gallery)

执行命令`$ hexo new page gallery`，..创建相册页..
```bash
$ hexo new page gallery
```
编辑..站点目录..下的`source/gallery/index.md`
```diff
---
title: gallery
date: 2019-11-21 21:54:19
+ type: "gallery"
---
```

打开文件`data.json`（Annie/source/plugin/gallerypage/data.json）, 按照json语法在数组[……]中添加gallery的图片数据，请设置合适的`eWidth`、`eHeight`的值。

```
[
{}, 
{
        "thumbnail": "https://img.jpg",    	 		//小图路径
        "enlarged": "https://img.jpg",			 	//大图路径（可与小图一致）
        "title": "百里守约",						//图片标题
        "categories": [{
                "id": 9,							//根据id来进行分类
                "title": "百里玄策",
                "photo_count": 41787,				 //可忽略
                "links": {							//可忽略
                    "self": "https://img.jpg",
                    "photos": "https://img.jpg"
                }
            }
        ],
        "tWidth": 800.6130030959752,				//小图相对宽度
        "tHeight": 500,							   //小图相对高度
        "eWidth": 3630,							   //大图相对宽度
        "eHeight": 2907							   //大图相对高度
    },
    {}
 ]
```
当然，你可以将该文件`data.json`移至其他目录，在<font color=#0099ff face="幼圆">主题配置文件</font>中相应地修改路径`gallery_data`
```diff
# gallery page
# gallery_format: natural | square
gallery_format: natural
# one time to load 4 rows or other count, 0 to load img automatically when scrolling.(0,1,2,3,4,5,6......)
gallery_limit: 0
# data url
+ gallery_data: plugin/gallerypage/data.json
```

## 站内搜索
若此时仍未配置站内搜索，则执行命令，..安装插件..`hexo-generator-search-zip`
```bash
$ npm install hexo-generator-search-zip --save
```
编辑..站点目录..下的`_config.yml`，添加如下语句
```diff
search:
  path: search.json
  zipPath: search.zip
  versionPath: searchVersion.txt
  field: post
  #field: post, page or all（3个可选参数）
```
编辑..主题目录..下的`_config.yml`，添加如下语句
```diff
# Local search
# Dependencies: https://github.com/flashlab/hexo-generator-search
local_search:
    enable: true
    # if auto, trigger search by changing input
    # if manual, trigger search by pressing enter key or search button
    trigger: auto
    # show top n results per article, show all results by setting to -1
    top_n_per_article: 2
```

## 文章页问题
### 相关的文章
文章页将展示与当前文章具有相同分类、相同标签的系列文章。

> 排序规则：分类>标签>时间>不相关文章。

你可以决定是否使用该模块，`posts_limit`为显示的文章篇数，`posts_excerpt`为每篇文章的文字截取数量。

<font color=#0099ff face="幼圆">主题配置文件</font>中：

```
# 04-POST
# post_relate
relate:
    enable: true
    posts_limit: 10
    posts_excerpt: 120
```

> 只有全站博客文章篇数..大于1..且relate.enable..为真..时，该模块有效。

### 阅读量计数
对于`leancloud_count`，你必须设置appid、appkey；<br/>
对于`busuanzi_count`，你只需要开启它即可。

 1. leancloud计数
```diff
# post_count
leancloud_count:
+   enable: true
+   appid: 'dXz'
+    appkey: 'wzG'
    like_post:
        enable: true
+   visit_post:
        enable: true
    topN_post: 
        enable: true #param1 for topN_post
        limit: 10 #param2 for topN_post
busuanzi_count:
    enable: true
```
如果你使用过Valine评论插件，那么leancloud_count的使用十分简单。如果你没有使用过，请参考文章[Hexo博客next主题添加文章阅读量统计功能](https://cuibin1991.github.io/2017/07/31/Hexo%E5%8D%9A%E5%AE%A2next%E4%B8%BB%E9%A2%98%E6%B7%BB%E5%8A%A0%E6%96%87%E7%AB%A0%E9%98%85%E8%AF%BB%E9%87%8F%E7%BB%9F%E8%AE%A1%E5%8A%9F%E8%83%BD/)创建leancloud应用，创建counter类，并获取其appid、appkey，且设置上面的appid、appkey为相应的值，最后开启`visit_post`。

2. 卜蒜子计数
```diff
# post_count
leancloud_count:
    enable: false
    appid: 'dX--'
    appkey: 'dX--'
    like_post:
        enable: true
    visit_post:
        enable: true
    topN_post: 
        enable: true #param1 for topN_post
        limit: 10 #param2 for topN_post

busuanzi_count:
+    enable: true
```
该模块放置于页脚，文章页面只显示文章的阅读量，其他页面只显示总访问量和访客数（等待完善）

### 文章点赞
如果你完成了8.2阅读量计数的leancloud计数的设置，那么只需要开启`like_post`。
```diff
# post_count
leancloud_count:
    enable: false
    appid: 'dX--'
    appkey: 'dX--'
+   like_post:
+       enable: true
    visit_post:
        enable: true
    topN_post: 
        enable: true #param1 for topN_post
        limit: 10 #param2 for topN_post

busuanzi_count:
    enable: true
```

### 文章排行
```diff
# post_count
leancloud_count:
    enable: false
    appid: 'dX--'
    appkey: 'dX--'
    like_post:
       enable: true
    visit_post:
        enable: true
+   topN_post: 
+       enable: true #param1 for topN_post
+       limit: 10 #param2 for topN_post

busuanzi_count:
    enable: true
```
如果你完成了8.2阅读量计数的leancloud计数的设置，那么只需要开启topN_post。（文章阅读排行依赖于8.2阅读量计数）

### 文章目录
若一篇文章的正文存在h1、h2、h3等标题，则文章页展示目录按钮。点击目录按钮，页面左侧展示文章目录。当屏幕宽度小于1024px或页面滚动高度大于文章正文高度时，页面隐藏文章目录。
```
# post_toc
post_toc:
    enable: true
    katelog: true

```

### 数学公式
先设置<font color=#0099ff face="幼圆">主题配置文件</font>的`mathjax`参数，再于文章的Front-matter中添加`mathjax`: true
```diff
# post_mathJax
mathjax:
+  enable: true

```

```diff
title: Annie主题使用说明
date: 2018-08-27 20:16:19
cover: /img/post-cover/74.jpg
+ mathjax: true
categories: HEXO博客
tags: 
	- 说明
	- other tag
```

### 代码块高亮
综合考虑hexo自身的代码高亮插件和hexo-pism-plugin高亮插件的特性及代码块解析规则，2019-04-27日更新后，主题弃用[hexo-prism-plugin](https://github.com/ele828/hexo-prism-plugin)插件，参考&使用了next主题的代码高亮风格。

1. 编辑<font color=#0099ff face="幼圆">主题配置文件</font>，选择并设置`highlight_theme`的值
```diff
# post_code
# highlight_theme: normal | night | night blue | night bright | night eighties
+ highlight_theme: night bright
code_copy:
    enable: true
```

2. 编辑<font color=#ff4444 face="幼圆">站点配置文件</font>，设置`highlight`的值
```diff
# Writing
new_post_name: :title.md # File name of new posts
default_layout: post
titlecase: false # Transform title into titlecase
external_link: true # Open external links in new tab
filename_case: 0
render_drafts: false
post_asset_folder: true
relative_link: false
future: true
+highlight:
+  enable: true
+  line_number: true
  auto_detect: false
  tab_replace:
```

### 代码块复制
只有`theme.code_copy.enable`为真且`config.highlight.enable`为真时，代码块的复制功能才有效
```diff
# post_code
# highlight_theme: normal | night | night blue | night bright | night eighties
highlight_theme: night bright
code_copy:
+    enable: true
```

### 文章评论功能
Hexo-theme-Annie主题集成了gitalk、DesertsP版的valine、livere评论插件。

|序号|评论插件|使用方法|
|:-:|:-:|:-:|
|1|	gitalk|	[正式文档](https://github.com/gitalk/gitalk/blob/master/readme-cn.md)、[Annie主题+Gitalk](https://ztygcs.github.io/posts/annie%E4%B8%BB%E9%A2%98-gitalk%E8%AF%84%E8%AE%BA/)|
|2|valine|正式文档、[加个Valine评论系统](https://blog.xxwhite.com/2017/Valine.html)|
|3|livere|[为Hexo博客添加LiveRe评论系统](https://juejin.im/post/5a632dfcf265da3e484be90c)|


<table><tr><td bgcolor=PowderBlue>注：对于gitalk，你必须设置clientID、clientSecret；对于Valine，你必须设置appid、appkey；对于livere，你必须设置livere_uid。</td></tr></table>

### 文章分享功能
Hexo-theme-Annie主题集成了addThis、baiduShare、shareThis、socialShare分享插件。

|序号|分享插件|使用方法|
|:-:|:-:|:-:|
|1|addThis|登录addThis获取应用的账户id|
|2|baiduShare|直接使用|
|3|shareThis|登录shareThis获取应用的账户id|
|4|socialShare|直接使用|

<table><tr><td bgcolor=PowderBlue>注：使用addThis、shareThis时，应注意关闭浏览器的内容拦截插件。</td></tr></table>

## 站点分析
|序号|分析插件|使用方法|
|:-:|:-:|:-:|
|1|卜算子分析|直接使用|
|2|baidu_analytics|需获取账户id|
|3|cnzz_analytics|需获取账户id|
|4|google_analytics|需获取账户id|
|5|tencent_analytics|需获取账户id|

## 其他的问题
### 社交链接
直接增加相应的社交图标、社交链接即可
```diff
# social
social:
    github:
        url: http://github.com/
        icon: fa fa-github
    weibo:
        url: http://github.com/
        icon: fa fa-weibo    
    pinterest: 
        url: http://github.com/
        icon: fa fa-pinterest
    instagram:
        url: http://github.com/
        icon: fa fa-instagram
    twitter:
        url: http://github.com/
        icon: fa fa-twitter
    rss: 
        url: /atom.xml
        icon: fa fa-rss
+   digg: 
+       url: http://github.com/
+       icon: fa fa-digg

```
### RSS订阅
主题将使用到 `hexo-generator-feed` 插件来生成`atom.xml` 文件。

执行命令安装该插件：
```bash
npm install hexo-generator-feed --save
```
编辑<font color=#ff4444 face="幼圆">站点配置文件</font>，添加相应的参数：
```difff
+feed:
+  type: atom
+  path: atom.xml
+  limit: 20
```
执行 `hexo clean & hexo g `重新生成博客文件，你将在 hexo/public/ 目录下看到 `atom.xml` 文件，说明你已经安装成功了。 （rss的社交链接见于上一节：1. 社交链接）

### 版权声明
对于copyright ，`since`为站点建立年份，`cotent_author`为站点作者。

```
_config.yml
# copyright  
since: 2018
cotent_author: author
```

### 点击页面浮现桃心
```
# when click, emerge heart
love:
    enable: true

# back to top
totop:
    enable: true
```
对于`love`，若设置为true，则点击页面时，会出现随机颜色的桃心💚💛💕。对于`totop`，若设置为true，则启用返回顶部按钮。

## 开发定制问题
### 主题项目结构
```
ANNIE
├─languages					#国际化语言支持
├─layout					#html页面模板
│  └─_partial
│      ├─custom
│      ├─plugin
│      │  ├─clipboard
│      │  ├─comment
│      │  ├─share
│      │  └─statistics
│      ├─post
│      └─widget
├─scripts					#站点脚本
└─source					#主题资源
    ├─css
    │  └─_highlight
    ├─img
    │  ├─post-cover
    │  ├─quote
    │  └─random
    ├─js
    └─plugin
        ├─chinese
        ├─clipboard
        ├─comment
        ├─fancybox
        ├─gallerypage
        │  └─images
        ├─imgLazyLoader
        ├─imgResize
        ├─love
        ├─motto
        ├─nicescroll
        ├─search
        ├─toc
        └─vibrant
```
Annie主题基于hexo 3.8.0、ejs、styl开发而成。一般来说，如果你想修改页面的html结构，请到layout目录下添加或修改相应的ejs文件； 如果你想修改页面元素的css样式，请到source/css目录下添加或修改相应的styl文件；如果你想添加一些js代码，原则上，自定义代码片段应添加于source/js/main.js文件中，引入的js文件应放置于source/plugin目录下

### 主题字体问题
主题整体字体大小，修改html标签的`font-size`属性
```diff
html {
-   font-size: 16px;
+   font-size: 14px;
}
```
主题整体字体族，修改body标签的`font-family`属性
```diff
body {
-   font-family: Ovo, Georgia, STZhongsong, "Microsoft YaHei", serif;
+   font-family: "PingFang SC", "Microsoft YaHei";
}
```
文章详情页字体族，修改#layout-post类的`font-family`属性
```diff
#layout-post {
+   font-family: "Source Sans Pro", "Segoe UI";
}
```
你可以检索style文件，查询相应的标签或类，进而设置相应元素的属性。

### 页头菜单颜色
页头菜单颜色会根据背景的主题色变化非黑即白。亦即主题色为浅色时，字体为黑；主题色为深色时，字体为白。你可以参考main.js中函数`Annie_ColorExtraction(img)`。

