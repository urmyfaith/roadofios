# NSCFNumber,NSCFString,数据类型之间的问题

# code

```Objective-c
//1225_dataDownload_exercise/1225_dataDownload_exercise/ZXConcertTableViewCell.m
    NSString *image                     = [NSString stringWithFormat:
                                           @"http://pimg.damai.cn/perform/project/%@/%@_n.jpg",
                                           [ self.concertModel.concertProjectId substringToIndex:3],
                                           self.concertModel.concertProjectId];
```

# error

```Objective-c
1225_dataDownload_exercise[13765:607] *** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '-[__NSCFNumber substringToIndex:]: unrecognized selector sent to instance 0x8c4ef50'
*** First throw call stack:
(
	0   CoreFoundation                      0x018041e4 __exceptionPreprocess + 180
	1   libobjc.A.dylib                     0x015838e5 objc_exception_throw + 44
	2   CoreFoundation                      0x018a1243 -[NSObject(NSObject) doesNotRecognizeSelector:] + 275
```


## 错误原因:把数字对象当成了字符串对象使用

从json中解析的key-value

```Objective-c
{
 ...
            PriceStr = "180,280,380,480,680,980,1280,1680";
            ProjectID = 74248;
            ShowTime = "2015.04.11";
...
}
```

根据字典解析:

```
 self.concertProjectId   = dic[@"ProjectID"];
```
**但是,这样解析出来的是数字对象(NSCFNumber).然后用字符串对象指向了数字对象.**

## 解决方法:


将数组对象转换为字符串对象:

```Objective-c
      self.concertProjectId   = [NSString stringWithFormat:@"%i",[dic[@"ProjectID"] intValue]];
      //或者是
      self.concertProjectId   = [dic[@"ProjectID"] stringValue];
```


## 参考资料

-  http://www.cocoachina.com/bbs/read.php?tid=108559

> [__NSCFNumber isEqualToString:]: unrecognized selector sent to instance 0x6d48f80'
这个错误来看，你是把一个NSNumber和NSString直接做比较了。
估计是你存入NSUserDefaults时弄成了NSNumber类型。转换一下存入
[NSString stringWithFormat:@"%d",xx];

- http://stackoverflow.com/questions/9585901/nscfnumber-isequaltostring-error/9586079#9586079

> a little bit more code would be nice –  Novarg Mar 6 '12 at 14:48
5	 	
> There must be some code between these two lines. Otherwise it wouldn't crash. –  Costique Mar 6 '12 at 14:50
  	 	
> Yes, please post here ALL lines between the two code lines you posted above. –  MrTJ Mar 6 '12 at 14:50
  	 	
> There isn't any code between the two. Honest. Above these lines is a JSONParser grabbing some returnData from a request to a server. –  NinjaLikesCheez Mar 6 '12 at 15:12

- http://stackoverflow.com/questions/6876407/nscfnumber-isequaltostring-unrecognized-selector-sent-to-instance
