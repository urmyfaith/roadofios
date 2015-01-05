2015-01-04

| 文件名 |  描述 |
| ------------- | ------------ |
|[0104_network01-basic](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/0104_week9_day7/0104_network01-basic)| 网络AFNetworking的使用,GET请求(html请求,json请求),POST请求(带参数请求/带文件请求),下载数据,下载图片,网络状态 |
|[HTTP_POST0-GET.pages](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/0104_week9_day7/HTTP_POST0-GET.pages)| 知识点 |
|[O2O_C2C_B2B_B2C.pdf](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/0104_week9_day7/O2O_C2C_B2B_B2C.pdf)| 名词解释 |


## 知识复习

自定义cell--->cell的高度
影响图片的高度的因素

- 图片的显示与否
- 文字的高度自定义
- 详情:原来的cell高度+子的内容高度-->刷表


执行方法的高度:

1) 先执行的高度的方法
2) 后执行的cellForRowAtIndexpath


## 今天要点

- 网络知识
- mac上配置 

## 1)简单介绍AFNetWorking

 使用Http传输数据的方式:

- NSURLconnection(oc自带)
- ASIHttpRequest(较早使用,现在使用很少)Non-ARC
- AFNetWorking ARC,好处:由于使用了blokc,更加简单健壮

a) 准备请求的地址

b) http请求操作管理器

c) 设置请求文件的类型

d) 调用请求方法

```objectivec
-(void)testGetRequest{
    //NSString *path = @"http://localhost/~zx/video-js/";   //-----html
    NSString *path = @"http://localhost/~zx/UISettingResources/userInfo.json";//----json
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    //设置content-type(默认json)
    //设置传输数据的类型:二进制
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    
    
    //请求指定路径的数据
    //指定请求完成后的回调方法--->下载成功,下载失败.
    [manager GET:path
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             
                    NSString *string = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
                    NSLog(@"%s [LINE:%d] string=%@", __func__, __LINE__,string); }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                    NSLog(@"%s [LINE:%d] error=%@", __func__, __LINE__,error);}
     ];
}
```

## 2)Get的简单使用

```objectivec
     2.1. 一般get是从服务器上获取数据，post是向服务器传送数据。
     2.2. get是把参数数据队列加到提交表单的ACTION属性所指的URL中，值和表单内各个	字段一一对应，在URL中可以看到。post是通过HTTP post机制，将表单内各个字段与其内容放置在HTML HEADER内一起传送到ACTION属性所指的URL地址。用户看不到这个过程。
     2.3. 对于get方式，服务器端用Request.QueryString获取变量的值，对于post方式，服务器端用Request.Form获取提交的数据。
     2.4. get传送的数据量较小，不能大于2KB。post传送的数据量较大，一般被默认为不受限制。但理论上，IIS4中最大量为80KB，IIS5中为100KB。
     2.5. get安全性非常低，post安全性较高。但是执行效率却比Post方法好。
     2.1、get方式的安全性较Post方式要差些，包含机密信息的话，建议用Post数据提交方式；
     2.2、在做数据查询时，建议用Get方式；而在做数据添加、修改或删除时，建议用Post方式；	 
```

get,post 方法区别: http://www.w3school.com.cn/tags/html_ref_httpmethods.asp

| 参数序号 | 参数说明 |
| ------------- | ------------ |
| arg1  | 下载数据的来源 |
| arg2  | **请求的参数**(路径之后的参数) |
| arg3  | 请求成功的回调方法 |
|   | argv1 默认参数,不用管|
|   | argv2 得到的数据|
| arg4  | 请求失败的回调方法 |
|   | argv1 默认参数,不用管|
|   | argv2 得到的数据|

```objectivec
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //
    }];
```

## 3)json/xml数据的解析

-  准备请求的路径字符串
-  创建http请求操作管理器
-  设置请求的类型(默认二进制)
-  调用get请求方法

```objectivec
-(void)testJson{
    NSString *path = @"http://m.weather.com.cn/data/101010100.html";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    [manager GET:path
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
             NSLog(@"%s [LINE:%d] dic = %@ ", __func__, __LINE__,dic);
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"%s [LINE:%d] error= %@", __func__, __LINE__,error);
         }
     ];
}
```



## 4)post上传图片

| 参数列表 | 参数说明 |
| ------------- | ------------ |
| arg1  | 请求的路径 |
| arg2  | 请求的路径后参数 |
| arg3  | 上传后保存的内容 |
| arg4  | 上次成功的回调方法 |
| arg5  | 上传失败的的回调方法 |


```objectivec
-(void)testPostFile{
NSString *path = @"http://127.0.0.1/~zx/php/upload.php";
AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
manager.responseSerializer = [AFHTTPResponseSerializer serializer];    
[manager POST:path parameters:@{
                                    @"user":@"zx",
                                    @"password":@"123"
                                    }
constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
             NSLog(@"%s [LINE:%d] formData=%@", __func__, __LINE__,formData);
             NSString *imagePath = [ [NSBundle mainBundle] pathForResource:@"menu_bg_01-hd.jpg" ofType:nil];
            NSLog(@"%s [LINE:%d] imagePath=%@", __func__, __LINE__,imagePath);
             [formData appendPartWithFileURL:[NSURL fileURLWithPath:imagePath]
                                       name:@"file"
                                   fileName:@"zxupload.jpg"
                                   mimeType:@"image/jpg"
                                      error:nil];
                                    }
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              NSLog(@"%s [LINE:%d] upload success.", __func__, __LINE__);
              NSString *string  = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding ];
              NSLog(@"%s [LINE:%d] string=%@", __func__, __LINE__,string);}
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              NSLog(@"%s [LINE:%d] error=%@", __func__, __LINE__,error);
          }];
};
```

 - 通过数据库保存文件
 - 把文件本身放到服务器下某个目录中,只保存文件的名称.
 
 | 参数序号 | 参数说明 |
| ------------- | ------------ |
| arg1  | 服务器上传文件文件路径 |
| arg2  | 上传类型 |
| arg3  | 上传后保存为的名字 |
| arg4  | 上传文件的类型 |
| arg5  | 错误处理 |



1. 准备请求的路径字符串
2. 创建http操作管理类
3. 设置http请求的类型
4. 调用POST请求的方法(各个参数的使用)

## 5)使用AFNetworking-AFURLSessionManager下载数据

下载使用的管理类AFURLSessionManager
> **下载线程不能实时的控制UI线程控件的状态**
> 解决办法:
> > 创建一个队列,将改变过程放在队列中.
> >



1. 下载文件的路径
2. 创建AFURLSessionManager(地址回话管理类)
3. 创建NSURLSessionDownloadTask(地址会话下载任务)
4. 开始下载任务
5. 对下载进度使用KVO(键值观察,监听下载进度的变化==>反映到进度条上)
6. 下载进度(下载线程)的值反映到UI的改变(UI线程上),不同线程的传值,使用操作队列,添加操作

```objectivec
-(void)testDownloadData{
    NSString *path = @"http://imgcache.qq.com/club/item/avatar/zip/7/i87/all.zip";
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSProgress *progress = nil;

    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:path]]
                                                                     progress:&progress
                                                                  destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
                                                                      NSString *path = [NSString stringWithFormat:@"%@/documents/download.zip",NSHomeDirectory()];
                                                                      NSLog(@"%s [LINE:%d] path=%@", __func__, __LINE__,path);
                                                                      return [NSURL fileURLWithPath:path];}
                                                            completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
                                                                                if (error == nil) {
                                                                                    NSLog(@"%s [LINE:%d] download success.", __func__, __LINE__);
                                                                                }
                                                                                else{
                                                                                    NSLog(@"%s [LINE:%d] error=%@", __func__, __LINE__,error);
                                                                                }
                                                                  }];
    [downloadTask resume];
    
    [progress  addObserver:self forKeyPath:@"fractionCompleted" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
      
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    float currentProgress = [[object valueForKey:@"fractionCompleted"] floatValue];
    NSLog(@"%s [LINE:%d] %.lf", __func__, __LINE__,currentProgress*100);
    
    
    //创建一个队列,将改变过程放在block中.
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        self.progressView.progress = currentProgress;//一条线程不能控制另一个线程中控件的变化
    }];

}
```

## 6)图片的异步请求(UIImageView+AFNetworking.h)

"#import "UIImageView+AFNetworking.h""

```objectivec
-(void)testAsyDownloadImage{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 320, 320)];
    [self.view addSubview:imageView];
    
    
    //-----通过AFNetworking的方法异步下载图片
     [imageView setImageWithURL:[NSURL URLWithString:@"http://10.0.157.72/~zx/php/upload/dancer.jpg"]];
//   [imageView setImageWithURL:[NSURL URLWithString:@"http://localhost/~zx/php/upload/dancer.jpg"]];
    
    [imageView setImageWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://10.0.157.72/~zx/php/upload/dancer.jpg"]]
                     placeholderImage:nil
                              success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                  //
                                  imageView.frame = CGRectMake(10, 10, image.size.width, image.size.height);
                                  imageView.image = image;
                              }
                              failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
                                  NSLog(@"%s [LINE:%d] error=%@", __func__, __LINE__,error);
                              }];
}
```

1. 创建UIImageView对象
2. 设置图像的URL地址
3. 调用图片URL请求的方法
	- URL请求
	- 占位符
	- 请求成功的回调方法
	- 请求失败的回调方法

## 7)判断网络状态

1. 创建AFHTTPRequestOperationManager对象
2. 子对象manager.reachabilityManager,调用子对象的状态改变方法
3. 开始监听状态改变. 

```objectivec
-(void)testNetworkStatus{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        //
        switch (status) {
            case -1:
                NSLog(@"%s [LINE:%d] status =AFNetworkReachabilityStatusUnknown", __func__, __LINE__);
                break;
            case 0:
                  NSLog(@"%s [LINE:%d] status = AFNetworkReachabilityStatusNotReachable", __func__, __LINE__);
                break;
            case 1:
                  NSLog(@"%s [LINE:%d] status = AFNetworkReachabilityStatusReachableViaWWAN", __func__, __LINE__);
                break;
            case 2:
                NSLog(@"%s [LINE:%d] status = AFNetworkReachabilityStatusReachableViaWiFi", __func__, __LINE__);
                break;
            default:
                break;
        }
      
    }];
    [manager.reachabilityManager startMonitoring];
}
```




