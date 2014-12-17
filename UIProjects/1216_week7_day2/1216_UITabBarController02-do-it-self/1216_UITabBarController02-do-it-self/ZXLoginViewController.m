//
//  ZXLoginViewController.m
//  1216_UITabBarController02-do-it-self
//
//  Created by zx on 12/16/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXLoginViewController.h"
#import "ZXAllMethod.h"



@interface ZXLoginViewController ()

@end

@implementation ZXLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *loginButton = [UIButton buttonWithFrame:CGRectMake(100, 100, 140, 40)
                                            withTitle:@"登录"
                                             withType:UIButtonTypeSystem
                                           withTarget:self
                                           withMethod:@selector(loginButoonClicked)];
    [self.view addSubview:loginButton];
    
    UIButton *tempUnLoginButton = [UIButton buttonWithFrame:CGRectMake(100, 200, 140, 40)
                                            withTitle:@"暂不登录"
                                             withType:UIButtonTypeSystem
                                           withTarget:self
                                           withMethod:@selector(tempUnLoginButoonClicked)];
    [self.view addSubview:tempUnLoginButton];
    

}


-(void)loginButoonClicked{
    //do loginin here.
    if (1) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setInteger:1 forKey:@"isLogedIn"];
        //notify the observer to create page.
        [[NSNotificationCenter defaultCenter] postNotificationName:@"createMain" object:nil];
    }
    else{
        NSLog(@"login failed,check username and password.");
    }
}

-(void)tempUnLoginButoonClicked{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"createMain" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
