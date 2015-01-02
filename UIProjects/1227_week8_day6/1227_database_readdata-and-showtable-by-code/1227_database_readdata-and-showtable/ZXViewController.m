//
//  ZXViewController.m
//  1227_database_readdata-and-showtable
//
//  Created by zx on 12/27/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXViewController.h"
#import "ZXDatabase.h"
#import "ZXFirstLevelDataModel.h"
#import "ZXTableViewCell.h"

@interface ZXViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSMutableArray     *tableDataArray;
@end

@implementation ZXViewController
/**
 *  
 题目：将提供的数据库里面的first level表中的数据取出来，展示到tableView中
 要求：
 
 1.将取数据的过程通过单例实现
 2.要建立数据模型
 3.自定义cell（两种：纯代码，xib）
 */
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self laodUI];
}

-(void)laodUI{
    UITableView *tableView = [[UITableView alloc]init];
    tableView.frame = CGRectMake(0, 40, 320, 440);
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    tableView.tableFooterView = [[UIView alloc] init];
    //http://www.jianshu.com/p/50b63a221f09,除去间隔线条

}
-(NSMutableArray *)tableDataArray{
    if (_tableDataArray == nil) {
        ZXDatabase *zxSharedDB = [ZXDatabase shardInstance];
        //NSLog(@"%s [LINE:%d]%@", __func__, __LINE__,[zxSharedDB firstLevelTable_Marray]);
        _tableDataArray = [NSMutableArray arrayWithArray:[zxSharedDB firstLevelTable_Marray]];
    }
    return _tableDataArray;
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.tableDataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZXTableViewCell *cell = [ZXTableViewCell cellWithTableView:tableView];
    
    ZXFirstLevelDataModel *model = self.tableDataArray[indexPath.row];
    cell.firstLevelDataModel = model;
    
    return cell;
}




@end
