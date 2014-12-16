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
                                            withMethod:@selector(moreConfig)];
    //configButton.userInteractionEnabled = NO;
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
    
    UIButton *exitButton = [UIButton buttonWithFrame:CGRectMake(10, 280, 300, 40)
                                             withTitle:@"退出"
                                              withType:UIButtonTypeSystem
                                            withTarget:self
                                            withMethod:@selector(exitProgram)];
    [self.view addSubview:exitButton];
}

-(void)moreConfig{
    UIAlertView *alert =[ [UIAlertView alloc]initWithTitle:@"提示" message:@"待做的设置" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

-(void)exitProgram{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:0 forKey:@"mySignal"];
    [defaults setObject:nil forKey:@"userName"];
    exit(0);
}

-(void)backToMain{
     [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)backtoLogin{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:0 forKey:@"mySignal"];
    [defaults setObject:nil forKey:@"userName"];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
#if 0
    ZXMainViewController *mainView = [[ZXMainViewController alloc]init];
    [mainView dismissViewControllerAnimated:YES completion:nil];
    
     ZXLoginViewController *login = [[ ZXLoginViewController alloc]init];
    [ self presentViewController:login animated:YES completion:nil];
#endif
    
#if 0
    void(^mainBlack)(void) = ^(void){
        ZXMainViewController *mainView = [[ZXMainViewController alloc]init];
        [mainView dismissViewControllerAnimated:YES completion:nil];
    };
    [self dismissViewControllerAnimated:YES completion:mainBlack];
#endif
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
@end
