//
//  ZXLoginViewController.m
//  1416_UITabBarController
//
//  Created by zx on 12/16/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXLoginViewController.h"

@interface ZXLoginViewController ()

@end

@implementation ZXLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeSystem];
    loginButton.frame= CGRectMake(100, 100, 120, 40);
    [loginButton setTitle:@"login" forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    loginButton.tag = 100;
    [loginButton.layer setMasksToBounds:YES];
    [loginButton.layer setCornerRadius:10];
    loginButton.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:loginButton];
    
    UIButton *tempUnLoginButton = [UIButton buttonWithType:UIButtonTypeSystem];
    tempUnLoginButton.frame= CGRectMake(100, 180, 120, 40);
    [tempUnLoginButton setTitle:@"tempUnLogin" forState:UIControlStateNormal];
    [tempUnLoginButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    tempUnLoginButton.tag = 200;
    tempUnLoginButton.backgroundColor = [UIColor whiteColor];
    [tempUnLoginButton.layer setMasksToBounds:YES];
    [tempUnLoginButton.layer setCornerRadius:10];
    [self.view addSubview:tempUnLoginButton];
}
-(void)buttonClicked:(UIButton *)button{
    //区别,没有登录
    //相同:页面跳转<===通知
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if (button.tag == 100) {
        //hand login here....判断用户名/密码
        [defaults setInteger:1 forKey:@"isLoginedIn"];
    }
    else{
        [defaults setInteger:0 forKey:@"isLoginedIn"];
    }
    
    //发布通知:让观察者去创建主界面
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"createmMainViewController" object :nil];
}

@end
