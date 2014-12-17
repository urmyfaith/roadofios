//
//  ZXHomePage1ViewController.m
//  01-UINavigationController的创建
//
//  Created by zx on 12/15/14.
//  Copyright (c) 2014 zhaokai. All rights reserved.
//

#import "ZXHomePage1ViewController.h"
#import "ZXHomePage2ViewController.h"

@interface ZXHomePage1ViewController ()

@end

@implementation ZXHomePage1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的主页:page1";
    self.view.backgroundColor = [UIColor grayColor];
    
    UIButton *next = [UIButton buttonWithType:UIButtonTypeSystem];
    next.frame = CGRectMake(100,150,120,40);
    next.backgroundColor = [UIColor whiteColor];
    [next setTitle:@"next" forState:UIControlStateNormal];
    [next.layer setMasksToBounds:YES];
    [next.layer setCornerRadius:10];
    [next addTarget:self
             action:@selector(nextController:)
   forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:next];
    
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)preController:(UIButton *)button{
    
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)nextController:(UIButton *)button{
    
    
    ZXHomePage2ViewController *page2 = [[ZXHomePage2ViewController alloc]init];
    [self.navigationController pushViewController:page2 animated:YES];
    
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
