- 内存管理/很大内存管理

- 动态加载

- 常驻内存

- 关于适配


```
先做好充分准备,不要浪费机会.

- 面试遇到笔试.发QQ,

二维码加密---半年多,老板说,不喜欢结交.

"你愿不愿意跟着我学?"---需要的时候,随时帮我.

大徒弟,猝死了.

二徒弟,车祸死了.

学了大概1年0二个月,c和c++,安全.20+

住他们家里,更多的了解,山河联动,第九家公司.

mac本,4~5个月一换,键盘敲坏了.睁眼敲代码,闭眼敲代码.

期间,无数个人给他介绍gf,给人一顿数落.

09-11.6 十三分工作.他需要我去帮忙,1个月到2个月.

微软...上午入职,下午离职...

消停...突然有一天,不见了.关机?

九家公司关闭,瞬间倒闭,过了一年半,抽风了,摄影才是人生中最有趣的事情.

非洲拍了动物,所有钱全部用来买相机,100+莱卡相机.

找公司,做钞票上的油墨的分析.

人生的新的方向===> QQ五位,中国物联网开发联盟.

基层,微软发布win7,win7有bug/漏洞===> 系统安全.===>离职不干了.

天天接电话,10w块,给你解决一下====>软件咨询.

11年,iOS(顶峰时期),太难了,你学不了,第一岁首大,瓶颈了. 

过了3个月,吃饭,国贸二期,十二楼,10-18,小s标.苹果标.(苹果中国10层到18层)

三个月自学到苹果管理层(立马就不干了)

选对了一步路,选择了培训,快速拉入这个行业.积累经验快.

自学能力和改错能力差.

第一,高新,对于愿意付出的人.

技术每天都有更新,

永远学不完.


```

## 两种加载图片对内存占用的问题

~~~objectivec
//静态缓存的图片 - 当图片被加载之后,会将图片缓存在静态区,会造成程序占用内存大.但是由于是缓存在静态区的图片,所以再次调用图片的时候,无需直接读取.(占内存,效率高)
 UIImage *bgImage1 = [[UIImage imageNamed:@"1.jpg"]; 

 UIImage *bgImage = [[UIImage alloc]initWithContentsOfFile:@""];
 //不缓存图片- 每次调用此方法临时加载图片,释放图片页之后随之释放,当再次调用时需要重新分配新内存以及加载图片(占用内存小,效率低)
~~~

| 类别 | 方法| 说明|
| :-------------: | :------------: |:------:|
| imageNamed: | 静态缓存图片| 占内层,效率高|
| alloc]initWithContentsOfFile: | 不缓存图片 | 占用内存小,效率低|

根据图片尺寸大小,调用频率来分别使用.

图片尺寸大,频率低----> 不缓存

图片尺寸小,频率高---> 缓存图片


## 程序的大小与内存大小

所需大小和占用内存大小.

分配了150M,占用了130M大概就开始卡了.

内存分配规则

1.进行内存的分批加载
	- 当前页+左/右两页.
	- 当前页的重资源.
2.进行内存的轻重加载


重资源---视频
轻资源---图片

initWithTarget:selector:object:


(0 ,1,[2],3,4)
0 ,(1,2,[3],4,5)



## for循环的三种遍历方法

第一种,使用下标进行遍历

~~~objectivec
for (int i < 0 ; i < xxx; i++)
~~~


第二种,快速枚举进行变量

第三种,使用枚举器进行遍历

在快速枚举或者使用枚举器进行遍历时,如果对遍历源(数组,字典)

但是,如果使用下标进行遍历则不会.

~~~objectivec
unloadPage - 00
2015-01-22 14:20:22.326 MyMagazine[16005:1533306] *** Terminating app due to uncaught exception 'NSGenericException', reason: '*** Collection <__NSArrayM: 0x7fbbbaeef190> was mutated while being enumerated.'
*** First throw call stack:
(
	0   CoreFoundation                      0x0000000105febb75 __exceptionPreprocess + 165
	1   libobjc.A.dylib                     0x0000000105bc3bb7 objc_exception_throw + 45
	2   CoreFoundation                      0x0000000105feb4d4 __NSFastEnumerationMutationHandler + 132
	3   MyMagazine                          0x0000000104016f6b -[MainViewController loadPageView] + 971
	4   MyMagazine                          0x0000000104016b78 -[MainViewController scrollViewDidEndDecelerating:] + 168
	5   UIKit                               0x00000001044fcca3 -[UIScrollView(UIScrollViewInternal) _stopScrollDecelerationNotify:] + 277
	6   UIKit                               0x00000001044fcebd -[UIScrollView(UIScrollViewInternal) _stopScrollingNotify:pin:tramplingDragFlags:] + 479
	7   UIKit                               0x00000001044f76aa -[UIScrollView _smoothScrollWithUpdateTime:] + 2896
	8   QuartzCore                          0x0000000108a59737 _ZN2CA7Display15DisplayLinkItem8dispatchEv + 37
	9   QuartzCore                          0x0000000108a595ff _ZN2CA7Display11DisplayLink14dispatch_itemsEyyy + 315
	10  CoreFoundation                      0x0000000105f533e4 __CFRUNLOOP_IS_CALLING_OUT_TO_A_TIMER_CALLBACK_FUNCTION__ + 20
	11  CoreFoundation                      0x0000000105f52fa5 __CFRunLoopDoTimer + 1045
	12  CoreFoundation                      0x0000000105f162dd __CFRunLoopRun + 1901
	13  CoreFoundation                      0x0000000105f15906 CFRunLoopRunSpecific + 470
	14  GraphicsServices                    0x000000010856da58 GSEventRunModal + 161
	15  UIKit                               0x0000000104466870 UIApplicationMain + 1282
	16  MyMagazine                          0x0000000104017b23 main + 115
	17  libdyld.dylib                       0x000000010680e145 start + 1
	18  ???                                 0x0000000000000001 0x0 + 1
)
libc++abi.dylib: terminating with uncaught exception of type NSException
(lldb) 
~~~




~~~objectivec
0,1,[2],3,4
i= 0 删除0
1,2,3,4
i= 1 删除2
1,3,4
i = 2删除4
1,3
~~~

在遍历数组的时候,删除元素时候,后面的元素前移,所以会跳过一个元素(循环条件i++).
解决办法是在删除一个元素之后,i--,


~~~objectivec
0,1,2,3,4
i= 0,删除0
1,2,3,4
i--,i++ ,这样i = 0
i= 0 ,删除1
2,3,4
i--,i++,这样i = 0
i = 0,删除2
3,4
~~~


## 谓词/预测/谓语

枚举器,类簇,

C89,C95,C99

~~~objectivec
int i;
for ( i = 0; i < 10; i++) {
   //
}
//c89,c95,c99
~~~

~~~objectivec
for(int i = 0 ; i < 10; i++{
    	//
    }
//c99+
~~~

##  播放音乐

- 引入头文件

~~~objectivec
#import <AVFoundation/AVFoundation.h>
~~~

~~~objectivec
NSURL fileURLWithPath:<#(NSString *)#>//本地路径
NSURL *url = [NSURL URLWithString:<#(NSString *)#>] //网络路径
~~~



    