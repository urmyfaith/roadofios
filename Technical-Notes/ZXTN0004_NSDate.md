## 时间戳,日期格式的转换.




~~~objectivec
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    NSDate *theday = [NSDate dateWithTimeIntervalSince1970:1422515735];
    NSString *day = [dateFormatter stringFromDate:theday];
    NSLog(@"%s [LINE:%d] day=%@", __func__, __LINE__,day);
    
    NSDate *now = [[NSDate alloc]init];
    NSLog(@"%s [LINE:%d] now=%@", __func__, __LINE__,now);
~~~


~~~objectivec
2015-01-29 19:42:24.808 demo[10246:607] -[ZXViewController viewDidLoad] [LINE:25] day=2015/01/29 15:15:35
2015-01-29 19:42:24.809 demo[10246:607] -[ZXViewController viewDidLoad] [LINE:28] now=2015-01-29 11:42:24 +0000
~~~

## 参考资料

- 1. http://blog.csdn.net/sxsj333/article/details/7776910
