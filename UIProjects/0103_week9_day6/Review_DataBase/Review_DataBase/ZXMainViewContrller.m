//
//  ZXMainViewContrller.m
//  Review_DataBase
//
//  Created by zx on 1/15/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXMainViewContrller.h"
#import "AFNetworking.h"
#import "DataBase.h"
#import "MainArticleModel.h"
#import "ZXMainCell.h"

@interface ZXMainViewContrller ()

@end

@implementation ZXMainViewContrller
{
    NSMutableArray *_datas;
    DataBase *_db;
    NSInteger _page;
    NSInteger _count;
    UITableView *_tableView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self settingNav];
    [self downloadData];
    NSLog(@"%s [LINE:%d] %@", __func__, __LINE__,NSHomeDirectory());
    _page = 1;
    _count = 10;
    
    [self createTableView];
}

#pragma mark -----导航条
-(void)settingNav{
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(loadNextPage)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(showBookedArticle)];
    self.navigationItem.rightBarButtonItem = rightItem;
}

-(void)loadNextPage{

    if ( 4 == _page) {
        _page = 1;
    }else{
        _page += 1;
    }
    [self readFromDatabase];
}

-(void)showBookedArticle{
   NSLog(@"%s [LINE:%d]", __func__, __LINE__);
}


#pragma mark 下载数据,存入数据库
-(void)downloadData{
    NSString *path = @"http://127.0.0.1/~zx/data.json" ;
//   NSString *path =@"http://ipad.jkb.com.cn/program/API/firstpaperpage";
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer  = [AFHTTPResponseSerializer serializer];
    
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%s [LINE:%d]", __func__, __LINE__);
        [self analyJSON:responseObject];//解析数据
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    }];
 
}

-(void)analyJSON:(NSData *)data{
    _db = [DataBase shardInstance];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSArray *array = dic[@"columns"];

    for (id item in array) {
        if ([item isKindOfClass:[NSDictionary class]]) {
            NSArray *subArray = item[@"articles"];
            for (NSDictionary *subSubDic in subArray) {
                
                NSString *id = subSubDic[@"id"];
                NSString *title = subSubDic[@"title"];
                NSString *insertTableSQL = [NSString stringWithFormat:@"insert into  articles(id,title) values(\"%@\",\"%@\")",id,title];
                NSLog(@"%s [LINE:%d] 插入数据库-->%i", __func__, __LINE__,[_db doUpdateTableWithSQL:insertTableSQL andType:sqlOperationTypeWithInsert]);
            }
        }
    }
    [self readFromDatabase];
   
}


#pragma mark 从数据库中读取数据,存入模型,存入数组,刷表
-(void)readFromDatabase{
    if (_datas) {
        [_datas removeAllObjects];
    }
    NSString *condition =[NSString stringWithFormat:@"where articleID > %i",(_page-1)*_count];
    NSArray *array =     [_db selectTableWithCondition:condition andLimit:_count];
    _datas = [NSMutableArray array];
    for (NSDictionary  *dic in array) {
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


