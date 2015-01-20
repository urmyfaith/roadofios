from SQB

## problem

~~~objectivec
*** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '-[ZKButton setText:]: unrecognized selector sent to instance 0x7fb042627a40'
*** First throw call stack:
(
	0   CoreFoundation                      0x000000010f536b75 __exceptionPreprocess + 165
	1   libobjc.A.dylib                     0x000000010f1cfbb7 objc_exception_throw + 45
	2   CoreFoundation                      0x000000010f53dc8d -[NSObject(NSObject) doesNotRecognizeSelector:] + 205
	3   CoreFoundation                      0x000000010f4956fc ___forwarding___ + 988
	4   CoreFoundation                      0x000000010f495298 _CF_forwarding_prep_0 + 120
	5   ‰Ωú‰∏ö                              0x000000010d78d61f -[SQBMainViewController main1Thread:] + 175
	6   Foundation                          0x000000010ed88102 __NSThreadPerformPerform + 299
	7   CoreFoundation                      0x000000010f46b9d1 __CFRUNLOOP_IS_CALLING_OUT_TO_A_SOURCE0_PERFORM_FUNCTION__ + 17
	8   CoreFoundation                      0x000000010f46189d __CFRunLoopDoSources0 + 269
	9   CoreFoundation                      0x000000010f460ed4 __CFRunLoopRun + 868
	10  CoreFoundation                      0x000000010f460906 CFRunLoopRunSpecific + 470
	11  GraphicsServices                    0x0000000111b91a58 GSEventRunModal + 161
	12  UIKit                               0x000000010da72870 UIApplicationMain + 1282
	13  ‰Ωú‰∏ö                              0x000000010d78c1c3 main + 115
	14  libdyld.dylib                       0x000000010fb81145 start + 1
	15  ???                                 0x0000000000000001 0x0 + 1
)
libc++abi.dylib: terminating with uncaught exception of type NSException
(lldb) 
~~~

##  问题分析:

从报错可以看出,给ZKButton发送了一个setText消息,但是,这个消息不被识别.

所以,在代码片段出,打印出对象的类型

~~~objectivec
-(void)main1Thread:(NSString *)str{
    UILabel *label = (UILabel *)[self.view viewWithTag:10];
    
    label.text = str;
}
~~~

~~~objectivec
(lldb) po [label class]
ZKButton

(lldb) 
~~~

 图片 0014_tag_problem_1.png
 
 所有找到问题的根源了,是因为对象是ZKButton对象,调用了不识别的方法.
 
 
## 查找tag值,确定对象类型.


tag值在两处有:

`SQBMainViewController.m`

~~~objectivec
        countLabel.tag = i + 10;
~~~


`ZKButton.m`

~~~objectivec
-(void)buttonCliked:(ZKButton *)button{
    //在点击事件发生时，调用block
    button.tag = 10;
    button.tempBlock(button);
}
~~~


0014_tag_problem_2.png

可以看到,程序中同时存在两个tag = 10的对象,一个是UIButton,一个UILabel.


## 修改

修改就很简单了,tag值设置位不一样就可以了.

所以,建议把tag值写成枚举类型..

