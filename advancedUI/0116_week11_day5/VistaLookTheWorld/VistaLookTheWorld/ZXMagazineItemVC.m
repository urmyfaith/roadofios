//
//  ZXMagazineItemVC.m
//  VistaLookTheWorld
//
//  Created by zx on 1/16/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXMagazineItemVC.h"
#import "ZXOuterModel.h"
#import "DownloadManager.h"
#import "ZXOuterCell.h"


@interface ZXMagazineItemVC ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ZXMagazineItemVC
{
    NSString *_url;
    UITableView *_tableView;
    NSArray *_datas_array;
    
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
   
    [self setNavigationBar];
    
    [self loadTableView];
    
    [self downloadData];
    
}



#pragma mark 创建表视图

-(void)loadTableView{
    _tableView = [[UITableView alloc]init];
    _tableView.frame = CGRectMake(0, 44, 320, 480-44-49);
    _tableView.dataSource = self;
    _tableView.delegate = self;

    [self.view addSubview:_tableView];
}

#pragma mark 表视图--数据源

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_datas_array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZXOuterCell *cell = [ZXOuterCell cellWithTableView:tableView andBlock:^(ZXOuterModel *outerModerl) {
        
        if ( [ ( (ZXOuterModel *) _datas_array[indexPath.row]
                ).innerModel_array count
             ] >0
           ) {
           outerModerl = _datas_array[indexPath.row];
        }
        return outerModerl;
    }];
    
    if ( [ ( (ZXOuterModel *) _datas_array[indexPath.row]
            ).innerModel_array count
          ] >0
        )
    {
        cell.outerModel = _datas_array[indexPath.row];
    }


    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ZXOuterModel *outerModel = _datas_array[indexPath.row];
    
    CGFloat lineBreak_height = [outerModel.innerModel_array count] > 1 ? 0: 2*([outerModel.innerModel_array count] -1);
    
    return 50+30*[outerModel.innerModel_array count] + lineBreak_height + 30;
}




#pragma mark 下载数据
-(void)downloadData{
    _url = [NSString stringWithFormat:MAGAZINE_DETAIL_URL,_mgid_string];
    
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(downloadFinish:)
                                                name:_url
                                              object:nil];
    
    [[DownloadManager sharedDownloadManager]addDownloadWithDownloadStr:_url andDownloadType:0];
}

#pragma mark 数据下载完成
-(void)downloadFinish:(NSNotification *)notification{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    NSData *data = [[DownloadManager sharedDownloadManager] getDataArrayWithDownloadStr:_url];
    _datas_array = [NSArray arrayWithArray:[self parseJSONWithData:data]];
    
    [_tableView reloadData];

}

#pragma mark 解析数据
-(NSArray *)parseJSONWithData:(NSData *)data{
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *subDic in [dic objectForKey:@"cats"]) {
        ZXOuterModel *outerModel = [ZXOuterModel modelWithDic:subDic];  
        [array addObject:outerModel];
    }
    
    return array;
}




#pragma mark  导航栏设置
-(void)setNavigationBar{
    //---backgroundImage
    if ([self.navigationController.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)] )
    {
        
        UIImage *image = [UIImage imageNamed:@"标题栏底.png"];
        [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    }
    self.navigationItem.title = [NSString stringWithFormat:@"第%@期",_vol_year_string];
 
    //---backButton
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [backButton addTarget:self
                      action:@selector(backButtonClicked)
            forControlEvents:UIControlEventTouchUpInside];
    
    UIImage *backImage = [UIImage imageNamed:@"返回_1"];
    [backButton setBackgroundImage:backImage forState:UIControlStateNormal];
    
    backButton.frame = CGRectMake(0,0, backImage.size.width, backImage.size.height);
    UIBarButtonItem *backItemView = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = backItemView;
    
}

-(void)backButtonClicked{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
