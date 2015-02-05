//
//  MainViewController.m
//  FashionShow
//
//  Created by zx on 15/2/3.
//  Copyright (c) 2015年 zx. All rights reserved.
//

#import "MainViewController.h"
#import "ZXTabBarVC.h"
#import "BaseViewController.h"
#import "MainTableViewCell.h"


@interface MainViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation MainViewController
{
    NSString *_urlIdentifier;
    
    NSArray *_tableViewDataSource_array;
    UITableView *_tabelView;
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
    [self createNavitaionbar];
    
    [self createTableView];
    [self downloadData];
}



#pragma mark 创建表视图
-(void)createTableView{
    _tabelView = [[UITableView alloc]initWithFrame:CGRectMake(0,
                                                              64,
                                                              self.view.frame.size.width,
                                                              self.view.frame.size.height)
                                             style:UITableViewStylePlain];
    _tabelView.delegate = self;
    _tabelView.dataSource = self;
    
    [self.view addSubview:_tabelView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_tableViewDataSource_array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MainTableViewCell *cell = [MainTableViewCell cellWithTableView:tableView];
    cell.mainCell_Model = [_tableViewDataSource_array objectAtIndex:indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 85;
}


/*
 尺寸:
 首行cell
    高度145
    数字图片宽度65
 
 其他行
    高度85
    图片150w*85h
 320-64-150= 106 剩余
 gapW = 8???
 gapH = 5;
 
 */




#pragma mark 下载数据
-(void)downloadData{
    
    NSString *postData_string = @"action=home&sa=Main&offset=0&count=20&uid=11111111&platform=a&mobile=HUAWEI+P6-C00&pid=10129&e=a2ae6a1b2c1a6aa2faa07bf2bd57ab37";
    _urlIdentifier= [NSString stringWithFormat:@"%@%@",zxAPI_FULLPATH,postData_string];
    
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(mainPage_downloadFinish)
                                                name:_urlIdentifier
                                              object:nil];
    [[DownloadManager sharedDownloadManager] addDownloadWithDownloadURL:zxAPI_FULLPATH andDownloadResqustMethod:@"POST"andPostDataString:postData_string];
}

-(void)mainPage_downloadFinish{
     _tableViewDataSource_array = [JSON2Model JSONData2ModelWithURLIdentifier:_urlIdentifier andDataType:zxJSON_DATATYPE_GENERIC];
    [_tabelView reloadData];
}

#pragma mark 绘制顶部导航栏
//重写root的创建导航栏的方法
-(void)createNavitaionbar{
    
    [self createRootNavigaitonBarWithTitleImag:@"logo"
                                  andIsTop:YES
                              andTitleName:nil
                        andBackgroundImage:nil
                      andLeftBtnImagesName:nil
                     andRightBtnImagesName:@"栏目_1"
                                  andClass:self
                                    andSEL:@selector(navigationBarClicked:)];
}

-(void)navigationBarClicked:(UIButton *)button{
    if (button.tag == zxNavigaionBarButtonRightTag) {
        
#if 1
        ZXTabBarVC *tvc = [ZXTabBarVC sharedZXTabBarViewController];
        
        //模态跳转
        tvc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        [self presentViewController:tvc animated:YES completion:^{
            NSLog(@"%s [LINE:%d] 从主页==>tabBar视图", __func__, __LINE__);
        }];

        
#else
        BaseViewController *bvc = [[BaseViewController alloc]init];
        
        StarViewController *svc = [[StarViewController alloc]init];
        
//        UINavigationController *nav =[[ UINavigationController alloc]initWithRootViewController:bvc];
//        nav.navigationBar.hidden = YES;
//        [self presentViewController:nav animated:YES completion:nil];
        
        [self.navigationController pushViewController:svc animated:YES];
        
#endif
        
    }
}

@end
