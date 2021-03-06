---
title: "水滴按钮效果（前端）"
date: 2019-12-05T21:24:34+08:00
draft: false
tags: [HTML,CSS]  
categories: [TECH,前端]
toc: true
dropCap: false
badge: false
---

[Tweenlite](http://www.greensock.com/tweenlite/)，是webgame开发人员比较常用的一个缓动库。

可以去[https://www.tweenmax.com.cn/start/](https://www.tweenmax.com.cn/start/)下载<span class="filenamestyle">TweenMax.min.js</span>文件并引入

## TweenMax使用方法
### 载入TweenMax.js插件
首先下载TweenMax文件包(greensock-js)，找到<span class="filenamestyle">TweenMax.min.js</span>压缩文件。<br/>
> 文件位置： `greensock-js/src/minified/TweenMax.min.js`<br/>

或者使用TweenMax的CDN。

- [<font class = "colorfulfont"><i><b>下载TweenMax</b></i></font>](https://www.tweenmax.com.cn/source/)

- [<font class = "colorfulfont"><i><b>TweenMax CDN</b></i></font>](https://www.tweenmax.com.cn/cdn/)


在页面中载入<span class="filenamestyle">TweenMax.min.js</span>文件
```html
<script src="js/TweenMax.min.js"> </script>
```
由于TweenMax.min.js集合了所有功能，所以引入TweenMax.js这一个文件即可使用TweenMax的所有功能。
如果要争取更小的库文件大小,可以使用TweenLite.js(8K)并自由组合其他插件
```html
<!-- 只能用TweenLite -->
<script src="js/TweenLite.min.js"> </script>
<script src="js/plugins/CSSPlugin.min.js"> </script>
<script src="js/easing/EasePack.min.js"> </script>
```
### 准备好要执行TweenMax动画的元素
先创建需要进行TweenMax动画的元素
```html
<div id="obj">box1</div>
```
TweenMax不仅仅可以对html元素进行动画，还可以补间任何Javascript物件的任何数字属性

### 给该元素设置TweenMax动画
```html
<script> 
  TweenMax.to("#obj", 0.5, {left:200});
</script>
```
TweenMax的第一个参数是你想进行动画的目标，第二是动画持续时间(默认是秒)，最后是要被动画的一个或多个属性。
![](/images/tech/2019/12/tweenmax-started-01.png "设置动画")

上面例子的作用是，为一个id为"obj"的元素设置动画，在0.5秒的过程中使其移动到left:200px位置处。
由于这是一个to()方法，所以不论开始时是多少，left属性都会变为200。

EXAMPLE:
```html
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <title>title</title>
  <style>
    #obj{
      position:relative;
      width:50px;
      line-height:50px;
      background:#23ac0e;
      border-radius:5px;
      color:#fff;
      text-align:center;
    }
  </style>
</head>

<body>
  <div id="obj">box1</div>
</body>

<script src="TweenMax.min.js"></script>
<script >
  TweenMax.to("#obj", 0.5, {left:200});
</script>
</html>
```
left和top属性动画需要position:reletive的支持且为固定值，因此有时候使用x或y代替(使用的是CSS3的translate属性动画)更为简便
```js
TweenMax.to("#obj", 0.5, {x:200});//在原有位置向右移动200px
```
如果你想同时增加其宽度属性"width"为200时，可以这样做：
```js
TweenMax.to("#obj", 0.5, {x:200, width:200});
```


## 水滴效果完整代码
```html

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style>
        body,
        html {
            height: 100%;
        }

        body {
            margin: 0;
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .btn {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            background: #208cf1;
            filter: url("#shadowed-goo");
            position: relative;
            cursor: pointer;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .ball {
            display: inline-block;
            width: 100%;
            height: 100%;
            background: #208cf1;
            border-radius: 50%;
            position: absolute;
            left: 0;
            top: 0;
            opacity: 1;
        }

        .text {
            position: relative;
            z-index: 5;
            color: white;
            font-weight: bold;
        }
    </style>
</head>

<body>
    <div class="btn">
        <span class="ball"></span>
        <span class="ball"></span>
        <span class="ball"></span>
        <span class="text">HOVER</span>
    </div>
    <svg style="width: 0; height: 0;">
        <defs>
            <filter id="shadowed-goo">
                <feGaussianBlur in="SourceGraphic" result="blur" stdDeviation="10" />
                <feColorMatrix in="blur" mode="matrix" values="1 0 0 0 0  0 1 0 0 0  0 0 1 0 0  0 0 0 18 -7"
                    result="goo" />
                <feGaussianBlur in="goo" stdDeviation="3" result="shadow" />
                <feColorMatrix in="shadow" mode="matrix" values="0 0 0 0 0  0 0 0 0 0  0 0 0 0 0  0 0 0 1 -0.2"
                    result="shadow" />
                <feOffset in="shadow" dx="1" dy="1" result="shadow" />
                <feBlend in2="shadow" in="goo" result="goo" />
                <feBlend in2="goo" in="SourceGraphic" result="mix" />
            </filter>
        </defs>
    </svg>
</body>
<script src="TweenMax.min.js"></script>
<script>
    function initBt4() {
        var bt = document.querySelector('.btn')
        var blob = document.querySelectorAll('.ball');
        var filter = document.querySelector('#shadowed-goo');
        bt.addEventListener("mousemove", function (e) {
            var x = (e.pageX - bt.offsetLeft - bt.offsetWidth / 2) * 0.3;
            var y = (e.pageY - bt.offsetTop - bt.offsetHeight / 2) * 0.3;
            TweenLite.to(blob[0], 4.2, { x: x, y: y, ease: Elastic.easeOut.config(1, 0.1) });
            TweenLite.to(blob[1], 2.8, { x: x, y: -y, ease: Elastic.easeOut.config(1, 0.1) });
            TweenLite.to(blob[2], 2.8, { x: -x, y: -y, ease: Elastic.easeOut.config(1, 0.1) });
        })
    }
    initBt4()
</script>

</html>

```

![](/images/tech/2019/12/水滴效果.gif "效果")
