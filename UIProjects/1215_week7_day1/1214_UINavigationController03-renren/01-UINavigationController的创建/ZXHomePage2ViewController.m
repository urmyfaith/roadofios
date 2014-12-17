//
//  ZXHomePage2ViewController.m
//  01-UINavigationController的创建
//
//  Created by zx on 12/15/14.
//  Copyright (c) 2014 zhaokai. All rights reserved.
//

#import "ZXHomePage2ViewController.h"
#import "ZXHomePage3ViewController.h"

@interface ZXHomePage2ViewController ()

@end

@implementation ZXHomePage2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的主页:page2";
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
    
    
    UIButton *jump2HomeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    jump2HomeButton.frame = CGRectMake(100,200,120,40);
    jump2HomeButton.backgroundColor = [UIColor whiteColor];
    [jump2HomeButton setTitle:@"jump2Home" forState:UIControlStateNormal];
    [jump2HomeButton.layer setMasksToBounds:YES];
    [jump2HomeButton.layer setCornerRadius:10];
    [jump2HomeButton addTarget:self
            action:@selector(jump2HomeButton)
  forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:jump2HomeButton];
    
    UIButton *jump2MainButton = [UIButton buttonWithType:UIButtonTypeSystem];
    jump2MainButton.frame = CGRectMake(100,250,120,40);
    jump2MainButton.backgroundColor = [UIColor whiteColor];
    [jump2MainButton setTitle:@"jump2Main" forState:UIControlStateNormal];
    [jump2MainButton.layer setMasksToBounds:YES];
    [jump2MainButton.layer setCornerRadius:10];
    [jump2MainButton addTarget:self
                        action:@selector(jump2MainButton)
              forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:jump2MainButton];
    
}
-(void)jump2HomeButton{
    
    NSArray *array = self.navigationController.viewControllers;
    [self.navigationController popToViewController:array[1] animated:YES];
}
-(void)jump2MainButton{
    
    NSArray *array = self.navigationController.viewControllers;
    [self.navigationController popToViewController:array[0] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)preController:(UIButton *)button{
    
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)nextController:(UIButton *)button{
    
    
    ZXHomePage3ViewController *page3 = [[ZXHomePage3ViewController alloc]init];
    [self.navigationController pushViewController:page3 animated:YES];
    
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
