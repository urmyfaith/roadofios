
//
//  ZXMainViewController.m
//  1225_dataDownload01
//
//  Created by zx on 12/25/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXMainViewController.h"

@interface ZXMainViewController ()<NSURLConnectionDataDelegate>
@property(nonatomic,strong)    UITextView       *textView;
@property (nonatomic,strong)   NSMutableData    *downloadData;
@end

@implementation ZXMainViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadUI];
//    [self performSelector:@selector(testDownloadWithString) withObject:nil afterDelay:2];
//    [self testDownloadWithString];
//    [self testDownLoadWithsyn];
    [self testDownLoadWithAsyn];
}
-(void)loadUI{
    self.textView = [[UITextView alloc]init];
    self.textView.backgroundColor = [UIColor grayColor];
    self.textView.frame = CGRectMake(10, 20, 300, 400);
    [self.view addSubview:self.textView];
}

-(void)testDownloadWithString{
    //http://10.0.8.8/sns/my/headimage.php?uid=94244
    NSString *path = @"http://10.0.8.8/sns/my/user_list.php?page=1&number=10";
    NSURL *url = [NSURL URLWithString:path];
    NSError *error = nil;
    NSString *urlContent = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
    if (!error) {
        NSLog(@"%s [LINE:%d]urlContent=%@", __func__, __LINE__,urlContent);
        self.textView.text = urlContent;
    }else
    {
        NSLog(@"data load error! error=%@",error);
    }
}

-(void)testDownLoadWithsyn{
    
    //1. create path
    NSString *path = @"http://10.0.8.8/sns/my/user_list.php?page=1&number=10";
    
    //2 .create url
    NSURL *url = [NSURL URLWithString:path];
    
    //3. creat requst
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    
    //4.===>get data
    NSData *data =  [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    
    NSString *dataString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding ];
    NSLog(@"%s [LINE:%d] dataString=%@", __func__, __LINE__,dataString);
    
    self.textView.text = dataString;
}


-(void)testDownLoadWithAsyn{
    //1. create path
    NSString *path = @"http://10.0.8.8/sns/my/user_list.php?page=1&number=10";
    
    //2 .create url
    NSURL *url = [NSURL URLWithString:path];
    
    //3. creat requst
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    
    //4.===>get data    a)requestOjb b)delegateObj c)when  to start.
    NSURLConnection *conn =  [[NSURLConnection alloc]initWithRequest:request
                                                            delegate:self
                                                    startImmediately:YES];
}
-(NSMutableData *)downloadData{
    if (_downloadData == nil) {
        _downloadData = [[NSMutableData alloc]init];
    }
    return _downloadData;
}

#pragma mark NSURLConnectionDataDelegate

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    NSLog(@"%s [LINE:%d] didReceiveResponse", __func__, __LINE__);
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    NSLog(@"%s [LINE:%d] didReceiveData", __func__, __LINE__);
    
    //when data is large,this method will run servel times;
    [self.downloadData appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSLog(@"%s [LINE:%d] connectionDidFinishLoading", __func__, __LINE__);
    
    NSString *dataString = [[NSString alloc]initWithData:self.downloadData encoding:NSUTF8StringEncoding ];
    //NSLog(@"%s [LINE:%d] dataString=%@", __func__, __LINE__,dataString);
    self.textView.text = dataString;
    
    //reslove data from file.
    NSDictionary *dic =  [NSJSONSerialization JSONObjectWithData:self.downloadData
                                                         options:NSJSONReadingMutableContainers
                                                           error:nil];
    NSLog(@"%@",dic);

}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"%s [LINE:%d] didFailWithError", __func__, __LINE__);
}

@end
