//
//  ZXMoreViewController.m
//  ZXNews
//
//  Created by zx on 1/12/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXMoreViewController.h"
#import "ZXSettingModel.h"
#import "ZXSettingCell.h"

@interface ZXMoreViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic, strong)NSArray *datas;
@property(nonatomic, strong)UITableView *tableView;
@end

@implementation ZXMoreViewController

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
    [self createTableView];
    self.title = @"ipadown更多";
    self.navigationController.navigationBar.backgroundColor = [UIColor blueColor];
}

-(NSArray *)datas{
    if (_datas == nil) {
        _datas = @[@[
                        @{@"left":@"我收藏的 Apps",
                         @"right":@"",
                          },
                        @{
                           @"left":@"清空本地缓存",
                           @"right":@"一间清空"
                           },
                        @{
                           @"left":@"开启或关闭推送",
                          @"right":@"设置"
                           }
                        ],
                       @[@{@"left":@"软件名称",
                         @"right":@"爱新闻",
                         },
                       @{
                           @"left":@"软件作者",
                           @"right":@"花太香齐"
                           }]
        
];
        
    }
    return _datas;
}




#pragma mark 表格视图


-(void)createTableView{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,20, 320, 480)
                                                 style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.scrollEnabled = NO;
    [self.view addSubview:self.tableView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.datas count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *subArray= self.datas[section];
    return [subArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZXSettingCell *cell = [ZXSettingCell cellWithTableView:tableView];

    NSArray *subArray = self.datas[indexPath.section];
    ZXSettingModel *model = [ZXSettingModel modelWithDic:subArray[indexPath.row]];
    cell.myModel = model;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSArray *groupTitleArray = @[@"客户端设置",@"关于客户端"];
    return groupTitleArray[section];
}



@end
