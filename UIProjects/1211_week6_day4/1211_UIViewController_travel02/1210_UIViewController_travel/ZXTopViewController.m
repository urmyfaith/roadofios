//
//  ZXTopViewController.m
//  1210_UIViewController_travel
//
//  Created by zx on 12/11/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "ZXTopViewController.h"
#import "ZXLoginViewController.h"
#import "ZXMainViewController.h"

@interface ZXTopViewController ()

@end

@implementation ZXTopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
}


-(void)viewWillAppear:(BOOL)animated{

     NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
     NSInteger  signal = [defaults integerForKey:@"mySignal"];

     if ( signal == 0) {
         NSLog(@"%s [LINE:%d]", __func__, __LINE__);
         ZXLoginViewController *login = [[ ZXLoginViewController alloc]init];
         [self addChildViewController:login];
         [ self presentViewController:login animated:YES completion:nil];
     }
     else{
         NSLog(@"%s [LINE:%d]", __func__, __LINE__);
         ZXMainViewController *main = [[ZXMainViewController alloc]init];
         [self addChildViewController:main];
         [ self presentViewController:main animated:YES completion:nil];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}
@end
