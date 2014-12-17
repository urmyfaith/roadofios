//
//  ZXFourthViewController.m
//  1416_UITabBarController
//
//  Created by zx on 12/16/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXFourthViewController.h"
#import "ZXAllMethod.h"

@interface ZXFourthViewController ()

@end

@implementation ZXFourthViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    UILabel *pageLable = [UILabel labelWithFrame:CGRectMake(35,320,250,40)
                                        withText:@"this is the fourth page"
                                         withTag:101
                             withBackgroundColor:[UIColor whiteColor]];
    pageLable.textAlignment = NSTextAlignmentCenter;
    [pageLable.layer setMasksToBounds:YES];
    [pageLable.layer setCornerRadius:10];
    [self.view addSubview:pageLable];
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger isLoginedIn = [defaults integerForKey:@"isLoginedIn"];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    
    //没有登录==>通知去登录==>监听通知==>听到通知,创建页面.
    if (0 == isLoginedIn) {
        [button setTitle:@"请登录" forState:UIControlStateNormal];
         button.frame = CGRectMake(100, 100, 120, 40);
        [button addTarget:self action:@selector(intoLogin:) forControlEvents:UIControlEventTouchUpInside];

    }
    else
    {
        [button setTitle:@"已经登录,到下一个页面" forState:UIControlStateNormal];
        button.frame = CGRectMake(60, 100, 200, 40);
        [button addTarget:self action:@selector(nextPast:) forControlEvents:UIControlEventTouchUpInside];
    }
    button.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:button];
    // Do any additional setup after loading the view.
}
-(void)intoLogin:(UIButton *)button{
    
    //创建通知==>去登录.
    [[NSNotificationCenter defaultCenter] postNotificationName:@"createLogin" object:nil];
    
}
-(void)nextPast:(UIButton *)button{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
