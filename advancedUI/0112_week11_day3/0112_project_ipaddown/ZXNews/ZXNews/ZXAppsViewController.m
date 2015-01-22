//
//  ZXAppsViewController.m
//  ZXNews
//
//  Created by zx on 1/12/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXAppsViewController.h"
#import "ZXAppsModel.h"
#import "ZXAppsCell.h"
#import "MJRefresh.h"
#import "ZXControl.h"
#import "ZXCategoryViewController.h"


#define APP_URL @"http://api.ipadown.com/iphone-client/apps.list.php?device=iPhone&t=commend&count=%i&page=%i&device=iPhone&price=%@"

@interface ZXAppsViewController ()<UITableViewDataSource,MJRefreshBaseViewDelegate,UITableViewDelegate>

//表视图数据
@property(nonatomic,strong)NSString *urlType;

@property(nonatomic, strong)NSMutableArray *datas;
@property(nonatomic, strong)UITableView *tableView;

//上拉刷新
@property (nonatomic,assign) int count;
@property (nonatomic,assign) int page;
@property (nonatomic,assign) int price;


@property(nonatomic,strong)MJRefreshFooterView *refreshFooterView;
@property(nonatomic,strong)MJRefreshHeaderView *refreshHeaderView;

@end

@implementation ZXAppsViewController

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
    self.title = @"ipadown应用";
    self.navigationController.navigationBar.backgroundColor = [UIColor blueColor];
    
    [self createTableView];
    
    [self createButton];
    
    self.urlType = @"all";
    self.page = 1;
    self.count  = 10;
    [self downloadData];
    

}
#pragma mark     分类按钮

-(void)createButton{
    

    
    UIButton *categoryButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [categoryButton setTitle:@"全部" forState: UIControlStateNormal];
    [categoryButton addTarget:self action:@selector(clickLeftItem:) forControlEvents:UIControlEventTouchUpInside];
    categoryButton.frame = CGRectMake(0,0, 60,40  );
    
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:categoryButton];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
}

-(void)clickLeftItem:(UIBarButtonItem *)item{
    
    NSLog(@"%s [LINE=%i] ",__func__,__LINE__);
    
    ZXCategoryViewController *categoryView = [[ZXCategoryViewController alloc] init];
    [self.navigationController pushViewController:categoryView animated:YES];
    
}

#pragma mark 数据下载

-(NSMutableArray *)datas{
    if (_datas == nil) {
        _datas = [NSMutableArray array];
    }
    return _datas;
}

-(void)downloadData{
    

    
    NSString *path = [NSString stringWithFormat:APP_URL,self.count,self.page,self.urlType];
    
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
        ZXAppsModel *model = [ZXAppsModel modelWithDic:subDic];
        
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
    ZXAppsCell *cell = [ZXAppsCell cellWithTableView:tableView];
    CGRect frame = cell.frame;
    frame.size.height = 100;
    cell.frame = frame;
    ZXAppsModel *model = self.datas[indexPath.row];
    cell.myModel = model;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
}

-(void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView{
    if (refreshView == self.refreshFooterView) {
        self.page +=1;
    }
    if (refreshView == self.refreshHeaderView) {

        self.page = 1;
    }
    [self downloadData];
}

#pragma mark 接收通知,更改分类

-(void)viewWillAppear:(BOOL)animated{
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    [center addObserver:self
               selector:@selector(doChanegPriceString:)
                   name:@"chanegPriceString"
                 object:nil];
}

-(void)doChanegPriceString:(NSNotification *)notification{
    NSString *name = notification.name;
    id obj = notification.object;
    NSDictionary *dic = notification.userInfo;
    NSLog(@"%s [LINE:%d] \n通知名称:%@ \n通知发布者:%@ \n通知的具体内容%@", __func__, __LINE__,name,obj,dic);
    self.urlType = dic[@"price"];
    [self downloadData];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
