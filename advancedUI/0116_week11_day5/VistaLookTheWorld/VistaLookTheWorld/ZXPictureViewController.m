//
//  ZXPictureViewController.m
//  VistaLookTheWorld
//
//  Created by zx on 1/16/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXPictureViewController.h"
#import "ZXPictureModel.h"
#import "ZXPictureCell.h"



@interface ZXPictureViewController ()<UITableViewDataSource,UITableViewDelegate>


@end

@implementation ZXPictureViewController

{
    UITableView *_tableView;
    NSArray *_datas_array;

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setNavigationBar];
    
    [self loadTableView];
    [self downloadData];
}

#pragma mark 下载数据
-(void)downloadData{
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(downloadFinish:)
                                                name:PICTURE_URL
                                              object:nil];
    
    [[DownloadManager sharedDownloadManager]addDownloadWithDownloadStr:PICTURE_URL andDownloadType:0];
}

#pragma mark 数据下载完成
-(void)downloadFinish:(NSNotification *)notification{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    NSData *data = [[DownloadManager sharedDownloadManager] getDataArrayWithDownloadStr:PICTURE_URL];
    _datas_array = [NSArray arrayWithArray:[self parseJSONWithData:data]];
    [_tableView reloadData];
}

#pragma mark 解析数据
-(NSArray *)parseJSONWithData:(NSData *)data{
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    NSMutableArray *array = [NSMutableArray array];

    ZXPictureModel *model =[ZXPictureModel modelWithArray:dic[@"list"]];
    [array addObject:model];
    return array;
}



#pragma mark 创建表视图

-(void)loadTableView{
    _tableView = [[UITableView alloc]init];
    _tableView.frame = self.view.bounds;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    [self.view addSubview:_tableView];

}


#pragma mark 表视图--数据源

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_datas_array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZXPictureCell *cell = [ZXPictureCell cellWithTableView:tableView];
    cell.pictureModel = _datas_array[indexPath.row];
    

    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return (100+10)*(15/3);
}


#pragma mark 页面跳转
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
//    ((ZXCustomTabBarVC *)self.tabBarController).customTabBar.hidden = YES;
}

#pragma mark  处理标签栏的隐藏

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    ((ZXCustomTabBarVC *)self.tabBarController).customTabBar.hidden = NO;
}


#pragma mark  导航栏设置
-(void)setNavigationBar{
    //---backgroundImage
    if ([self.navigationController.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)] )
    {
        
        UIImage *image = [UIImage imageNamed:@"标题栏底.png"];
        [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    }
    //---centerImage
    UIImage *centerImage = [UIImage imageNamed:@"logo"];
    UIImageView *centerImageView = [[UIImageView alloc]initWithImage:centerImage];
    self.navigationItem.titleView = centerImageView;
    
    //---rightSettingButton
    UIButton *settingButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [settingButton addTarget:self
                      action:@selector(buttonClicked)
            forControlEvents:UIControlEventTouchUpInside];
    
    UIImage *settingImage = [UIImage imageNamed:@"设置_1"];
    [settingButton setBackgroundImage:settingImage forState:UIControlStateNormal];
    
    settingButton.frame = CGRectMake(0,0, settingImage.size.width, settingImage.size.height);
    UIBarButtonItem *rightItemCustomView = [[UIBarButtonItem alloc] initWithCustomView:settingButton];
    self.navigationItem.rightBarButtonItem = rightItemCustomView;
}

-(void)buttonClicked{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
}

@end
