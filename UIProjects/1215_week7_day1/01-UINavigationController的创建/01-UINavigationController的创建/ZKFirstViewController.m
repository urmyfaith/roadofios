//
//  ZKFirstViewController.m
//  01-UINavegationControllerDemo创建
//
//  Created by zx on 14-12-15.
//  Copyright (c) 2014年 zx. All rights reserved.
//

#import "ZKFirstViewController.h"
#import "ZKSecondViewController.h"
#import "ZXAllMethod.h"

@interface ZKFirstViewController ()

@end

@implementation ZKFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    
    UILabel *pageLable = [UILabel labelWithFrame:CGRectMake(35,400,250,40)
                                       withText:@"this is the first page"
                                        withTag:101
                            withBackgroundColor:[UIColor whiteColor]];
    pageLable.textAlignment = NSTextAlignmentCenter;
    [pageLable.layer setMasksToBounds:YES];
    [pageLable.layer setCornerRadius:10];
    [self.view addSubview:pageLable];
    
    
    
    UIButton *next = [UIButton buttonWithType:UIButtonTypeSystem];
    next.frame = CGRectMake(100,100,120,40);
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
    
    
#if 0
    //模态跳转
    ZKSecondViewController *second = [[ZKSecondViewController alloc]init];
    [self presentViewController:second animated:YES completion:nil];
#endif
    
    
#if 1
    //利用导航控制器跳转
    //解释: self.navigationController 就是本界面所在的导航控制器
    //pushViewController执行入栈操作
    ZKSecondViewController *second = [[ZKSecondViewController alloc]init];
    [self.navigationController pushViewController:second animated:YES];
#endif
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
