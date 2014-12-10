//
//  ZXConfigViewController.m
//  1210_UIViewController_travel
//
//  Created by zx on 12/10/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "ZXConfigViewController.h"
#import "ZXAllMethod.h"
#import "ZXLoginViewController.h"
#import "ZXMainViewController.h"

@interface ZXConfigViewController ()

@end

@implementation ZXConfigViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *configButton = [UIButton buttonWithFrame:CGRectMake(10, 130, 300, 40)
                                             withTitle:@"更多设置"
                                              withType:UIButtonTypeSystem
                                            withTarget:self
                                            withMethod:nil];
    configButton.userInteractionEnabled = NO;
    [self.view addSubview:configButton];
    
    UIButton *backButton = [UIButton buttonWithFrame:CGRectMake(10, 180, 300, 40)
                                             withTitle:@"返回"
                                              withType:UIButtonTypeSystem
                                            withTarget:self
                                            withMethod:@selector(backToMain)];
    [self.view addSubview:backButton];
    
    UIButton *logoutButton = [UIButton buttonWithFrame:CGRectMake(10, 230, 300, 40)
                                           withTitle:@"注销"
                                            withType:UIButtonTypeSystem
                                          withTarget:self
                                          withMethod:@selector(backtoLogin)];
    [self.view addSubview:logoutButton];
}

-(void)backToMain{
     [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)backtoLogin{
     [self dismissViewControllerAnimated:YES completion:nil];
#if 0
     ZXLoginViewController *login = [[ ZXLoginViewController alloc]init];
    [ self presentViewController:login animated:YES completion:nil];
#endif
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
@end
