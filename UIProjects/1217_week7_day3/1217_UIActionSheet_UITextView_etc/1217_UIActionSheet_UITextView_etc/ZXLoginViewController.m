//
//  ZXLoginViewController.m
//  1217_UIActionSheet_UITextView_etc
//
//  Created by zx on 12/17/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXLoginViewController.h"
#import "ZXAllMethod.h"

@interface ZXLoginViewController ()

@end

@implementation ZXLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    
    UIButton *loginButton  = [UIButton buttonWithFrame:CGRectMake(100,100,120,40)
                                        withTitle:@"登录"
                                         withType:UIButtonTypeSystem
                                       withTarget:self
                                       withMethod:@selector(loginButtonClicked:)];
    [self.view addSubview:loginButton];
    
    UIButton *tempUnLoginButton  = [UIButton buttonWithFrame:CGRectMake(100,200,120,40)
                                             withTitle:@"暂不登录"
                                              withType:UIButtonTypeSystem
                                            withTarget:self
                                            withMethod:@selector(tempUnLoginButtonClicked:)];
    [self.view addSubview:tempUnLoginButton];
}
-(void)loginButtonClicked:(UIButton *)button{
    //do login logic here.
    if (1) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setInteger:1 forKey:@"isLogedIn"];
        
        NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
        [center postNotificationName:@"createMainViewController" object:self];
    }
    else
    {
        NSLog(@"%s [LINE:%d] loginFailed.", __func__, __LINE__);
    }
}

-(void)tempUnLoginButtonClicked:(UIButton *)button{
     NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
     [center postNotificationName:@"createMainViewController" object:self];
}
@end
