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


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createNavigationBar];
    
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

@end
