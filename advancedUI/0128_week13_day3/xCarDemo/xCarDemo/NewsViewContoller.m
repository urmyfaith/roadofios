//
//  NewsViewContoller.m
//  xCarDemo
//
//  Created by zx on 1/29/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "NewsViewContoller.h"

@interface NewsViewContoller ()

@end

@implementation NewsViewContoller
{
    UIView *_indexBarView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createNavigationBar];
    [self createIndexBar];
}

#pragma mark  创建导航条
-(void)createNavigationBar{
    [self createMyNavigationBarWithTitle:nil andLeftBtn:@[@"News_Details_Btn_Back.png"] andRightBtn:nil];
    UILabel *label = [[UILabel alloc]init];
    label.frame =CGRectMake(50, 20, 100, 44);
    label.text = @"咨讯";
    label.font = [UIFont systemFontOfSize:25];
    label.textColor = [UIColor whiteColor];
    [self.view addSubview:label];
}

-(void)buttonClick:(UIButton *)button{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark 创建索引条
-(void)createIndexBar{
    _indexBarView = [[UIView alloc]init];
    _indexBarView.frame = CGRectMake(0, 64, 320, 30);
    _indexBarView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:_indexBarView];
    
    NSArray *name = @[@"最新",@"新车",@"评测",@"导购",@"详情"];
    
}
@end
