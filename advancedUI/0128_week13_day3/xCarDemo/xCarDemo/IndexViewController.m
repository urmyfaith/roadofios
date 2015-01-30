//
//  IndexViewController.m
//  xCarDemo
//
//  Created by zx on 1/28/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "IndexViewController.h"
#import "MenuViewController.h"
#import "PPRevealSideViewController.h"
#import "FocusListItem.h"
#import "UIImageView+WebCache.h"
#import "InfoViewController.h"
#import "NewsViewContoller.h"


@interface IndexViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

@end

@implementation IndexViewController
{

    UITableView     *_tableView;
    NSMutableArray  *_cellImagesArray;
    UIScrollView    *_focusScrollView;
    UILabel         *_focusLabel;
    NSMutableArray  *_focusListItemsArray;
    
    int _currentIndex;
    NSMutableArray  *_focusImagesArray;
    
    //小白点
    UIView *_focusPageView;
    
    
    //数组-->装载cell对应的视图控制器的名称.
    NSMutableArray *_cellNamesArray;
}

- (void)viewDidLoad
{
    //实例化表要的对象
    _cellImagesArray = [[NSMutableArray alloc ]init];
    _cellNamesArray = [[NSMutableArray alloc]init];
    
    [_cellNamesArray addObject:@"NewsViewContoller"];
    [_cellNamesArray addObject:@"NewsViewContoller"];
    [_cellNamesArray addObject:@"NewsViewContoller"];
    [_cellNamesArray addObject:@"NewsViewContoller"];
    [_cellNamesArray addObject:@"NewsViewContoller"];

    [_cellImagesArray addObject:[UIImage imageNamed:@"Index_MenuBar_News.png"]];
    [_cellImagesArray addObject:[UIImage imageNamed:@"Index_MenuBar_Search.png"]];
    [_cellImagesArray addObject:[UIImage imageNamed:@"Index_MenuBar_Car.png"]];
    [_cellImagesArray addObject:[UIImage imageNamed:@"Index_MenuBar_Forum.png"]];
    [_cellImagesArray addObject:[UIImage imageNamed:@"Index_MenuBar_Activity.png"]];
    [_cellImagesArray addObject:[UIImage imageNamed:@"Index_Logo.png"]];
    
    [super viewDidLoad];
    [self createNavigationBar];

    
    NSString *hasCaches = [[NSUserDefaults standardUserDefaults] objectForKey:@"hasCaches"];
    
    if ([hasCaches isEqualToString:@"YES"]) {
        //从数据库取数据
        _focusListItemsArray = [[NSMutableArray alloc]initWithArray:[[DataBase sharedDateBase]selectFocusItem]];
        [self createTableView];
        [self createTableViewHeaderView];
        [self loadFocusScoreViewImages];
        [_tableView reloadData];
        NSLog(@"%s [LINE:%d] 本次从数据库读取数据", __func__, __LINE__);
    }
    else{
        //从网络获取数据
        
        //下载数据
        [[NSNotificationCenter  defaultCenter] addObserver:self
                                                  selector:@selector(downloadFinish)
                                                      name:kFOUCS_LIST_URL
                                                    object:nil];
        [[DownloadManager sharedDownloadManager] addDownloadWithDownloadStr:kFOUCS_LIST_URL andDownloadType:cFOCUS_LIST_TYPE andItemIndex:nil];
        
        [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"hasCaches"];
         [self createTableView];
        NSLog(@"%s [LINE:%d] 从网络下载数据", __func__, __LINE__);
    }
}

#pragma mark 数据下载完成
-(void)downloadFinish{
    _focusListItemsArray = [[DownloadManager sharedDownloadManager]getDownloadDataWithDownloadStr:kFOUCS_LIST_URL];
    [self createTableViewHeaderView];
    [self loadFocusScoreViewImages];
    [_tableView reloadData];
}

#pragma mark 1.创建导航条
-(void)createNavigationBar{

    [self createMyNavigationBarWithTitle:@"Index_Title_logo.png"
                              andLeftBtn:@[@"Index_Btn_Setting.png"]
                             andRightBtn:@[@"Index_Head02.png"]];
}

#pragma mark 开关抽屉
//此方法为继承自父类.===>重写父类的方法
//自己的方法,父类的方法,协议的方法.
-(void)buttonClick:(UIButton *)button{
    if (button.tag == 1) {
        
        MenuViewController *mvc = [[MenuViewController alloc]init];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:mvc];
        [self.revealSideViewController pushViewController:nav onDirection:PPRevealSideDirectionLeft animated:YES];
    }
}


#pragma mark 2.创建表视图
-(void)createTableView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, 320, self.view.bounds.size.height-64)
                                             style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [_tableView setSeparatorColor:[UIColor clearColor]];
}

#pragma mark 3.表头视图
-(void)createTableViewHeaderView{
    UIView *baseView = [[UIView alloc]init];
    baseView.frame = CGRectMake(0, 0, 320, 568-64 - 51*6);
    _tableView.tableHeaderView = baseView;
    
    _focusScrollView = [[UIScrollView alloc]init];
    _focusScrollView.contentSize = CGSizeMake(320*3, baseView.frame.size.height/6*5);
    _focusScrollView.frame= CGRectMake(0, 0, 320, baseView.frame.size.height/6*5);
    
    _focusScrollView.pagingEnabled = YES;
    _focusScrollView.delegate = self;
    
    _focusScrollView.showsHorizontalScrollIndicator = NO;
    _focusScrollView.showsVerticalScrollIndicator = NO;

    //添加手势
    UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(focusScrollViewClick:)];
    [_focusScrollView addGestureRecognizer:tap];
    
    
    _currentIndex = 0;
    _focusImagesArray = [[NSMutableArray alloc]init];
    for (int i = 0 ; i <_focusListItemsArray.count ; i++) {
        FocusListItem *item = (FocusListItem *)_focusListItemsArray[i];
        [_focusImagesArray addObject:item.imgURL];
    }
    [self loadFocusScoreViewImages];
    
    [baseView addSubview:_focusScrollView];
    
    _focusLabel = [[UILabel alloc]init];
    _focusLabel.frame = CGRectMake(0, CGRectGetMaxY(_focusScrollView.frame), 320, baseView.frame.size.height - _focusScrollView.frame.size.height);
    _focusLabel.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.93f alpha:1.00f];
    _focusLabel.font = [UIFont systemFontOfSize:15];
    _focusLabel.textAlignment = NSTextAlignmentCenter;
    [baseView addSubview:_focusLabel];
    
    
    _focusPageView = [[UIView alloc]init];
#pragma mark ------todo-----#1    
    //News_Pic_Number01@2x.png
    //移动到下载完成去设置frame.
    _focusPageView.frame = CGRectMake(320-5- _focusListItemsArray.count*(7+3),
                                      _focusScrollView.frame.size.height-(10+7),
                                      _focusListItemsArray.count*(7+3),
                                      7);
    [baseView addSubview:_focusPageView];
    
}

#pragma mark 手势方法
-(void)focusScrollViewClick:(UITapGestureRecognizer *)tap{
    FocusListItem *fi = [_focusListItemsArray objectAtIndex:_currentIndex];
    InfoViewController *ivc = [[InfoViewController alloc]init];
    ivc.infoLink = fi.newsLink;
    [self.navigationController pushViewController:ivc animated:YES];
}

#pragma mark 绘制滚动视图
-(void)loadFocusScoreViewImages{
    
    for (id subView in _focusScrollView.subviews) {
        if ([subView isKindOfClass:[UIImageView class]]) {
            UIImageView *imageView = (UIImageView *)subView;
            [imageView removeFromSuperview];
        }
    }
    
    UIImageView *currentImageView   = [[UIImageView alloc]init];
    UIImageView *preImageView       = [[UIImageView alloc]init];
    UIImageView *nextImageView      = [[UIImageView alloc]init];
    
    CGFloat height_focusScrollView = _focusScrollView.frame.size.height;
    
    preImageView.frame          =  CGRectMake(-320, 0, 320, height_focusScrollView);
    currentImageView.frame      =  CGRectMake(0, 0, 320, height_focusScrollView);
    nextImageView.frame         =  CGRectMake(320, 0, 320, height_focusScrollView);
    
    [currentImageView setImageWithURL:[NSURL URLWithString:_focusImagesArray[_currentIndex]]
                     placeholderImage:[UIImage imageNamed:@"Other_Btn_Fresh"]];
    [preImageView setImageWithURL:[NSURL URLWithString:
                                   _focusImagesArray[_currentIndex-1 < 0 ? _focusImagesArray.count-1:_currentIndex-1]]
                 placeholderImage:[UIImage imageNamed:@"Other_Btn_Fresh"]];
    [nextImageView setImageWithURL:[NSURL URLWithString:
                                    _focusImagesArray[_currentIndex+1 <_focusImagesArray.count ? _currentIndex+1:0]]
                  placeholderImage:[UIImage imageNamed:@"Other_Btn_Fresh"]];
    
    [_focusScrollView addSubview:currentImageView];
    [_focusScrollView addSubview:preImageView];
    [_focusScrollView addSubview:nextImageView];
    
    //改变label
    _focusLabel.text = ((FocusListItem *)[_focusListItemsArray objectAtIndex:_currentIndex]).title;
    
    //改变focusPageView
    for (UIView *view in _focusPageView.subviews) {
        [view removeFromSuperview];
    }
    for (int i = 0 ; i < _focusListItemsArray.count; i++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.image =  i == _currentIndex ? [UIImage imageNamed:@"News_Pic_Number01"] : [UIImage imageNamed:@"News_Pic_Number02"];
        imageView.frame = CGRectMake(10*i, 0, 7, 7);
        [_focusPageView addSubview:imageView];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView == _focusScrollView) {

        int index = scrollView.contentOffset.x/320;
#pragma mark ------todo-----#2
        if (index == 0) {
            _currentIndex = _currentIndex - 1 < 0 ? _focusImagesArray.count - 1: _currentIndex - 1;
            [self loadFocusScoreViewImages];
            [scrollView setContentOffset:CGPointMake(0, 0)];
        }else
            if (index ==  1) {
                _currentIndex = _currentIndex+1 == _focusImagesArray.count ? 0: _currentIndex +1;
                [self loadFocusScoreViewImages];
                [scrollView setContentOffset:CGPointMake(0, 0)];
            }
            else
                NSLog(@"%s [LINE:%d] nochange", __func__, __LINE__);
    }
}

#pragma mark 表视图代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_cellImagesArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[_cellImagesArray objectAtIndex:indexPath.row]];
        imageView.frame = CGRectMake(0, 0, 320, 51);
        imageView.contentMode = UIViewContentModeCenter;
        imageView.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.93f alpha:1.00f];
        [cell.contentView addSubview:imageView];

        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *image = nil;
        if (indexPath.row == 1) {
            //麦克风
            image = [UIImage imageNamed:@"Index_Btn_Voice.png"];
        }
        if (indexPath.row == 2 || indexPath.row == 3) {
            //加号
            image = [UIImage imageNamed:@"Index_Btn_Add.png"];
        }
        btn.frame = CGRectMake(320-image.size.width, (51-image.size.height)/2, image.size.width, image.size.height);
        btn.tag = indexPath.row;
        [btn setImage:image forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(cellBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:btn];

    }
    return cell;
}

-(void)cellBtnClicked:(UIButton *)button{
    NSLog(@"%s [LINE:%d] button.tag=%ld", __func__, __LINE__,(long)button.tag);
}

///cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 51.f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    RootViewController *vc = [[NSClassFromString([_cellNamesArray objectAtIndex:indexPath.row]) alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
