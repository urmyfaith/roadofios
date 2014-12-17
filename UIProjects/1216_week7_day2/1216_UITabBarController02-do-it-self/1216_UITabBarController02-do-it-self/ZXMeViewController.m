//
//  ZXMeViewController.m
//  1216_UITabBarController02-do-it-self
//
//  Created by zx on 12/16/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXMeViewController.h"
#import "ZXAllMethod.h"

@interface ZXMeViewController ()

@end

@implementation ZXMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *logoutButton = [UIButton buttonWithFrame:CGRectMake(100, 300, 140, 40)
                                             withTitle:@"注销登录"
                                              withType:UIButtonTypeSystem
                                            withTarget:self
                                            withMethod:@selector(logoutButoonClicked)];
    [self.view addSubview:logoutButton];
}

-(void)logoutButoonClicked{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:0 forKey:@"isLogedIn"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"createLoginView" object:nil];
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
