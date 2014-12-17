//
//  ZKFourthViewController.m
//  01-UINavegationControllerDemo创建
//
//  Created by zx on 14-12-15.
//  Copyright (c) 2014年 zx. All rights reserved.
//

#import "ZKFourthViewController.h"
#import "ZXAllMethod.h"
#import "ZKFifthViewController.h"

@interface ZKFourthViewController ()

@end

@implementation ZKFourthViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    UILabel *pageLable = [UILabel labelWithFrame:CGRectMake(35,320,250,40)
                                        withText:@"this is the fourh page"
                                         withTag:101
                             withBackgroundColor:[UIColor whiteColor]];
    pageLable.textAlignment = NSTextAlignmentCenter;
    [pageLable.layer setMasksToBounds:YES];
    [pageLable.layer setCornerRadius:10];
    [self.view addSubview:pageLable];
    
    
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
    
    UIButton *toAnyButton = [UIButton buttonWithType:UIButtonTypeSystem];
    toAnyButton.frame = CGRectMake(50,180,220,40);
    toAnyButton.backgroundColor = [UIColor whiteColor];
    [toAnyButton setTitle:@"jumpToPageSecond" forState:UIControlStateNormal];
    [toAnyButton.layer setMasksToBounds:YES];
    [toAnyButton.layer setCornerRadius:10];
    [toAnyButton addTarget:self
                      action:@selector(toAnyController:)
            forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:toAnyButton];
    
    
    UIButton *repalceButton = [UIButton buttonWithType:UIButtonTypeSystem];
    repalceButton.frame = CGRectMake(50,240,220,40);
    repalceButton.backgroundColor = [UIColor whiteColor];
    [repalceButton setTitle:@"repalcePageSecondWithFifth" forState:UIControlStateNormal];
    [repalceButton.layer setMasksToBounds:YES];
    [repalceButton.layer setCornerRadius:10];
    [repalceButton addTarget:self
             action:@selector(repalceController:)
   forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:repalceButton];
    
}

-(void)repalceController:(UIButton *)button{
    // 进行页面替换
    NSArray *array = self.navigationController.viewControllers;
    NSMutableArray *mutArray = [NSMutableArray arrayWithArray:array];
    
    
    //数组元素替换
    ZKFifthViewController *fifth = [[ZKFifthViewController alloc]init];
    [ mutArray replaceObjectAtIndex:1 withObject:fifth];
    self.navigationController.viewControllers = mutArray;
    
    //执行跳转
    [self.navigationController popToViewController:mutArray[1] animated:YES];
}

-(void)preController:(UIButton *)button{
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)toAnyController:(UIButton *)button{
   
    //在导航控制器里有一个数组,用来存储压栈厚点 各个视图控制器对象.
    NSArray *array = self.navigationController.viewControllers;
    
    [self.navigationController popToViewController:array[1] animated:YES];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
