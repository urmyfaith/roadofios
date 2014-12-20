//
//  ZXMainViewController.m
//  1219_exercise_v1
//
//  Created by zx on 12/19/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXMainViewController.h"
#import "ZXCustomUITableView.h"

@interface ZXMainViewController ()
@end

@implementation ZXMainViewController
-(void)viewWillAppear:(BOOL)animated{
    NSNotificationCenter *center  = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(createDetailView:) name:@"createDetailView" object:nil];
    
}
-(void)createDetailView:(NSNotification *)notification{
    NSInteger rowNumber =[(((NSDictionary *)(notification.userInfo))[@"rowKey"])intValue];
    NSLog(@"%s [LINE:%d] indexPath = %i", __func__, __LINE__,rowNumber);
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
//  [self testZXCustomUITableView];
    [self loadTableView];
    
}


-(void)loadTableView{
    
    NSString *path =  [[NSBundle mainBundle] pathForResource:@"citys" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    
    NSMutableArray *cityNames = [NSMutableArray array];
    NSMutableArray *cityImages = [NSMutableArray array];
    NSMutableArray *cityDetails = [NSMutableArray array];
    for (NSInteger index = 0 ; index < [array count]; index++) {
        NSDictionary *eachCityDic = array[index];
        [cityNames addObject:eachCityDic[@"cityName"]];
        [cityImages addObject:eachCityDic[@"cityImage"]];
        [cityDetails addObject:eachCityDic[@"cityDetail"]];
    }
    ZXCustomUITableView *table = [[ZXCustomUITableView alloc]initWithFrame:CGRectMake(0,
                                                                                      20,
                                                                                      320,
                                                                                      self.view.frame.size.height - 20)
                                                                     style:UITableViewStylePlain];
    table.textLabel_Marray = [[NSMutableArray alloc]initWithArray:cityNames];
    table.images_MArray = [[NSMutableArray alloc]initWithArray:cityImages];
    table.subtitle_MArray = [[NSMutableArray alloc]initWithArray:cityDetails];
    [self.view addSubview:table];
}

/**
 *  测试自定义表格视图
 */
-(void)testZXCustomUITableView{
    ZXCustomUITableView *table = [[ZXCustomUITableView alloc]initWithFrame:CGRectMake(0,
                                                                                     20,
                                                                                     320,
                                                                                     self.view.frame.size.height - 20)
style:UITableViewStylePlain];

    table.textLabel_Marray      = [[NSMutableArray alloc]initWithObjects:@"北京市",@"广州市",@"深圳市",
                                   @"黑龙江省",@"湖北省",@"云南省",
                                   @"重庆市",@"广西省", nil];
    
    NSMutableArray *cityImages_MArray = [NSMutableArray array];
    for (NSInteger index = 0 ; index < [table.textLabel_Marray count]; index++) {
        NSString *cityImageNameString  =  [NSString stringWithFormat:@"image%i",index];
        UIImage *cityImage  = [UIImage imageNamed:cityImageNameString];
        [cityImages_MArray addObject:cityImage];
    }
    table.images_MArray = [[NSMutableArray alloc]initWithArray:cityImages_MArray];
    
    table.subtitle_MArray = [[NSMutableArray alloc]initWithObjects:
                             @"天津，简称津，是中华人民共和国直辖市、中国国家中心城市、新一线城市、中国北方经济中心、环渤海地区经济中心、中国北方国际航运中心、中国北方国际物流中心",
                             @"天津，简称津，是中华人民共和国直辖市、中国国家中心城市、新一线城市、中国北方经济中心、环渤海地区经济中心、中国北方国际航运中心、中国北方国际物流中心",
                             @"2014-12-20 10:10:41.617 1219_exercise_v1[1811:58681] row:0 = 0x7a7f1592",
                             @"2014-12-20 10:10:41.617 1219_exercise_v1[1811:58681] row:0 = 0x7a7f1593",
                             @"2014-12-20 10:10:41.617 1219_exercise_v1[1811:58681] row:0 = 0x7a7f1594",
                             @"2014-12-20 10:10:41.617 1219_exercise_v1[1811:58681] row:0 = 0x7a7f1595",
                             @"2014-12-20 10:10:41.617 1219_exercise_v1[1811:58681] row:0 = 0x7a7f1596",
                             @"2014-12-20 10:10:41.617 1219_exercise_v1[1811:58681] row:0 = 0x7a7f1597",
                             @"2014-12-20 10:10:41.617 1219_exercise_v1[1811:58681] row:0 = 0x7a7f1598",
                             nil];
    [self.view addSubview:table];
}
@end
