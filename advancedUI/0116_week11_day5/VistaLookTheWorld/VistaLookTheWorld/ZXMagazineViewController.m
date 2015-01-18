//
//  ZXMagazineViewController.m
//  VistaLookTheWorld
//
//  Created by zx on 1/16/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXMagazineViewController.h"
#import "ZXMagazineModel.h"
#import "ZXMagazineCell.h"
#import "ZXMagazineItemVC.h"

@interface ZXMagazineViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ZXMagazineViewController
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
                                                name:MAGAZINE_URL
                                              object:nil];
    
    [[DownloadManager sharedDownloadManager]addDownloadWithDownloadStr:MAGAZINE_URL andDownloadType:0];
}

#pragma mark 数据下载完成
-(void)downloadFinish:(NSNotification *)notification{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    NSData *data = [[DownloadManager sharedDownloadManager] getDataArrayWithDownloadStr:MAGAZINE_URL];
    _datas_array = [NSArray arrayWithArray:[self parseJSONWithData:data]];
    [_tableView reloadData];
}

#pragma mark 解析数据
-(NSArray *)parseJSONWithData:(NSData *)data{
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *subDic in [dic objectForKey:@"list"]) {
        ZXMagazineModel *magazineModel = [ZXMagazineModel modelWithDictionary:subDic];
        [array addObject:magazineModel];
    }
    
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
    ZXMagazineCell *cell = [ZXMagazineCell cellWithTableView:tableView];
    cell.magazineModel = _datas_array[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110;
}


#pragma mark 页面跳转
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    ZXMagazineItemVC *magazineItem = [[ZXMagazineItemVC alloc]init];
    
    ZXMagazineModel *magazingModel = (ZXMagazineModel *)_datas_array[indexPath.row];
    magazineItem.mgid_string = magazingModel.id;
    magazineItem.vol_year_string = magazingModel.vol_year;
    
    [self.navigationController pushViewController:magazineItem animated:YES];
    ((ZXCustomTabBarVC *)self.tabBarController).customTabBar.hidden = YES;
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
    
    
    //---leftRefreshButton
    UIButton *refreshButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [refreshButton addTarget:self
                      action:@selector(refreshButtonClicked:)
            forControlEvents:UIControlEventTouchUpInside];
    
    UIImage *refreshImage = [UIImage imageNamed:@"切换_1"];
    [refreshButton setBackgroundImage:refreshImage forState:UIControlStateNormal];
    
    refreshButton.frame = CGRectMake(0,0, refreshImage.size.width, refreshImage.size.height);
    UIBarButtonItem *leftItemView = [[UIBarButtonItem alloc] initWithCustomView:refreshButton];
    self.navigationItem.leftBarButtonItem = leftItemView;
    
    
    //---rightSettingButton
    UIButton *settingButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [settingButton addTarget:self
                      action:@selector(settingButtonClicked:)
            forControlEvents:UIControlEventTouchUpInside];
    
    UIImage *settingImage = [UIImage imageNamed:@"设置_1"];
    [settingButton setBackgroundImage:settingImage forState:UIControlStateNormal];
    
    settingButton.frame = CGRectMake(0,0, settingImage.size.width, settingImage.size.height);
    UIBarButtonItem *rightItemCustomView = [[UIBarButtonItem alloc] initWithCustomView:settingButton];
    self.navigationItem.rightBarButtonItem = rightItemCustomView;
}

-(void)refreshButtonClicked:(UIButton *)button{
    NSLog(@"%s [LINE:%d] 点击刷新按钮", __func__, __LINE__);
}

-(void)settingButtonClicked:(UIButton *)button{
    NSLog(@"%s [LINE:%d] 点击设置按钮", __func__, __LINE__);
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    ((ZXCustomTabBarVC *)self.tabBarController).customTabBar.hidden = NO;
}


@end
