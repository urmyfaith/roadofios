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

    UITableView *_tableView;
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
    [self createNavigationBar];
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
}
@end
