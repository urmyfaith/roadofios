//
//  ZXPictureDetailVC.m
//  VistaLookTheWorld
//
//  Created by zx on 1/16/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXPictureDetailVC.h"
#import "DownloadManager.h"
#import "ZXPictureDetailModel.h"
#import "ZXPictureDetailView.h"



@interface ZXPictureDetailVC ()

@end

@implementation ZXPictureDetailVC
{
    NSString *_url;
    ZXPictureDetailModel *_pictureDetailModel;
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
    [self setNavigationBar];
    [self downloadData];
    
}


#pragma mark 下载数据
-(void)downloadData{
    _url = [NSString stringWithFormat:PICTURE_DETAIL_URL,_url_gid];
    NSLog(@"%s [LINE:%d]_url=%@", __func__, __LINE__,_url);
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(downloadFinish:)
                                                name:_url
                                              object:nil];
    
    [[DownloadManager sharedDownloadManager]addDownloadWithDownloadStr:_url andDownloadType:0];
}

#pragma mark 数据下载完成,解析数据
-(void)downloadFinish:(NSNotification *)notification{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    NSData *data = [[DownloadManager sharedDownloadManager] getDataArrayWithDownloadStr:_url];

     NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSDictionary *subDic = dic[@"list"][0];
    _pictureDetailModel = [ZXPictureDetailModel modelWithDic:subDic];
    [self loadPictureDeatilView];

}

#pragma mark  导航栏设置
-(void)setNavigationBar{
    //---backgroundImage
    if ([self.navigationController.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)] )
    {
        
        UIImage *image = [UIImage imageNamed:@"标题栏底.png"];
        [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    }
    
    
    //---backButton
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [backButton addTarget:self
                   action:@selector(backButtonClicked)
         forControlEvents:UIControlEventTouchUpInside];
    
    UIImage *settingImage = [UIImage imageNamed:@"返回_1"];
    [backButton setBackgroundImage:settingImage
                          forState:UIControlStateNormal];
    [backButton setBackgroundImage:[UIImage imageNamed:@"返回_2"]
                          forState:UIControlStateSelected];
    backButton.frame = CGRectMake(0,0, settingImage.size.width, settingImage.size.height);
    UIBarButtonItem *backItemCustomView = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = backItemCustomView;
}

-(void)backButtonClicked{
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)loadPictureDeatilView{
    ZXPictureDetailView *view =  [[[NSBundle mainBundle]loadNibNamed:@"PIctureDetailView" owner:nil options:nil]firstObject];
    view.frame = CGRectMake(0, 64, 320, 480-44-49);
    view.pictureDetailModel = _pictureDetailModel;
    [self.view addSubview:view];
}

@end
