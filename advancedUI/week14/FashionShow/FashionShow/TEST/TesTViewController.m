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
#import "DownloadManager.h"
#import "NSDate+Transform.h"
#import "ZXNavigaitonBar.h"


@interface TesTViewController ()<DownloadDelegate>

@end

@implementation TesTViewController
{

    NSString *_urlIdentifier;
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
    
//    [self testAPI];
    
//    [self testDownload];
    
//    [self testDownloadManager];
    
//    [self testNSDateTransform];
    
    [self testZXNavigationbar];
}

#pragma mark testZXNavigationbar
-(void)testZXNavigationbar{
    ZXNavigaitonBar *nb = [[ZXNavigaitonBar alloc]init];
     nb.frame = CGRectMake(0, 0, 320, 64);
    [nb createMyNavigaitonBarWithTitleImag:@"logo"
                                  andIsTop:YES
                              andTitleName:nil
                        andBackgroundImage:nil
                      andLeftBtnImagesName:@""
                     andRightBtnImagesName:@""
                                  andClass:self
                                    andSEL:@selector(navigationBarClicked:)];
   
    [self.view addSubview:nb];
}

-(void)navigationBarClicked:(UIButton *)button{
    if (button.tag  == zxNavigaionBarButtonLeftTag) {
        NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    }
    if (button.tag == zxNavigaionBarButtonRightTag) {
        NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    }
}

#pragma mark 测试分类 NSDate+Transform.h
-(void)testNSDateTransform{
    
    NSString *string = @"1422842994";
    // [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    NSLog(@"%@",[NSDate transformDateFromIntevalSince1970:string withFormate:@"yyyy/MM/dd HH:mm:ss"]);
    //NSLog(@"%@",[NSDate transformDateFromIntevalSince1970:string withFormate:nil]);
}


#pragma mark 测试下载管理类

-(void)testDownloadManager{
    
    NSString *postData_string = @"action=home&sa=Main&offset=0&count=20&uid=11111111&platform=a&mobile=HUAWEI+P6-C00&pid=10129&e=a2ae6a1b2c1a6aa2faa07bf2bd57ab37";
    _urlIdentifier= [NSString stringWithFormat:@"%@%@",zxAPI_FULLPATH,postData_string];
    
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(managerFinished)
                                                name:_urlIdentifier
                                              object:nil];
    [[DownloadManager sharedDownloadManager] addDownloadWithDownloadURL:zxAPI_FULLPATH andDownloadResqustMethod:@"POST"andPostDataString:postData_string];
}

-(void)managerFinished{
    //_focusListItemsArray = [[DownloadManager sharedDownloadManager]getDownloadDataWithDownloadStr:kFOUCS_LIST_URL];
    NSData *data = [[DownloadManager sharedDownloadManager]getDownloadDataWithURLIdentifier:_urlIdentifier];
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSLog(@"%s [LINE:%d dic=%@]", __func__, __LINE__,dic);
    //解析为字典
}


#pragma mark 测试接口地址

-(void)testAPI{

    NSLog(@"%@",zxAPI_FULLPATH);
}



#pragma mark 测试下载类

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
    NSLog(@"%s [LINE:%d] string=%@", __func__, __LINE__,string);
    //解析为字符串

    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:download.downloadData options:NSJSONReadingMutableContainers error:nil];
    NSLog(@"%s [LINE:%d dic=%@]", __func__, __LINE__,dic);
    //解析为字典
    
}

@end
