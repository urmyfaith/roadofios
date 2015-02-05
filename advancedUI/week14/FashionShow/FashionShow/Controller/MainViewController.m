//
//  MainViewController.m
//  FashionShow
//
//  Created by zx on 15/2/3.
//  Copyright (c) 2015年 zx. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController
{
    NSString *_urlIdentifier;
    
    NSArray *_tableViewDataSource_array;
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
    [self createNavitaionbar];
    [self downloadData];
}

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


#pragma mark 下载数据
-(void)downloadData{
    
    NSString *postData_string = @"action=home&sa=Main&offset=0&count=20&uid=11111111&platform=a&mobile=HUAWEI+P6-C00&pid=10129&e=a2ae6a1b2c1a6aa2faa07bf2bd57ab37";
    _urlIdentifier= [NSString stringWithFormat:@"%@%@",zxAPI_FULLPATH,postData_string];
    
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(mainPage_downloadFinish)
                                                name:_urlIdentifier
                                              object:nil];
    [[DownloadManager sharedDownloadManager] addDownloadWithDownloadURL:zxAPI_FULLPATH andDownloadResqustMethod:@"POST"andPostDataString:postData_string];
}

-(void)mainPage_downloadFinish{
     _tableViewDataSource_array = [JSON2Model JSONData2ModelWithURLIdentifier:_urlIdentifier andDataType:zxJSON_DATATYPE_GENERIC];
}

#pragma mark 绘制顶部导航栏
-(void)createNavitaionbar{
    
    ZXNavigaitonBar *nb = [[ZXNavigaitonBar alloc]init];
    nb.frame = CGRectMake(0, 0, 320, 64);
    [nb createMyNavigaitonBarWithTitleImag:@"logo"
                                  andIsTop:YES
                              andTitleName:nil
                        andBackgroundImage:nil
                      andLeftBtnImagesName:nil
                     andRightBtnImagesName:@"栏目_1"
                                  andClass:self
                                    andSEL:@selector(navigationBarClicked:)];
    
    [self.view addSubview:nb];
}

-(void)navigationBarClicked:(UIButton *)button{
    if (button.tag == zxNavigaionBarButtonRightTag) {
        NSLog(@"%s [LINE:%d] rightButtonClicked.", __func__, __LINE__);
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
