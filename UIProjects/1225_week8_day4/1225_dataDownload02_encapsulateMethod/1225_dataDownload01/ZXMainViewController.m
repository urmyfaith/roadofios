//
//  ZXMainViewController.m
//  1225_dataDownload01
//
//  Created by zx on 12/25/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXMainViewController.h"
#import "ZXHttpRequest.h"

@interface ZXMainViewController ()
@property(nonatomic,strong)    UITextView       *textView;
@property(nonatomic,strong)    ZXHttpRequest    *httpRequest;
@end

@implementation ZXMainViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadUI];
    [self testDownLoadWithAsyn];
}
-(void)loadUI{
    self.textView = [[UITextView alloc]init];
    self.textView.backgroundColor = [UIColor grayColor];
    self.textView.frame = CGRectMake(10, 20, 300, 400);
    [self.view addSubview:self.textView];
}

-(void)testDownLoadWithAsyn{
    
#if 0
    NSString *path = @"http://10.0.8.8/sns/my/user_list.php?page=1&number=10";
    self.httpRequest = [[ZXHttpRequest alloc]initWithPath:path];
#endif
    
#if  0
    NSString *path = @"http://10.0.8.8/sns/my/user_list.php?page=1&number=10";
    NSURL *url = [NSURL URLWithString:path];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    self.httpRequest = [[ZXHttpRequest alloc] initWithRequest:request];
#endif
    
#if  1
    NSString *path = @"http://10.0.8.8/sns/my/user_list.php?page=1&number=10";
    NSURL *url = [NSURL URLWithString:path];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    self.httpRequest = [[ZXHttpRequest alloc] initWithRequest:request target:self andAction:@selector(downloadFinished:)];
#endif
    
}
-(void)downloadFinished:(ZXHttpRequest*)httpRequest{
    NSDictionary *dic =  [NSJSONSerialization JSONObjectWithData:httpRequest.downloadData
                                                         options:NSJSONReadingMutableContainers
                                                           error:nil];
    NSLog(@"%s [LINE:%d] dic=%@", __func__, __LINE__,dic);
}
@end
