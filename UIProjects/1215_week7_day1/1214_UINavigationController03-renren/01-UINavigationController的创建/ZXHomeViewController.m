//
//  ZXHomeViewController.m
//  01-UINavigationController的创建
//
//  Created by zx on 12/15/14.
//  Copyright (c) 2014 zhaokai. All rights reserved.
//

#import "ZXHomeViewController.h"
#import "ZXAllMethod.h"
#import "ZXHomePage1ViewController.h"

@interface ZXHomeViewController ()

@end

@implementation ZXHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的主页";
 
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
}

-(void)nextController:(UIButton *)button{
    
    
    ZXHomePage1ViewController *page1 = [[ZXHomePage1ViewController alloc]init];
    [self.navigationController pushViewController:page1 animated:YES];
    
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
