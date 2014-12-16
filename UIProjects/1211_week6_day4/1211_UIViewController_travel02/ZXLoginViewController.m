//
//  ZXLoginViewController.m
//  1210_UIViewController_travel
//
//  Created by zx on 12/10/14.
//  Copyright (c) 2014 zx. All rights reserved.
//
#import "ZXMainViewController.h"
#import "ZXLoginViewController.h"
#import "ZXAllMethod.h"

@interface ZXLoginViewController ()

@end

@implementation ZXLoginViewController

/**
 *  login view:
            1. label :username
            2. button:login
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *userName = [UILabel labelWithFrame:CGRectMake(130,150,120,40)
                                       withText:@"乔布斯" withTag:100
                            withBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:userName];
    
    
    UIButton *nextView = [UIButton buttonWithFrame:CGRectMake(100, 250, 120, 40)
                                         withTitle:@"登录"
                                          withType:UIButtonTypeSystem
                                        withTarget:self
                                        withMethod:@selector(jumpIntoMain)];
    [self.view addSubview:nextView];
    
}

-(void)jumpIntoMain{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:1 forKey:@"mySignal"];
    
    ZXMainViewController *mainView = [[ZXMainViewController alloc]init];
    mainView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    UILabel *lable4name = (UILabel *)[self.view viewWithTag:100];

    //    mainView.name = lable4name.text;
    
    NSString *userName = lable4name.text;
    
    [defaults setObject:userName forKey:@"userName"];
    
    [ self presentViewController:mainView animated:YES completion:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

@end
