MapKit(iOS自带地图)

iOS5之前使用的是google地图

iOS5之后使用的是高德地图(高德地图)

高德内核,原生地图确实太差.

第三方地图:百度地图,高德地图,老虎地图,导航狗地图

使用地图分为两部分:1.定位. 2.地图


 模拟器无法实现真实定位
 
 

打包

~~~objectivec

/地图/BaiduMap_IOSSDK_v2.6.0_All/BaiduMap_IOSSDK_v2.6.0_Lib

-create Release-iphoneos/libbaidumapapi.a Release-iphonesimulator/libbaidumapapi.a  -output libbaidumapapi.a
~~~