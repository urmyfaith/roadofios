//
//  ZXHomePage3ViewController.m
//  01-UINavigationController的创建
//
//  Created by zx on 12/15/14.
//  Copyright (c) 2014 zhaokai. All rights reserved.
//

#import "ZXHomePage3ViewController.h"

@interface ZXHomePage3ViewController ()

@end

@implementation ZXHomePage3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的主页:page3";
    self.view.backgroundColor = [UIColor grayColor];
    
    
    UIButton *pre = [UIButton buttonWithType:UIButtonTypeSystem];
    pre.frame = CGRectMake(100,100,120,40);
    pre.backgroundColor = [UIColor whiteColor];
    [pre setTitle:@"back" forState:UIControlStateNormal];
    [pre.layer setMasksToBounds:YES];
    [pre.layer setCornerRadius:10];
    [pre addTarget:self
            action:@selector(preController:)
  forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:pre];
}

-(void)preController:(UIButton *)button{
    
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
