//
//  ZXMainViewController.m
//  1224_exercies_custom-cell-by-code
//
//  Created by zx on 12/24/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXMainViewController.h"
#import "ZXTravelDataModel.h"
#import "ZXTableViewCell.h"

@interface ZXMainViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic, strong)NSMutableArray *travelsData_Marray;
@end

@implementation ZXMainViewController
-(NSMutableArray *)travelsData_Marray{
    if (_travelsData_Marray == nil) {
        _travelsData_Marray = [NSMutableArray array];
        
        NSString *plistFilePath = [[NSBundle mainBundle]pathForResource:@"data" ofType:@"plist"];
        
        NSArray *plistData_Array = [NSArray arrayWithContentsOfFile:plistFilePath];
        
        for (NSDictionary *eachTravelDataDic in plistData_Array) {
            ZXTravelDataModel *travelDataModel = [ZXTravelDataModel traveDataModleWithDictionary:eachTravelDataDic];
            [_travelsData_Marray addObject:travelDataModel];
        }
    }
    return _travelsData_Marray;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadTableView];
}
-(void)loadTableView{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(10, 20+30, 300, 480-50) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  [self.travelsData_Marray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    ZXTableViewCell *cell = [ZXTableViewCell cellWithTableView:tableView];
    cell.travelDataModel = self.travelsData_Marray[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

@end
