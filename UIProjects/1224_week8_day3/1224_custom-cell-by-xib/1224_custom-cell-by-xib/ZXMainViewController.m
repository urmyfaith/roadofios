//
//  ZXMainViewController.m
//  1224_custom-cell-by-xib
//
//  Created by zx on 12/24/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXMainViewController.h"
#import "ZXBookDataModel.h"
#import "ZXTableViewCell.h"

@interface ZXMainViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic, strong)NSMutableArray *booksData_Marray;
@end

@implementation ZXMainViewController

-(NSMutableArray *)booksData_Marray{
    if (_booksData_Marray == nil) {
        _booksData_Marray = [NSMutableArray array];
        
        NSString *plistFilePath = [[NSBundle mainBundle]pathForResource:@"bookData" ofType:@"plist"];
    
        NSArray *plistData_Array = [NSArray arrayWithContentsOfFile:plistFilePath];
        
        for (NSDictionary *eachBookDic in plistData_Array) {
            ZXBookDataModel *bookDataModel = [ZXBookDataModel bookDataWithDictionary:eachBookDic];
            [_booksData_Marray addObject:bookDataModel];
        }
    }
    return _booksData_Marray;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self customizeNavigationBar];
    [self loadTableView];
}
-(void)customizeNavigationBar{
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    self.title = @"自定义";
}

-(void)loadTableView{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(10, 200, 300, 280) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  [self.booksData_Marray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZXTableViewCell *cell = [ZXTableViewCell cellWithTableView:tableView];
    cell.bookDataModel = self.booksData_Marray[indexPath.row];
    NSLog(@"%s [LINE:%d]row=%i %p", __func__, __LINE__,indexPath.row,cell);
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

@end
