---
title: "Android Dialog"
date: 2018-10-28T20:40:52+08:00
tags: [Android, Dialog]
categories: [TECH,安卓]
draft: false
dropCap: false
---

原文链接：[https://blog.csdn.net/REIGE/article/details/69214773?utm_source=blogxgwz2](https://blog.csdn.net/REIGE/article/details/69214773?utm_source=blogxgwz2)

github地址：[https://github.com/REIGE/DialogDemo](https://github.com/REIGE/DialogDemo)

# 效果图
![](https://img-blog.csdn.net/20170404214217213?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvUkVJR0U=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)


# 普通Dialog
```java
private void showNormalDialog() {
  final AlertDialog.Builder builder = new AlertDialog.Builder(MainActivity.this);
  builder.setIcon(R.mipmap.ic_launcher)
    .setTitle("普通Dialog")
    .setMessage("这是一个普通的Dialog")
    .setPositiveButton("确定", new DialogInterface.OnClickListener() {
       @Override
       public void onClick(DialogInterface dialogInterface, int i) {}
    })
    .setNegativeButton("取消", new DialogInterface.OnClickListener() {
       @Override
       public void onClick(DialogInterface dialogInterface, int i) {}
    })
    .show();
    //添加中间按钮 就有三个按钮
    //normalDialog.setNeutralButton
    }
```

# 列表Dialog
```java
private void showListDialog() {
  final String[] items = {"按钮1", "按钮2", "按钮3", "按钮4"};
  AlertDialog.Builder builder = new AlertDialog.Builder(MainActivity.this);
  builder.setTitle("列表Dialog")
    .setItems(items, new DialogInterface.OnClickListener() {
    @Override
    public void onClick(DialogInterface dialogInterface, int i) {}
    })
    .show();
    }
```

# 单选Dialog
```java
private void showSingleChoiceDialog() {
    final String[] items = {"按钮1", "按钮2", "按钮3", "按钮4"};
    final AlertDialog.Builder builder =
            new AlertDialog.Builder(MainActivity.this);
    builder.setTitle("单选Dialog")
        .setSingleChoiceItems(items, 0, new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialogInterface, int i) {

            }
        })
        .setPositiveButton("确定", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialogInterface, int i) {

            }
        })
        .show();
}
```

# 多选Dialog
```java
final ArrayList<Integer> choices = new ArrayList<>();

private void showMultiChoiceDialog() {

    final String[] items = {"按钮1", "按钮2", "按钮3", "按钮4"};
    // 设置默认选中的选项
    final boolean initChoiceSets[] = {false, false, false, false};
    //choices.clear();
    AlertDialog.Builder builder =
            new AlertDialog.Builder(MainActivity.this);
    builder.setTitle("多选Dialog")
       .setMultiChoiceItems(items, initChoiceSets, new DialogInterface
               .OnMultiChoiceClickListener() {
           @Override
      public void onClick(DialogInterface dialog, int which, boolean isChecked) {
          if (isChecked) {
              choices.add(which);
          } else {
              //有问题：是把whichButton作为index还是Object？实际上会抛下标溢出异常
              //MultiChoiceID.remove(whichButton);
              //需强制转换为Object类型，才会以对象的形式删除；否则会作为下标处理
              choices.remove((Integer) which);
          }
      }
      })
       .setPositiveButton("确定", new DialogInterface.OnClickListener() {
           @Override
           public void onClick(DialogInterface dialogInterface, int i) {

           }
       })
       .show();
}
```

# 等待Dialog
```java
private void showWaitingDialog() {
    final ProgressDialog progressDialog = new ProgressDialog(MainActivity.this);
    progressDialog.setTitle("等待Dialog");
    progressDialog.setMessage("等待中...");
    progressDialog.setIndeterminate(true);
    progressDialog.setCancelable(false);
    progressDialog.show();
    new Thread() {
        @Override
        public void run() {
          super.run();
          SystemClock.sleep(3000);
          progressDialog.dismiss();
        }
    }.start();
}
```

# 进度条Dialog
```java
private void showProgressDialog() {
    final int MAX_PROGRESS = 100;
    final ProgressDialog progressDialog =new ProgressDialog(MainActivity.this);
    progressDialog.setCancelable(false);
    progressDialog.setProgress(0);
    progressDialog.setTitle("进度条Dialog");
    progressDialog.setProgressStyle(ProgressDialog.STYLE_HORIZONTAL);
    progressDialog.setMax(MAX_PROGRESS);
    progressDialog.show();
    new Thread(new Runnable() {
       @Override
       public void run() {
          int progress = 0;
          while (progress < MAX_PROGRESS) {
             try {
                Thread.sleep(10);
                progress++;
                //子线程可以更新progressDialog进度
                progressDialog.setProgress(progress);
             } catch (InterruptedException e) {
                 e.printStackTrace();
             }
          }
          progressDialog.cancel();
       }
    }).start();
}
```

# 编辑Dialog
```java
private void showEditDialog() {
    AlertDialog.Builder builder = new AlertDialog.Builder(MainActivity.this);
    final EditText view = new EditText(MainActivity.this);
    builder.setTitle("输入dialog")
       .setView(view)
       .setPositiveButton("确定", new DialogInterface.OnClickListener() {
           @Override
           public void onClick(DialogInterface dialogInterface, int i) {
               String content = view.getText().toString();
           }
       })
       .show();
}
```

# 自定义带动画的Dialog
```java
private void showConsumerDialog() {
    Dialog dialog = new Dialog(MainActivity.this, R.style.BottomDialog);
    View view = LayoutInflater.from(this).inflate(R.layout.dialog, null);
    dialog.setContentView(view);
    ViewGroup.LayoutParams layoutParams = view.getLayoutParams();
    layoutParams.width = getResources().getDisplayMetrics().widthPixels;
    view.setLayoutParams(layoutParams);
    dialog.getWindow().setGravity(Gravity.BOTTOM);
    dialog.getWindow().setWindowAnimations(R.style.BottomDialog_Animation);
    dialog.setCanceledOnTouchOutside(true);
    dialog.show();
}
```
# 自定义带动画的圆角Dialog
```java
private void showConsumerDialogCircle() {
   final Dialog dialog = new Dialog(MainActivity.this, R.style.BottomDialog);
   View view = LayoutInflater.from(this).inflate(R.layout.dialog_circle, null);

   view.findViewById(R.id.takePhoto).setOnClickListener(new View.OnClickListener() {
       @Override
       public void onClick(View view) {
           dialog.dismiss();
       }
   });

   view.findViewById(R.id.selectPhoto).setOnClickListener(new View.OnClickListener() {
       @Override
       public void onClick(View view) {
           dialog.dismiss();
       }
   });
   dialog.setContentView(view);
   ViewGroup.MarginLayoutParams layoutParams = (ViewGroup.MarginLayoutParams) view
           .getLayoutParams();
   layoutParams.bottomMargin = (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, 8,
           getResources().getDisplayMetrics());
   layoutParams.width = getResources().getDisplayMetrics().widthPixels - (int) TypedValue
           .applyDimension(TypedValue.COMPLEX_UNIT_DIP, 16,
                   getResources().getDisplayMetrics());
   view.setLayoutParams(layoutParams);
   dialog.getWindow().setGravity(Gravity.BOTTOM);
   dialog.getWindow().setWindowAnimations(R.style.BottomDialog_Animation);
   dialog.setCanceledOnTouchOutside(true);
   dialog.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
   dialog.show();
    }
```

## 自定义dialog布局文件 dialog_circle.xml
```xml
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
  android:orientation="vertical"
  android:layout_width="match_parent"
  android:background="@drawable/shape_dialog"
  android:layout_height="wrap_content">
<TextView
  android:id="@+id/takePhoto"
  android:layout_width="match_parent"
  android:layout_height="wrap_content"
  android:background="?android:attr/selectableItemBackground"
  android:clickable="true"
  android:padding="16dp"
  android:textSize="14sp"
  android:text="拍照"/>
<TextView
  android:layout_width="match_parent"
  android:id="@+id/selectPhoto"
  android:layout_height="wrap_content"
  android:background="?android:attr/selectableItemBackground"
  android:clickable="true"
  android:padding="16dp"
  android:textSize="14sp"
  android:text="从相册选取"/>
</LinearLayout>
```

dialog_circle.xml
```xml
<?xml version="1.0" encoding="utf-8"?>
<shape xmlns:android="http://schemas.android.com/apk/res/android"
       android:shape="rectangle">

<corners android:radius="8dp"/>
<solid android:color="@android:color/white"/>
</shape>
```

style
```xml
<style name="BottomDialog" parent="@style/Base.V7.Theme.AppCompat.Light.Dialog">
  <item name="android:windowNoTitle">true</item>
  <item name="android:windowBackground">@android:color/transparent</item>
</style>
<style name="BottomDialog.Animation" parent="Animation.AppCompat.Dialog">
   <item name="android:windowEnterAnimation">@anim/translate_dialog_in</item>
   <item name="android:windowExitAnimation">@anim/translate_dialog_out</item>
</style>
```

Enter Exit 动画
```xml
<!--translate_dialog_in.xml-->
<?xml version="1.0" encoding="utf-8"?>
<translate xmlns:android="http://schemas.android.com/apk/res/android"
  android:duration="300"
  android:fromXDelta="0"
  android:fromYDelta="100%"
  android:toXDelta="0"
  android:toYDelta="0">
</translate>

<!--translate_dialog_out.xml-->
<?xml version="1.0" encoding="utf-8"?>
<translate xmlns:android="http://schemas.android.com/apk/res/android"
  android:duration="300"
  android:fromXDelta="0"
  android:fromYDelta="0"
  android:toXDelta="0"
  android:toYDelta="100%">
</translate>
```
