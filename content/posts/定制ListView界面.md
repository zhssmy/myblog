---
title: "定制ListView界面"
date: 2018-09-29T19:28:19+08:00
tags: [Android,  ListView]
categories: [TECH,安卓]
draft: false
dropCap: false
toc: true
---

## 作用
当手机屏幕空间有限而不能一次将内容显示完时，需要借助ListView允许用户通过手指上下滑动的方式将屏幕外的数据滚动到屏幕内，同时屏幕上原有的数据滚动出屏幕。例如查看QQ消息等。

## 用法
### 新建项目
新建一个`ListView`项目，修改`activity_main.xml`中的代码：
```xml
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
  android:layout_width="match_parent"
  android:layout_height="match_parent">
  <ListView 
  android:id="@+id/list_view"
    android:layout_width="match_parent"
    android:layout_height="match_parent"/>	
</LinearLayout>
```
`activity_main.xml`布局中加入`ListView`控件，并指定控件的`id`为list_view，`width`和`height`与父布局相同，即布满手机屏幕

### 新建实体类
定义一个水果实体类`Fruit`，作为ListView适配器的的适配类型
```java
public class Fruit {
    private String name;
    private int imageId;

    public Fruit(String name,int imageId){
        this.name=name;
        this.imageId=imageId;    }

    public String getName(){
        return name;    }

    public int getImageId(){
        return imageId;    }
}
```
该类中定义了水果类的名称的图片id


### 指定item布局
为ListView的子项指定一个自定义的布局，在layout目录下新建`fruit_item.xml`
```xml
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:orientation="vertical" android:layout_width="match_parent"
    android:layout_height="wrap_content">

    <ImageView
        android:id="@+id/fruit_image"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content" />

    <TextView
        android:id="@+id/fruit_name"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_gravity="center_vertical"
        android:layout_marginLeft="10dp"/>

</LinearLayout>
```
这个布局定义了一个`ImageView`用于显示水果图片，一个`TextView`用于显示水果名称，并让`TextView`垂直居中显示

### 自定适配器
接下来创建一个自定义的适配器`FruitAdapter`（继承自ArrayAdapter），泛型指定为`Fruit`类
```java
public class FruitAdapter extends ArrayAdapter<Fruit> {
    private int resourceId;
    public FruitAdapter(Context context, int textViewResourceId, List<Fruit> objects){
        super(context,textViewResourceId,objects);
        resourceId=textViewResourceId;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent){
        Fruit fruit=getItem(position);//获得当前项的Fruit实例
        View view= LayoutInflater.from(getContext()).inflate(resourceId,parent,false);
        ImageView fruitImage=(ImageView) view.findViewById(R.id.fruit_image);
        TextView fruitname=(TextView) view.findViewById(R.id.fruit_name);
        fruitImage.setImageResource(fruit.getImageId());
        fruitname.setText(fruit.getName());
        return view;
    }
}
```
`FruitAdapter`重写父类的一组构造函数，用于将`上下文`，`ListView子项布局id`，和`水果数据`传递进来，另外重写`getview()`方法，这个方法在每个子项被滚到屏幕内时会被调用。通过`getItem()`得到当前项Fruit实例，然后使用`LayoutInflater`为子项加载我们传入的布局。

### 修改MainActivity
最后修改MainActivity
```java
package com.example.listviewtest;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity {

    private List<Fruit> fruitList=new ArrayList<>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        initFruits();
        FruitAdapter adapter=new FruitAdapter(MainActivity.this,R.layout.fruit_item,fruitList);
        ListView listView=(ListView)findViewById(R.id.list_view);
        listView.setAdapter(adapter );
    }

    private void initFruits(){
        for (int i=0;i<2;i++){
            Fruit apple=new Fruit("Apple",R.drawable.apple_pic);
            fruitList.add(apple);
            Fruit banana=new Fruit("Banana",R.drawable.banana_pic);
            fruitList.add(banana);
            Fruit orange=new Fruit("Orange",R.drawable.orange_pic);
            fruitList.add(orange);
            Fruit watermelon=new Fruit("Watermelon",R.drawable.watermelon_pic);
            fruitList.add(watermelon);
            Fruit pear=new Fruit("Pear",R.drawable.pear_pic);
            fruitList.add(pear);
            Fruit grape=new Fruit("Grape",R.drawable.grape_pic);
            fruitList.add(grape);
            Fruit pineapple=new Fruit("Pineapple",R.drawable.pineapple_pic);
            fruitList.add(pineapple);
            Fruit strawberry=new Fruit("Strawberry",R.drawable.strawberry_pic);
            fruitList.add(strawberry);
            Fruit cherry=new Fruit("Cherry",R.drawable.cherry_pic);
            fruitList.add(cherry);
            Fruit mango=new Fruit("Mango",R.drawable.mango_pic);
            fruitList.add(mango);
        }
    }
}
```
这里的`initFruits()`方法用来初始化水果数据，然后在onCreate()方法中创建`FruitAdapter`对象，并将FruitAdapter作为适配器传递给`ListView`

## 运行结果
![](https://upload-images.jianshu.io/upload_images/1674835-7650cc72e9f6f7bb.gif?imageMogr2/auto-orient/strip)
