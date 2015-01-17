From ZHH

##problem 

程序崩溃信息:

~~~objectivec
2015-01-17 17:46:00.137 周末作业VISTA看天下[8158:469713] *** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '-[__NSCFConstantString size]: unrecognized selector sent to instance 0x105f659b0'
*** First throw call stack:
(
	0   CoreFoundation                      0x0000000107d57b75 __exceptionPreprocess + 165
	1   libobjc.A.dylib                     0x00000001079f0bb7 objc_exception_throw + 45
	2   CoreFoundation                      0x0000000107d5ec8d -[NSObject(NSObject) doesNotRecognizeSelector:] + 205
	3   CoreFoundation                      0x0000000107cb66fc ___forwarding___ + 988
	4   CoreFoundation                      0x0000000107cb6298 _CF_forwarding_prep_0 + 120
	5   UIKit                               0x00000001065469d1 -[UIButton imageRectForContentRect:] + 136
	6   UIKit                               0x0000000106549c54 -[UIButton _setupImageView] + 164
	7   UIKit                               0x0000000106548fb5 -[UIButton _updateImageView] + 85
	8   UIKit                               0x0000000106549829 -[UIButton layoutSubviews] + 77
	9   UIKit                               0x000000010630d303 -[UIView(CALayerDelegate) layoutSublayersOfLayer:] + 521
~~~

直接从崩溃信息里看,不知道是怎么回事.

## 解决办法

错误的将字符串作为图片设置了:

~~~objectivec
 [button setImage:array[i] forState:(UIControlStateNormal)];
~~~

> 所在的代码片段

~~~objectivec
...
    NSArray *array = @[@"上一章_1",@"评论_1",@"收藏",@"内页转发_1",@"下一章_1"];
    for (int i = 0; i < array.count; i ++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake((320/5)*i, 2, 320/5, 40);
        [button setImage:array[i] forState:(UIControlStateNormal)];

        
        [toolView1 addSubview:button];
        
    }
...
~~~

## 崩溃信息分析

再来看崩溃信息(注释)

~~~objectivec
2015-01-17 17:46:00.137 周末作业VISTA看天下[8158:469713] *** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '-[__NSCFConstantString size]: unrecognized selector sent to instance 0x105f659b0'
//对字符串常量发送了size消息,但是字符串不支持这个消息,所以报错.
*** First throw call stack:
(
	0   CoreFoundation                      0x0000000107d57b75 __exceptionPreprocess + 165
	1   libobjc.A.dylib                     0x00000001079f0bb7 objc_exception_throw + 45
	2   CoreFoundation                      0x0000000107d5ec8d -[NSObject(NSObject) doesNotRecognizeSelector:] + 205
	3   CoreFoundation                      0x0000000107cb66fc ___forwarding___ + 988
	4   CoreFoundation                      0x0000000107cb6298 _CF_forwarding_prep_0 + 120
	5   UIKit                               0x00000001065469d1 -[UIButton imageRectForContentRect:] + 136//这里是说在对button的设置图片,图片大小
	6   UIKit                               0x0000000106549c54 -[UIButton _setupImageView] + 164//给Button设置图片
	7   UIKit                               0x0000000106548fb5 -[UIButton _updateImageView] + 85//更新Button的图片
	8   UIKit                               0x0000000106549829 -[UIButton layoutSubviews] + 77//设置Button的子控件的布局
	9   UIKit                               0x000000010630d303 -[UIView(CALayerDelegate) layoutSublayersOfLayer:] + 521
~~~

总结一些崩溃的流程

1. 给UIButton的子控件布局
2. 更新UIButton的图片视图
3. 设置UIButton的图片视图
4. 设置图片视图的大小
5. _CF_forwarding_prep_
6. ___forwarding___ 
7. [NSObject(NSObject) doesNotRecognizeSelector:]方法不识别
8. objc_exception_throw 对象抛出异常
9. __exceptionPreprocess 程序崩溃.

> 所以,分析的关键的是从第4个, imageRectForContentRect,设置图片的大小的时候报错.
> 
> 由于传递的参数是字符串,而不是图片,字符串不响应size方法,所以程序崩溃.
> 
