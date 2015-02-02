获取当前Application的类的属性

`roadofios/advancedUI/0128_week13_day3/xCarDemo/xCarDemo/RootViewController.m`



~~~objectivec
 //获取当前Application的类的属性===>得到当前AppDelegate类对象
    _isDownload = ((ZXAppDelegate *) [UIApplication sharedApplication].delegate).isDownload;
    
~~~


应用内启动其他程序:

~~~objectivec
[ [UIApplication sharedApplication] openURL:[NSURL URLWithstring:@"email://12345"]];
[ [UIApplication sharedApplication] openURL:[NSURL URLWithstring:@"tel://12345"]];
~~~


打开地图,邮件,电话,短信

~~~objectivec
1.Map    http://maps.google.com/maps?q=Shanghai  
2.Email  mailto://myname@google.com  
3.Tel    tel://10086  
4.Msg    sms://10086  
~~~

## 参考资料

- http://blog.csdn.net/perfect_promise/article/details/7793735