---
title: "安卓开发之IP定位的实现"
date: 2020-06-19T13:46:31+08:00
draft: false
tags: [Android,IP定位]
categories: [TECH,安卓]
#目录是否开启
toc: true
#首字是否下沉
dropCap: false
#是否显示更新时间
badge: false
tocNum: false
---

## 1. 百度地图API SDK之Web服务API
### 1.1 服务介绍
#### 1.1.1 普通IP定位
普通IP定位[^1]是一套以HTTP/HTTPS形式提供的轻量级定位接口，用户可以通过该服务，根据IP定位来获取大致位置。
{{<notice notice-note>}}
目前该服务同时支持 IPv4 和 IPv6 来获取位置信息。
{{</notice>}}

#### 1.1.2 功能介绍
利用IP获取大致位置，调用API接口，返回请求参数中指定上网IP的大致位置信息（一般为城市级别），位置信息包括：经纬度、省、市等地址信息。
{{<notice notice-note>}}
普通IP定位服务目前不支持海外场景。
{{</notice>}}

如果请求参数中未指定上网IP，则默认返回当前服务请求来源的IP所对应的大致位置信息。
{{<notice notice-note>}}
该服务所返回的经纬度信息只是一个大概的位置，一般为城市中心点。
{{</notice>}}


#### 1.1.3 适用场景
适用于对定位精度要求不高的IP请求定位的应用。

如果您的应用为Android Native App，建议使用[Android定位SDK](http://lbsyun.baidu.com/index.php?title=android-locsdk)，定位效果最佳，精度可达到10m，且无任何使用配额及并发量的限制。

### 1.2 服务文档
#### 1.2.1 请求URL

- `HTTP协议`：http://api.map.baidu.com/location/ip?ak=您的AK&ip=您的IP&coor=bd09ll

- `HTTPS协议`：https://api.map.baidu.com/location/ip?ak=您的AK&ip=您的IP&coor=bd09ll

#### 1.2.2 请求参数
|参数名称|参数含义|类型|备注|
|:-:|:-:|:-:|:-:|
|ip|用户上网的IP地址，请求中如果不出现或为空，会针对发来请求的IP进行定位。如您需要通过IPv6来获取位置信息，请提交工单申请。|string|可选|
|ak|开发者密钥，可在API控制台申请获得|string|必填|
|sn|若用户所用AK的校验方式为SN校验时该参数必填（什么是SN校验？）。其他AK校验方式的可不填写|string|可选|
|coor|设置返回位置信息中，经纬度的坐标类型，分别如下：<br>coor不出现、或为空：百度墨卡托坐标，即百度米制坐标<br>coor = bd09ll：百度经纬度坐标，在国测局坐标基础上二次加密而来<br>coor = gcj02：国测局02坐标，在原始GPS坐标基础上，按照国家测绘行业统一要求，加密后的坐标<br>|string|可选|

{{<notice notice-warning>}}百度地图的坐标类型为bd09ll，如果结合百度地图使用，请注意坐标选择{{</notice>}}

#### 1.2.3 返回结果（JSON格式）

<table border="1" style={{margin:200}}>
<tbody>
<tr><th colspan="3">结果字段</th><th>字段含义</th><th>类型</th></tr> 
<tr><th colspan="3">address</th><th>详细地址信息</th><th rowspan="8">string</th></tr> 
<tr><th rowspan="6">content</th><th colspan="2">address</th><th>简要地址信息</th></tr>
<tr><th rowspan="3">address_detail</th><th>city</th><th>城市</th></tr>
<tr><th>city_code</th><th>百度城市代码</th></tr>
<tr><th>province</th><th>省份</th></tr>
<tr><th rowspan="2">point</th><th>x</th><th>当前城市中心点经度</th></tr>
<tr><th>y</th><th>当前城市中心点纬度</th></tr>
<tr><th colspan="3">status</th><th>结果状态返回码，请参考后面的介绍</th></tr> 
</tbody>
</table>

#### 1.2.4 返回结果示例

```json
{  
    address: "CN|北京|北京|None|CHINANET|1|None",    #详细地址信息  
    content:    #结构信息  
    {  
        address: "北京市",    #简要地址信息  
        address_detail:    #结构化地址信息  
        {  
            city: "北京市",    #城市  
            city_code: 131,    #百度城市代码  
            province: "北京市",    #省份      
        },  
        point:    #当前城市中心点  
        {  
            x: "116.39564504",    #当前城市中心点经度
            y: "39.92998578"    #当前城市中心点纬度
        }  
    },  
    status: 0    #结果状态返回码  
}
```
#### 1.2.5 接口错误码
|状态码|定义|注释|
|:-:|:-:|:-:|
|0|正常||
|1|服务器内部错误|该服务响应超时或系统内部错误|
|10|上传内容超过8M|Post上传数据不能超过8M|
|101|AK参数不存在|请求消息没有携带AK参数|
|102|Mcode参数不存在，mobile类型mcode参数必需|对于Mobile类型的应用请求需要携带mcode参数，该错误码代表服务器没有解析到mcode|
|200|APP不存在，AK有误请检查再重试|根据请求的AK，找不到对应的APP|
|201|APP被用户自己禁用，请在控制台解禁||
|202|APP被管理员删除|恶意APP被管理员删除|
|203|APP类型错误|当前API控制台支持Server(类型1), Mobile(类型2, 新版控制台区分为Mobile_Android(类型21)及Mobile_IPhone（类型22）及Browser（类型3），除此之外的其他类型被认为是APP类型错误|
|210|APP IP校验失败|在申请Server类型应用的时候选择IP校验，需要填写IP白名单，如果当前请求的IP地址不在IP白名单或者不是0.0.0.0/0就认为IP校验失败|
|211|APP SN校验失败|SERVER类型APP有两种校验方式：IP校验和SN校验，当用户请求的SN和服务端计算出来的SN不相等的时候，提示SN校验失败|
|220|APP Referer校验失败|浏览器类型的APP会校验referer字段是否存在，且在referer白名单里面，否则返回该错误码|
|230|APP Mcode码校验失败|服务器能解析到mcode，但和数据库中不一致，请携带正确的mcode|
|240|APP 服务被禁用|用户在API控制台中创建或设置某APP的时候禁用了某项服务|
|250|用户不存在|根据请求的user_id, 数据库中找不到该用户的信息，请携带正确的user_id|
|251|用户被自己删除|该用户处于未激活状态|
|252|用户被管理员删除|恶意用户被加入黑名单|
|260|服务不存在|服务器解析不到用户请求的服务名称|
|261|服务被禁用|该服务已下线|
|301|永久配额超限，限制访问|配额超限|
|302|天配额超限，限制访问|配额超限|
|401|当前并发量已经超过约定并发配额，限制访问|并发控制超限，请控制并发量|
|402|当前并发量已经超过约定并发配额，并且服务总并发量也已经超过设定的总并发配额，限制访问|并发控制超限，请控制并发量|
|1001|没有IPv6地址访问的权限|如需通过IPv6来获取位置信息，请提交工单申请|

## 2. 移动端实现
### 2.1 通过ip获取经纬度

```java
 private Thread located_dataget = new Thread() {
    @Override
    public void run() {
        link = "https://api.map.baidu.com/location/ip?ak=自己的ak&ip="+dev_ip+"&coor=bd09ll";
        located_result = GData.requestGet(link);
        handler_located.postDelayed(located_datashow,1000);
    }
};

private Runnable located_datashow = new Runnable() {
    @Override
    public void run() {
        if(located_result!=null){
           //解析返回的json数据
        }
    }
};

private Runnable start = new Runnable() {
    @Override
    public void run() {
        located_dataget.start();
    }
};
```

#### 2.1.1 浏览器直接访问返回结果示例

![](https://zccon.oss-cn-beijing.aliyuncs.com/Hugo/images/tech/2020/06/ip_located.png "浏览器访问返回结果")

#### 2.1.2 json解析获取经纬度
```java
try{        
    JSONObject jsonObject1 = new JSONObject(located_result);
    String data1 = jsonObject1.getString("content");
    JSONObject jsonObject2 = new JSONObject(data1);
    String data2 = jsonObject2.getString("point");
    JSONObject jsonObject3 = new JSONObject(data2);
    latitude = jsonObject3.getString("y");
    longitude = jsonObject3.getString("x");
    }catch (Exception e){
        e.printStackTrace();
    }
```

### 2.2 通过经纬度返回详细位置
参考百度地图开发之全球逆地理编码[^2]
- http://api.map.baidu.com/reverse_geocoding/v3/?ak=your's ak&output=json&coordtype=wgs84ll&location=31.225696563611,121.49884033194

![](https://zccon.oss-cn-beijing.aliyuncs.com/Hugo/images/tech/2020/06/located.png "浏览器访问返回结果")

### 2.3 将详细位置在百度地图中显示

```java
public class Device_location_ip extends AppCompatActivity {

    private boolean isFirstLocate=true;

    private MapView mapView;

    private BaiduMap baiduMap;

    String link,result;

    private Handler handler = new Handler();

    private String latitude,longitude;

    @Override
    protected void onCreate(Bundle savedInstanceState){
        super.onCreate(savedInstanceState);

        //隐藏手机顶部状态栏
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
                WindowManager.LayoutParams.FLAG_FULLSCREEN);

        SDKInitializer.initialize(getApplicationContext());

        setContentView(R.layout.device_location_ip);

        Intent intent = getIntent();
        latitude = intent.getStringExtra("latitude");
        longitude = intent.getStringExtra("longitude");

        //获取控件MapView,先显示百度地图
        mapView = (MapView) findViewById(R.id.mapview);
        baiduMap = mapView.getMap();

        //允许在地图上显示我的位置
        baiduMap.setMyLocationEnabled(true);

        navigateTo(Double.parseDouble(latitude),Double.parseDouble(longitude));

        handler.post(start);、
    }

    //对传入的经纬度参数进行处理，并在地图上显示出来
    private void navigateTo(double laititude,double longitude) {
        if (isFirstLocate) {
            //Toast.makeText(this, "nav to " + location.getAddrStr(), Toast.LENGTH_SHORT).show();
            LatLng ll = new LatLng(laititude, longitude);
            MapStatusUpdate update = MapStatusUpdateFactory.newLatLng(ll);
            baiduMap.animateMapStatus(update);
            update = MapStatusUpdateFactory.zoomTo(16f);
            baiduMap.animateMapStatus(update);
            isFirstLocate = false;
        }

        //在地图上显示我的位置
        MyLocationData.Builder locationBuilder = new MyLocationData.Builder();
        locationBuilder.latitude(laititude);
        locationBuilder.longitude(longitude);
        MyLocationData locationData = locationBuilder.build();
        baiduMap.setMyLocationData(locationData);
    }

    @Override
    protected void onResume() {
        super.onResume();
        mapView.onResume();
    }

    @Override
    protected void onPause() {
        super.onPause();
        mapView.onPause();
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        mapView.onDestroy();
        baiduMap.setMyLocationEnabled(false);
    }

    private Thread dataget = new Thread() {

        @Override
        public void run() {
            link = "http://api.map.baidu.com/reverse_geocoding/v3/?ak=your's ak&output=json&coordtype=wgs84ll&location=latitude,longitude";
            result = GData.requestGet(link);
            handler.postDelayed(datashow,1000);
        }
    };

    private Runnable datashow = new Runnable() {
        @Override
        public void run() {

            if(result!=null){
                Log.d("link",link);
                Log.d("result:", result);
                try{
                    JSONObject jsonObject1 = new JSONObject(result);
                    String data1 = jsonObject1.getString("result");
                    JSONObject jsonObject2 = new JSONObject(data1);
                }catch (Exception e){
                    e.printStackTrace();
                }

            }
        }
    };
    private Runnable start = new Runnable() {
        @Override
        public void run() {
            dataget.start();
        }
    };
}
```

![](https://zccon.oss-cn-beijing.aliyuncs.com/zhssmy/images/2021/baidu_located.png "效果")


[^1]:[百度地图开放平台-普通IP定位](http://lbsyun.baidu.com/index.php?title=webapi/ip-api)
[^2]:[百度地图开放平台-全球逆地理编码](http://lbsyun.baidu.com/index.php?title=webapi/guide/webservice-geocoding-abroad)