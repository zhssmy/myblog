---
title: "NavigationView头部监听"
date: 2019-01-25T19:53:20+08:00
tags: [Android, NavigationView] 
categories: [TECH,安卓]
draft: false
dropCap: false
---

# 一、删除xml文件中的静态引用

找到`<NavigationView>`控件，将控件里的..静态引用..删除
```xml
<android.support.design.widget.NavigationView
	app:theme="@style/myNavigationDrawerStyle"
	android:id="@+id/nav_view"
	android:layout_width="280dp"
	android:layout_height="match_parent"
	android:layout_gravity="start"
	app:headerLayout="@layout/nav_header"
	app:menu="@menu/nav_menu"/>
```
```diff
- app:headerLayout="@layout/nav_header"
- app:menu="@menu/nav_menu"
```

# 二、绑定控件
在**MainActivity**的`onCreate()`函数中..绑定控件..`<NavigationView>`
```diff
+ NavigationView navView = (NavigationView) findViewById(R.id.nav_view);
```

# 三、引入Header和Menu
```diff
NavigationView navView = (NavigationView) findViewById(R.id.nav_view);

//引入header和menu
+ navView.inflateHeaderView(R.layout.nav_header);
+ navView.inflateMenu(R.menu.nav_menu);
```
# 四、设置监听事件
```diff
NavigationView navView = (NavigationView) findViewById(R.id.nav_view);

//引入header和menu
navView.inflateHeaderView(R.layout.nav_header);
navView.inflateMenu(R.menu.nav_menu);

+ View navHeaderView =navView.getHeaderView(0);
+ CircleImageView circleimageview = (CircleImageView)navHeaderView.findViewById(R.id.icon_image);
+ circleimageview.setOnClickListener(new View.OnClickListener(){
+ 	@Override
+ 	public void onClick(View view){
+ 	//用户头像点击事件
+ 	Toast.makeText(MainActivity.this,"你点击了用户头像",Toast.LENGTH_SHORT).show();
+ 	}
+ });
```
# 五、效果
![](/images/tech/2019/01/25/03.png "效果")

---
[参考网址](https://www.cnblogs.com/liushengchieh/p/7628819.html)