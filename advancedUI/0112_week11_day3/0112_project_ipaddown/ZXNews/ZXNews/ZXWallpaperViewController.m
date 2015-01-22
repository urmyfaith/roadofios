//
//  ZXWallpaperViewController.m
//  ZXNews
//
//  Created by zx on 1/12/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXWallpaperViewController.h"
#import "MJRefresh.h"
#import "ZXWallpaperModel.h"
#import "ZXWallPaperCell.h"
#import "ZXPictureModel.h"
#import "ZXDetailPictureVC.h"



#define WALLPAPER_URL @"http://api.ipadown.com/pic/pic.api.php?page=%i&count=%i&category=0&orderby=rand&device=iPhone"

@interface ZXWallpaperViewController ()<UITableViewDataSource,MJRefreshBaseViewDelegate,UITableViewDelegate>
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

@implementation ZXWallpaperViewController

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

    [self createTableView];
    
    self.urlType = @"all";
    self.page = 1;
    self.count  = 6;
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
    

    
    NSString *path = [NSString stringWithFormat:WALLPAPER_URL,self.page,self.count];
    
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
    
    ZXWallpaperModel *wallpaperModel = [ZXWallpaperModel modelWithArray:array];
    [self.datas addObject:wallpaperModel];
    
    //NSLog(@"%s [LINE=%i] self.datas =%@",__func__,__LINE__,self.datas);
        
    [self.tableView reloadData];
    NSLog(@"%s [LINE=%i] 刷表完成 ",__func__,__LINE__);
}


#pragma mark 表格视图
-(void)createTableView{
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, 320, 480)
                                                 style:UITableViewStylePlain];
    self.automaticallyAdjustsScrollViewInsets = NO;
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
    //NSLog(@"%s [LINE:%d][self.datas count]=%i", __func__, __LINE__,[self.datas count]);
    return [self.datas count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
 
    
    /**
     *  使用block,将点击事件中需要得到的值传递回来,然后进行处理
     *  传过来的是字符串,对字符串进行拆分,存入数组.
     */
#if 0
    ZXWallPaperCell *cell = [ZXWallPaperCell cellWithTableView:tableView];
   
#else
    ZXWallPaperCell *cell = [ZXWallPaperCell cellWithTableView:tableView andBlock:^(ZXPictureModel *pictureModel) {
  
        NSMutableArray *array = [NSMutableArray array];
        NSCharacterSet *set =  [NSCharacterSet characterSetWithCharactersInString:@",\""];
        for (NSString *str in [pictureModel.imgs componentsSeparatedByCharactersInSet:set]) {
            if ([str hasPrefix:@"http:"]) {
                [array addObject:str];
            }
        }
//        NSLog(@"%s [LINE:%d] array=%@", __func__, __LINE__,array);
        
        ZXDetailPictureVC *detailPicureVC  =  [[ZXDetailPictureVC alloc]init];
        detailPicureVC.pictures_array = array;
        [self.navigationController pushViewController:detailPicureVC animated:YES];
    }];
    
    
#endif
    
    cell.myModel = self.datas[indexPath.row];
    //NSLog(@"%s [LINE:%d]self.datas[indexPath.row]=%@", __func__, __LINE__,self.datas[indexPath.row]);
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 180*2+10;
}

-(void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView{
    if (refreshView == self.refreshFooterView) {
//        self.page +=1;
        self.count +=6;
    }
    if (refreshView == self.refreshHeaderView) {
        
//        self.page = 1;
        self.count = 6;
    }
    [self downloadData];
}




@end
