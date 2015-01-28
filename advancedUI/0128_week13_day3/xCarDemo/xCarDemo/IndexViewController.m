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


@interface IndexViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation IndexViewController
{

    UITableView     *_tableView;
    NSMutableArray  *_cellImagesArray;
    UIScrollView    *_focusScrollView;
    UILabel         *_focusLabel;
}

- (void)viewDidLoad
{
    //实例化表要的对象
    _cellImagesArray = [[NSMutableArray alloc ]init];
    [_cellImagesArray addObject:[UIImage imageNamed:@"Index_MenuBar_News.png"]];
    [_cellImagesArray addObject:[UIImage imageNamed:@"Index_MenuBar_Search.png"]];
    [_cellImagesArray addObject:[UIImage imageNamed:@"Index_MenuBar_Car.png"]];
    [_cellImagesArray addObject:[UIImage imageNamed:@"Index_MenuBar_Forum.png"]];
    [_cellImagesArray addObject:[UIImage imageNamed:@"Index_MenuBar_Activity.png"]];
    [_cellImagesArray addObject:[UIImage imageNamed:@"Index_Logo.png"]];
    
    [super viewDidLoad];
    [self createNavigationBar];
    [self createTableView];
    [self createTableViewHeaderView];
}

#pragma mark 1.创建导航条
-(void)createNavigationBar{
    MyNavigationBar *navigationBar  = [[MyNavigationBar alloc] init];
    navigationBar.frame  = CGRectMake(0, 20, 320, 44);
    [navigationBar createMyNavigaitonBarWithTitleImag:@"Index_Title_logo.png"
                                andLeftBtnImagesNames:@[@"Index_Btn_Setting.png"]
                               andRightBtnImagesNames:@[@"Index_Head02.png"]
                                             andClass:self
                                               andSEL:@selector(bbiClicked:)];
    [self.view addSubview:navigationBar];
}

#pragma mark 开关抽屉
-(void)bbiClicked:(UIButton *)bbi{
    if (bbi.tag == 1) {
    
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
    _focusScrollView.frame= CGRectMake(0, 0, 320, baseView.frame.size.height/6*5);
    [baseView addSubview:_focusScrollView];
    
    _focusLabel = [[UILabel alloc]init];
    _focusLabel.frame = CGRectMake(0, CGRectGetMaxY(_focusScrollView.frame), 320, baseView.frame.size.height - _focusScrollView.frame.size.height);
    _focusLabel.backgroundColor = [UIColor purpleColor];
    [baseView addSubview:_focusLabel];
    
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
    NSLog(@"%s [LINE:%d] button.tag=%d", __func__, __LINE__,button.tag);
}

///cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 51.f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%s [LINE:%d] %d", __func__, __LINE__,indexPath.row);
}

@end
