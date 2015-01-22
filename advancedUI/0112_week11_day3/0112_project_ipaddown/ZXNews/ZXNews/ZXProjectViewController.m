//
//  ZXProjectViewController.m
//  ZXNews
//
//  Created by zx on 1/12/15.
//  Copyright (c) 2015 zx. All rights reserved.
//


/*
 #define Project @"http://api.ipadown.com/iphone-client/zt.list.php?parent_id=4118&count=10&page=1"
 
 重要参数解释
 count表示每页的个数
 page表示下载第几页
 
 #define ProjectDetail @"http://api.ipadown.com/iphone-client/zt.detail.php?id=10”
 重要参数解释
 id=10表示获取id为10个应用的详细信息
 */

#define PROJECT_URL @"http://api.ipadown.com/iphone-client/zt.list.php?parent_id=4118&count=%i&page=%i"

#import "ZXProjectViewController.h"
#import "MJRefresh.h"
#import "ZXProjectModel.h"
#import "ZXProjetCell.h"

@interface ZXProjectViewController ()<UITableViewDataSource,MJRefreshBaseViewDelegate,UITableViewDelegate>
//表视图数据
@property(nonatomic,strong)NSString *urlType;

@property(nonatomic, strong)NSMutableArray *datas;
@property(nonatomic, strong)UITableView *tableView;

//上拉刷新
@property (nonatomic,assign) int count;
@property (nonatomic,assign) int page;

@property(nonatomic,strong)MJRefreshFooterView *refreshFooterView;
@property(nonatomic,strong)MJRefreshHeaderView *refreshHeaderView;

@end

@implementation ZXProjectViewController

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
    self.title = @"ipadown专题";
    self.navigationController.navigationBar.backgroundColor = [UIColor blueColor];
    [self createTableView];
    [self downloadData];
    
}
#pragma mark 数据下载

-(NSMutableArray *)datas{
    if (_datas == nil) {
        _datas = [NSMutableArray array];
    }
    return _datas;
}

-(void)downloadData{
    
    self.urlType = @"all";
    self.page = 1;
    self.count  = 10;
    
    NSString *path = [NSString stringWithFormat:PROJECT_URL,self.count,self.page];
    
    NSLog(@"%s [LINE=%i] path=%@",__func__,__LINE__,path);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer  = [AFHTTPResponseSerializer serializer];
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (self.page == 1) {
            [self.datas removeAllObjects];
        }
        NSLog(@"%s [LINE=%i] 下载数据完成",__func__,__LINE__);
        [self analyJSON:responseObject];//解析数据
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%s [LINE=%i] 下载数据失败",__func__,__LINE__);
    }];
    
    //结束刷新
    [self.refreshHeaderView endRefreshing];
    [self.refreshFooterView endRefreshing];
    
}

-(void)analyJSON:(NSData *)data{
    
    NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    for (NSDictionary *subDic in array) {
        ZXProjectModel *model = [ZXProjectModel modelWithDic:subDic];
        
        [self.datas addObject:model];
    }
    [self.tableView reloadData];
    NSLog(@"%s [LINE=%i] 刷表完成 ",__func__,__LINE__);
}

#pragma mark 表格视图
-(void)createTableView{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, 320, 480)
                                                 style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.refreshHeaderView = [MJRefreshHeaderView header];
    self.refreshHeaderView.delegate = self;
    self.refreshHeaderView.scrollView = self.tableView;
    
    self.refreshFooterView = [MJRefreshFooterView footer];
    self.refreshFooterView.delegate = self;
    self.refreshFooterView.scrollView = self.tableView;
    
    [self.view addSubview:self.tableView];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.datas count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZXProjetCell *cell = [ZXProjetCell cellWithTableView:tableView];
    ZXProjectModel *model = self.datas[indexPath.row];
    cell.myModel = model;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 120;
}

-(void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView{
    if (refreshView == self.refreshFooterView) {
        self.page += 1;
    }
    if (refreshView == self.refreshHeaderView) {
        
        self.page = 1;
    }
    [self downloadData];
}



@end
