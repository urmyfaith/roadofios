//
//  ZXFirstViewController.m
//  1219_UItableView02_property
//
//  Created by zx on 12/19/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXFirstViewController.h"

@interface ZXFirstViewController ()

@end

@implementation ZXFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:button];
    
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
}
-(void)back{
    /**
     *  退栈,返回到上一个界面.
     dismiss 与present要结合使用
     */
    [self dismissViewControllerAnimated:YES completion:nil];
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
