
- 工程目录组织

Application：这个group中放的是AppDelegate和一些系统常量及系统配置文件；
Base：一些基本父类，包括父ViewController和一些公用顶层自定义父类，其他模块的类一般都继承自这里的一些类；
Controller：系统控制层，放置ViewController，均继承于Group Base中的BaseViewController或BaseTableViewController；
View：系统中视图层，由于我比较喜欢通过代码实现界面，所以这里放的都是继承于UIView的视图，我将视图从ViewController中分离出来全部放在这里，这样能保持ViewController的精简；
Model：系统中的实体，通过类来描述系统中的一些角色和业务，同时包含对应这些角色和业务的处理逻辑；
Handler：系统业务逻辑层，负责处理系统复杂业务逻辑，上层调用者是ViewController；
Storage：简单数据存储，主要是一些键值对存储及系统外部文件的存取，包括对NSUserDefault和plist存取的封装；
Network：网络处理层(RTHttpClient)，封装了基于AFNetworking的网络处理层，通过block实现处理结果的回调，上层调用者是Handler层；
Database：数据层，封装基于FMDB的sqlite数据库存取和管理(RTDatabaseHelper)，对外提供基于Model层对象的调用接口，封装对数据的存储过程。
Utils：系统工具类(AppUtils)，主要放置一些系统常用工具类；
Categories：类别，对现有系统类和自定义类的扩展；
Resource：资源库，包括图片，plist文件等；


- 

宏定义:网络接口
常量是用宏定义或者枚举



#问题1 --已解决

post请求,url地址相同,只是请求体不同,

所以下载之后,缓存数据的的key不能是url,而是请求体.

将ulr和postData拼接起来,作为唯一的标志符


#问题2

首页,页面能够下拉刷新,但是不能上拉.
这是怎么实现的?


##问题3  ---已解决

使用模态视图转换

从UINavigationController/UIViewController  push到 UITabBarController
~~~objectivec

kindDemo里面确实是push了啊????


~~~

## 问题4
 
 计算文件夹的大小
 
 http://www.cocoachina.com/bbs/read.php?tid-265475.html
 http://blog.sina.com.cn/s/blog_63b4ee0d0101gdli.html
 http://www.2cto.com/kf/201412/360426.html

## 问题5 --已经解决

首页首行cell的尺寸调整问题

/*

尺寸:
首行cell
高度145
数字图片宽度65

其他行
高度85
图片150w*85h
320-64-150= 106 剩余
gapW = 8???
gapH = 5;

*/

## 问题6

webView点击图片,添加自定义视图

## 问题7

webView的内容怎么缓存?

从webView的创建过来看,数据的下载已经封装到内部了.
怎么取出下载的数据?

UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
NSURL *url = [NSURL URLWithString:_urlIdentifier];
NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
[webView loadRequest:request];
[self.view addSubview:webView];

> 参考资料:

- http://code4app.com/ios/UIWebView-%E7%A6%BB%E7%BA%BF%E6%B5%8F%E8%A7%88/51204e716803fa2949000001
- http://openq.cn/use-nsurlprotocol-uiwebview-offline-cache/
- http://openq.cn/nsurlcache-to-achieve-a-little-experience-for-offline-reading/
- http://blog.csdn.net/mad2man/article/details/30285001



## 问题8  ---已解决

PostCommentViewController.m

UITextView
怎么得到输入文字的高度,比如输入了两行数据?

怎么得到这两行数据的整体高度?


# 问题9 KVO的使用 ---已解决

PostCommentViewController.m # 228

- 使用_isCommentSuccess改变值的时候,不会触发KVO的方法.

- 自己能监听自己的属性的么?(可以)

- 监听属性(可以是私有的属性)

- https://github.com/urmyfaith/roadofios/blob/e7ab82dcd9b6e3ef12b986a7adb6c1e5a1d46686/advancedUI/week14/FashionShow/FashionShow/Controller/FashionViewController.m#L145-156

# 问题10 下拉刷新无数据返回 -- 已解决

下拉刷新的时候,没有数据返回的时候,给用户一个提示
使用第三方库 iToast,类似android上自带的toast消息提示.

使用很简单,消息内容,消息位置,消息显示时间长度,显示

- https://github.com/urmyfaith/roadofios/blob/1847404a85859d16851ab84b56e7d26d1d66fc7b/advancedUI/week14/FashionShow/FashionShow/Controller/FashionViewController.m#L88-93


# 问题11  美容页面怎么实现?

难点:数据源是


#todo  将所有的尺寸改写为宏定义
