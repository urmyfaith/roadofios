//
//  ZKSecondViewController.m
//  01-UINavegationControllerDemo创建
//
//  Created by zx on 14-12-15.
//  Copyright (c) 2014年 zx. All rights reserved.
//

#import "ZKSecondViewController.h"
#import "ZKThirdViewController.h"
#import "ZXAllMethod.h"


@interface ZKSecondViewController ()

@end

@implementation ZKSecondViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor grayColor];
    
    
    
    UILabel *pageLable = [UILabel labelWithFrame:CGRectMake(35,320,250,40)
                                        withText:@"this is the second page"
                                         withTag:101
                             withBackgroundColor:[UIColor whiteColor]];
    pageLable.textAlignment = NSTextAlignmentCenter;
    [pageLable.layer setMasksToBounds:YES];
    [pageLable.layer setCornerRadius:10];
    [self.view addSubview:pageLable];
    
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
    
     [self.navigationController.navigationBar setHidden:NO];
}


-(void)preController:(UIButton *)button{
    
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)nextController:(UIButton *)button{
    

    ZKThirdViewController *third = [[ZKThirdViewController alloc]init];
    [self.navigationController pushViewController:third animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
