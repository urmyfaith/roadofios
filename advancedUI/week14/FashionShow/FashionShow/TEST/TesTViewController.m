//
//  TesTViewController.m
//  FashionShow
//
//  Created by zx on 15/2/4.
//  Copyright (c) 2015年 zx. All rights reserved.
//

#import "TesTViewController.h"
#import "Download.h"
#import "INTERFACE.h"

@interface TesTViewController ()<DownloadDelegate>

@end

@implementation TesTViewController
{
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self testAPI];
    
    [self testDownload];
}

-(void)testAPI{

    NSLog(@"%@",zxAPI_FULLPATH);
}


-(void)testDownload{

    
    Download *download = [[Download alloc]init];
    download.downloadURL = zxAPI_FULLPATH;
    download.downloadRequestMethod = @"POST";
    download.postData_String = @"action=home&sa=Main&offset=0&count=20&uid=11111111&platform=a&mobile=HUAWEI+P6-C00&pid=10129&e=a2ae6a1b2c1a6aa2faa07bf2bd57ab37";
    download.delegate = self;
    [download startDownloadData];
}
-(void)downloadFinishWithDownload:(Download *)download{

    NSString *string = [[NSString alloc]initWithData:download.downloadData encoding:NSUTF8StringEncoding];
    //NSLog(@"%s [LINE:%d] string=%@", __func__, __LINE__,string);
    //解析为字符串

    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:download.downloadData options:NSJSONReadingMutableContainers error:nil];
    NSLog(@"%s [LINE:%d dic=%@]", __func__, __LINE__,dic);
    //解析为字典
    
}

@end
