//
//  ViewController.m
//  0104_network01
//
//  Created by zx on 1/4/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"


@interface ViewController ()
@property (nonatomic,strong) UIProgressView    *progressView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
#pragma mark  1)简单介绍AFNetWorking
   // [self testGetRequest];
#pragma mark  2)Get的简单使用
    
#pragma mark  3)json/xml数据的解析
    //[self testJson];
    
#pragma mark  4)post上传图片
  //[self testPost];
    //[self testPostFile];
    
#pragma mark  5)使用AFNetworking下载数据
#if  0
    self.progressView = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleBar];
    self.progressView.frame = CGRectMake(10, 100, 300, 0);
    [self.view addSubview:self.progressView];
    self.progressView.backgroundColor = [UIColor grayColor];
    [self testDownloadData];
#endif

#pragma mark  6)图片的异步请求
  //  [self testAsyDownloadImage];
    
#pragma mark  7)判断网络状态
   [self testNetworkStatus];

}

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

-(void)testDownloadData{
    NSString *path = @"http://imgcache.qq.com/club/item/avatar/zip/7/i87/all.zip";
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSProgress *progress = nil;
    
    /*
    第一个参数:下载的文件的地址
     第二个参数:进度类的地址
     第三个参数:block下载文件保存的位置
     第四个参数:block,下载完成后,错误处理.
     */
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

-(void)testPost{
#if 0
    NSString *path = @"http://10.0.157.72/~zx/php/login.php";
    //NSString *path = @"http://127.0.0.1/~zx/php/login.php";
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //[manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
      manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager POST:path parameters:@{
                                    @"user":@"zx",
                                    @"password":@"123"
                                    } constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
                                        NSLog(@"111");
                                    }
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              NSLog(@"%s [LINE:%d] responseObject=%@", __func__, __LINE__,responseObject);
          }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                                      NSLog(@"333");;
    }];
#endif
    
#if 1
    NSString *path = @"http://127.0.0.1/~zx/php/login.php";
    //NSString *path = @"http://10.0.157.72/~zx/php/login.php";
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //[manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager POST:path parameters:@{
                                    @"user":@"zx",
                                    @"password":@"123"
                                    } constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
                                        NSLog(@"111");
                                    }
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              NSString *string =[[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
              NSLog(@"%s [LINE:%d] string=%@", __func__, __LINE__,string);
          }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              NSLog(@"333");;
          }];
#endif
 
#if 0
    NSString *path = @"http://127.0.0.1/~zx/php/login.php";
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager POST:path parameters:@{
                                    @"user":@"zx",
                                    @"password":@"123"
                                    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                        //
                                        NSLog(@"suc");
                                    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                        //
                                        NSLog(@"failed");
                                    }];
    
#endif
    
}

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
}

-(void)testGetRequest{
    
    //NSString *path = @"http://www.baidu.com";             //-----html
    //NSString *path = @"http://localhost/~zx/video-js/";   //-----html
    NSString *path = @"http://localhost/~zx/UISettingResources/userInfo.json";//----json
    
    //单例
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
