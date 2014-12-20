//
//  ZXMainViewController.m
//  1219_exercise_v1
//
//  Created by zx on 12/19/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXMainViewController.h"
#import "ZXCustomUITableView.h"
#import "ZXDetailViewViewController.h"

#import "ZXTableData.h"

@interface ZXMainViewController ()
@property (nonatomic,strong)  ZXTableData *tableData;
@end

@implementation ZXMainViewController

-(void)viewWillAppear:(BOOL)animated{
    NSNotificationCenter *center  = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(createDetailView:) name:@"createDetailView" object:nil];
}
-(void)createDetailView:(NSNotification *)notification{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"createDetailView" object:nil];
    
    NSInteger rowNumber =[(((NSDictionary *)(notification.userInfo))[@"rowKey"])intValue];
  //  NSLog(@"%s [LINE:%d] indexPath = %i", __func__, __LINE__,rowNumber);
    
    ZXDetailViewViewController *detail =  [[ZXDetailViewViewController alloc]init];
    detail.cityName = self.tableData.cityNames[rowNumber];
    detail.cityImage = self.tableData.cityImages[rowNumber];
    detail.cityDetail = self.tableData.cityDetails[rowNumber];
    
    [self.navigationController pushViewController:detail animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadTableView];
    
}

-(void)loadTableView{
    
    self.tableData = [[ZXTableData alloc]init];
    
    [self.tableData loadTableDataWithFileName:@"citys" andFileType:@"plist"];
    ZXCustomUITableView *table = [[ZXCustomUITableView alloc]initWithFrame:CGRectMake(0,
                                                                                      0,
                                                                                      320,
                                                                                      self.view.frame.size.height)
                                                                     style:UITableViewStylePlain];
    table.textLabel_Marray = [[NSMutableArray alloc]initWithArray:self.tableData.cityNames];
    table.images_MArray = [[NSMutableArray alloc]initWithArray:self.tableData.cityImages];
    table.subtitle_MArray = [[NSMutableArray alloc]initWithArray:self.tableData.cityDetails];
    
    UIImageView *headerView = [[UIImageView alloc]initWithFrame:CGRectMake(0,0,300,100)];
    headerView.image = [UIImage imageNamed:@"table_head.png"];
    [table setTableHeaderView:headerView ];
    
    UIImage *backImage = [UIImage imageNamed:@"guide_bg.png"];
    UIImageView *backgroundView = [[UIImageView alloc]initWithImage:backImage];
    table.backgroundView = backgroundView;
    
    table.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    table.separatorColor = [UIColor grayColor];
    
    [self.view addSubview:table];
}

@end
