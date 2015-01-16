//
//  ZXInfomationViewController.m
//  VistaLookTheWorld
//
//  Created by zx on 1/16/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXInfomationViewController.h"
#import "DownloadManager.h"
#import "ZXInfomationModel.h"
#import "ZXInfomationCell.h"

@interface ZXInfomationViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ZXInfomationViewController
{
    UITableView *_tableView;
    NSArray *_datas_array;
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
    
    [self loadTableView];
    [self downloadData];
    
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

}

#pragma mark 下载数据
-(void)downloadData{
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(downloadFinish:)
                                                name:INFORMATION_URL
                                              object:nil];

    [[DownloadManager sharedDownloadManager]addDownloadWithDownloadStr:INFORMATION_URL andDownloadType:0];
}

#pragma mark 数据下载完成
-(void)downloadFinish:(NSNotification *)notification{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    NSData *data = [[DownloadManager sharedDownloadManager] getDataArrayWithDownloadStr:INFORMATION_URL];
    _datas_array = [NSArray arrayWithArray:[self parseJSONWithData:data]];
    [_tableView reloadData];
}

#pragma mark 解析数据
-(NSArray *)parseJSONWithData:(NSData *)data{
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *subDic in [dic objectForKey:@"list"]) {
        ZXInfomationModel *infomationModel = [ZXInfomationModel modelWithDictionary:subDic];
        [array addObject:infomationModel];
    }
    
    return array;
}

#pragma mark 创建表视图

-(void)loadTableView{
    _tableView = [[UITableView alloc]init];
    _tableView.frame = self.view.bounds;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    UIImageView *backgourndImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"资讯背景底"]];
    _tableView.backgroundView = backgourndImageView;
    [self.view addSubview:_tableView];

}

#pragma mark 表视图--数据源

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_datas_array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZXInfomationCell *cell = [ZXInfomationCell cellWithTableView:tableView];
    cell.infomationModel = _datas_array[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 86;
}

@end
