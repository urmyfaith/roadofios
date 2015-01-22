//
//  ZXNewsViewController.m
//  ZXNews
//
//  Created by zx on 1/12/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXNewsViewController.h"
#import "ZXControl.h"
#import "ZXNewsModel.h"
#import "ZXNewsCell.h"

#import "MJRefresh.h"

@interface ZXNewsViewController ()<UIScrollViewDelegate,UITableViewDataSource,MJRefreshBaseViewDelegate,UITableViewDelegate>

//滚动视图的数据
@property(nonatomic,strong)NSArray *categoryName_Array;

@property(nonatomic,strong) NSArray *categoryID_Array;

@property (nonatomic,strong)     UIPageControl *pageControl;

//表视图数据
@property(nonatomic, strong)NSMutableArray *datas;
@property(nonatomic, strong)UITableView *tableView;

//上拉刷新
@property (nonatomic,assign) int currentPage;
@property (nonatomic,assign) int page;
@property (nonatomic,copy) NSString *category_id;

@property(nonatomic,strong)MJRefreshFooterView *refreshFooterView;
@property(nonatomic,strong)MJRefreshHeaderView *refreshHeaderView;

@end

@implementation ZXNewsViewController

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
    self.title = @"ipadown新闻";
    self.navigationController.navigationBar.backgroundColor = [UIColor blueColor];
    [self createSrollView];
    [self createTableView];
    
    //下载数据前,赋值: 初值
    self.category_id = [NSString stringWithFormat:@"0"];
    self.currentPage = 1;
    self.page = 10;
    [self downloadData];
}

#pragma mark 表格视图
-(void)createTableView{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64+44, 320, 480-64-44)
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
    ZXNewsCell *cell = [ZXNewsCell cellWithTableView:tableView];
    CGRect frame = cell.frame;
    frame.size.height = 100;
    cell.frame = frame;
    ZXNewsModel *model = self.datas[indexPath.row];
    cell.myModel = model;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 100;
}


#pragma mark 数据下载

-(NSMutableArray *)datas{
    if (_datas == nil) {
        _datas = [NSMutableArray array];
    }
    return _datas;
}

-(void)downloadData{
    

    NSLog(@"%s [LINE=%i] self.page=%i ",__func__,__LINE__,self.page);
    NSString *path = [NSString
                      stringWithFormat:@"http://api.ipadown.com/apple-news-client/news.list.php?category_ids=%@&max_id=0&count=%d",
                      self.category_id ,
                      self.page];
    NSLog(@"%s [LINE=%i] path=%@",__func__,__LINE__,path);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer  = [AFHTTPResponseSerializer serializer];
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
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
    if ([self.datas count] > 0) {
        [self.datas removeAllObjects];
    }
    for (NSDictionary *subDic in array) {
        ZXNewsModel *model = [ZXNewsModel modelWithDic:subDic];
        
        [self.datas addObject:model];
    }
    [self performSelectorOnMainThread:@selector(myReloadTable) withObject:nil waitUntilDone:NO];
    
}

-(void)myReloadTable{
    [self.tableView reloadData];
    NSLog(@"%s [LINE=%i] 刷表完成 ",__func__,__LINE__);
}

-(void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView{
    if (refreshView == self.refreshFooterView) {
        self.page +=10;
    }
    if (refreshView == self.refreshHeaderView) {

            [self.datas removeAllObjects];

        self.page = 10;
    }
    [self downloadData];
}





#pragma mark  滚动视图

-(NSArray *)categoryID_Array{
    if (_categoryID_Array == nil) {
        _categoryID_Array = @[@"0”,@“9999",@"1",
                              @"10",@"11",@"1967",
                              @"4",@"43",@"2634",
                              @"3",@"8",@"6",
                              @"5",@"230",@"7",
                              @"12"];
    }
    return _categoryID_Array;
}
-(NSArray *)categoryName_Array{
    if (_categoryName_Array == nil) {
        _categoryName_Array = @[@"全部", @"头条",@"快讯",
                                @"视频",@"游戏", @"应用",
                                @"业界", @"库克",@"乔布斯",
                                @"炫配",@"活动",@"ipone应用技巧",
                                @"iPad技巧",@"Mac技巧",@"appStore技巧",
                                @"iTunes技巧"];
    }
    return _categoryName_Array;
}

-(void)createSrollView{
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    int count = [self.categoryName_Array count];
    
    
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    [self.view addSubview:scrollView];
    CGFloat height = 45;
    CGFloat buttonWidth = 60;
    CGFloat gap = 5;
    scrollView.frame = CGRectMake(0,64, 320, height+20);
    for (int i = 0 ; i < count; i++) {
        double x = i*60;
        //double y = gap;
        myButton *button = [myButton buttonWithFrame:CGRectMake(x, 5, buttonWidth, height-gap)
                                                font:14 title:self.categoryName_Array[i]
                                                type:UIButtonTypeCustom
                                     backgroundImage:nil
                                               image:nil
                                            andBlock:^(myButton *button) {
            NSLog(@"%s [LINE=%i] button.tag=%i ",__func__,__LINE__,button.tag);

            self.category_id = [NSString stringWithFormat:@"%i",[self.categoryID_Array[button.tag- 100] intValue]];
            NSLog(@"%s [LINE=%i]self.category_id=%@ ",__func__,__LINE__,self.category_id);
           
          
              [self downloadData];
               [self.tableView reloadData];
                                                
        }];
        
        button.clipsToBounds = YES;
        [button.layer setCornerRadius:10];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
        button.tag = (int)(i+100);
        [scrollView addSubview:button];
        
    }
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.contentSize = CGSizeMake(count*60+1,0);


}



@end
