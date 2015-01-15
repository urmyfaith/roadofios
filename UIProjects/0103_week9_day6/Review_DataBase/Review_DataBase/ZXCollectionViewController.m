//
//  ZXCollectionViewController.m
//  Review_DataBase
//
//  Created by zx on 1/15/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXCollectionViewController.h"
#import "ZXMainCell.h"
#import "DataBase.h"
#import "MainArticleModel.h"


@interface ZXCollectionViewController ()

@end

@implementation ZXCollectionViewController
{
        UITableView *_tableView;
        NSMutableArray *_datas;
        DataBase *_db;
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
    self.title = @" 收藏页面";
    [self createEditButton];
    [self createTableView];
    [self loadDataFromDatabase];    
}
-(void)createEditButton
{
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemTrash
                                                                              target:self
                                                                              action:@selector(editButtonClicked)];
    self.navigationItem.rightBarButtonItem = rightItem;
}


-(void)editButtonClicked{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
}

-(void)loadDataFromDatabase{
    if (_datas) {
        [_datas removeAllObjects];
    }
    _datas = [NSMutableArray array];
    _db = [DataBase shardInstance];
    for (NSDictionary  *dic in [_db selectALLFromCollectionsTable]) {
        MainArticleModel *model = [MainArticleModel modelWithDic:dic];
        [_datas addObject:model];
    }
    
    [_tableView reloadData];// 刷表
}

#pragma mark createTableView

-(void) createTableView{
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

#pragma mark

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_datas count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZXMainCell *cell = [ZXMainCell cellWithTableView:tableView];
    cell.articleModel = _datas[indexPath.row];
    
    return cell;
}

@end
