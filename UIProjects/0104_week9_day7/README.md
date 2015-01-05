2015-01-04

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

| A | B |
| ------------- | ------------ |
| arg1  | 下载数据的来源 |
| arg2  | 请求的参数 |
| arg3  | 请求成功的回调方法 |
|   | argv1 默认参数,不用管|
|   | argv2 得到的数据|
| arg4  | 请求失败的回调方法 |
|   | argv1 默认参数,不用管|
|   | argv2 得到的数据|

    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //
    }];

## 3)json/xml数据的解析

## 4)post上传图片

| 参数列表 | 参数说明 |
| ------------- | ------------ |
| arg1  | 请求的路径 |
| arg2  | 请求的路径后参数 |
| arg3  | 上传后保存的内容 |
| arg4  | 上次成功的回调方法 |
| arg5  | 上传失败的的回调方法 |


```objectivec
    [manager POST:path parameters:@{
                                    @"user":@"zx",
                                    @"password":@"123"
                                    } constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        //
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //
    }];
```

 - 通过数据库保存文件
 - 把文件本身放到服务器下某个目录中,只保存文件的名称.
 
 | A | B |
| ------------- | ------------ |
| arg1  | 服务器上传文件文件路径 |
| arg2  | 上传类型 |
| arg3  | 上传后保存为的名字 |
| arg4  | 上传文件的类型 |
| arg5  | 错误处理 |


```objectivec
             [formData appendPartWithFileURL:[NSURL fileURLWithPath:imagePath]
                                       name:@"file"
                                   fileName:@"zx-upload.png"
                                   mimeType:@"image/jpg"
                                      error:nil];
```

## 5)使用AFNetworking下载数据

下载使用的管理类AFURLSessionManager
> **下载线程不能实时的控制UI线程控件的状态**
> 解决办法:
> > 创建一个队列,将改变过程放在队列中.
> >


```objectivec
    //创建一个队列,将改变过程放在block中.
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        self.progressView.progress = currentProgress;//一条线程不能控制另一个线程中控件的变化
    }];
```

## 6)图片的异步请求

## 7)判断网络状态




