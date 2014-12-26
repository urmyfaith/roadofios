//
//  ZXViewController.m
//  1226_resolveXML02_instance
//
//  Created by zx on 12/26/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//
#define MAIN_SHOP_URL @"http://mps.manzuo.com/mps/cate?sid=(null)&id=0&cc=%@&pt=%@&ffst=%d&mnt=%d&st=-1&hs=1"
#define SYSFONT [UIFont systemFontOfSize:12]

#import "ZXViewController.h"
#import "ZXHttpRequest.h"
#import "GDataXMLNode.h"
#import "ZXModel.h"
#import "MJRefresh.h"

@interface ZXViewController ()<UITableViewDataSource,UITableViewDelegate,MJRefreshBaseViewDelegate>
@property (nonatomic,strong) NSMutableArray     *datas;
@property (nonatomic,assign)           int      page;
@property (nonatomic,assign)           int      count;
@property (nonatomic,strong) ZXHttpRequest      *httpRequest;
@property (nonatomic,strong) UITableView        *tableView;
@property (nonatomic,strong) MJRefreshHeaderView    *refreshHeaderView;
@property (nonatomic,strong) MJRefreshFooterView    *refreshFooterView;

@end

@implementation ZXViewController

-(NSMutableArray *)datas{
    if (_datas == nil) {
        _datas = [NSMutableArray array];
    }
    return _datas;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
   
    //1.获取数据
    self.page = 1;
    self.count = 10;
    [self downlaodData];
    [self loadUI];
}

-(void)loadUI{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(10, 20, 300, 440)
                                                 style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.refreshHeaderView = [MJRefreshHeaderView header];
    self.refreshHeaderView.delegate = self;
    self.refreshHeaderView.scrollView = self.tableView;
    
    self.refreshFooterView = [MJRefreshFooterView footer];
    self.refreshFooterView.delegate = self;
    self.refreshFooterView.scrollView = self.tableView;
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.datas count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier] ;
    
    if (cell == nil) {
        cell = [[ UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:identifier];
        UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(10,5,150,20)];
        nameLabel.tag = 100;
        nameLabel.font = SYSFONT;
        [cell.contentView addSubview:nameLabel];
        
        UILabel *priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(10,CGRectGetMaxY(nameLabel.frame), 150, 20)];
        priceLabel.tag = 200;
        priceLabel.font = SYSFONT;
        [cell.contentView addSubview:priceLabel];
        
        UILabel *startLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(nameLabel.frame) +10,
                                                                       5+20,
                                                                       150,
                                                                       20)];
        startLabel.tag = 300;
        startLabel.font = SYSFONT;
        [cell.contentView addSubview:startLabel];
        
        
        UILabel *endLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(nameLabel.frame) +10,
                                                                     5,
                                                                     150,
                                                                     20)];
        endLabel.tag = 400;
        endLabel.font = SYSFONT;
        [cell.contentView addSubview:endLabel];
    }
    ZXModel *model =    self.datas[indexPath.row];
    
    UILabel *nameLabel = (UILabel *)[cell viewWithTag:100];
    nameLabel.text = model.myName;
    
    UILabel *priceLabel = (UILabel *)[cell viewWithTag:200];
    priceLabel.text = model.myPrice;
    
    UILabel *startLabel = (UILabel *)[cell viewWithTag:300];
    startLabel.text = model.myStartTime;
    
    UILabel *endLabel   = (UILabel *)[cell viewWithTag:400];
    endLabel.text = model.myEndTime;
    
    return cell;
}



#pragma mark MJRefreshBaseViewDelegate
-(void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView{
    if (refreshView == self.refreshHeaderView) {//pull-down-refresh
        self.page = 1;
        [self downlaodData];
    }
    else if (refreshView ==self.refreshFooterView){//pull-up-refresh
        self.page = self.page + 1;
        [self downlaodData];
    }
}

-(void)refreshViewEndRefreshing:(MJRefreshBaseView *)refreshView{

}

-(void)downlaodData{
    NSString *path      = [NSString stringWithFormat:MAIN_SHOP_URL,
                           @"beijing",
                           @"all",
                           self.page,
                           self.count];
    self.httpRequest    = [[ZXHttpRequest alloc]initWithPath:path
                                                      target:self andAction:@selector(downLoadDataFinished:)];
}
-(void)downLoadDataFinished:(ZXHttpRequest *)httpRequest{
    
#if 0
    NSString *string = [[NSString alloc]initWithData:httpRequest.downloadData
                                            encoding:NSUTF8StringEncoding];
    NSLog(@"%s [LINE:%d]string=%@", __func__, __LINE__,string);
#endif
    
    //当page == 1的时候,说明是下拉刷新
    if (self.page == 1) {
        [self.datas removeAllObjects];
    }
    
    GDataXMLDocument *doc= [[GDataXMLDocument alloc]initWithData:httpRequest.downloadData options:0 error:nil];
    NSArray *array = [doc nodesForXPath:@"//promotion" error:nil];
    
   //NSLog(@"%s [LINE:%d]array count =%i", __func__, __LINE__,[array count]);
   //NSLog(@"%s [LINE:%d]array ele type =%@", __func__, __LINE__,[array[0] class]);
    for (GDataXMLElement *ele in array) {
        ZXModel *model = [ZXModel modelWithGDataXMLElement:ele];
        [self.datas addObject:model];
    }
    NSLog(@"%s [LINE:%d] datas=%@", __func__, __LINE__,[self.datas[0] myName]);
    
    [self.refreshHeaderView endRefreshing];//结束刷新.
    [self.refreshFooterView endRefreshing];//结束刷新.
    
    [self.tableView reloadData];//重新加载表视图.
}
@end
