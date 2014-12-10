//
//  ZXConfigViewController.m
//  1210_ UIViewController
//
//  Created by zx on 12/10/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "ZXConfigViewController.h"

@interface ZXConfigViewController ()

@end

@implementation ZXConfigViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor blackColor];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100,100,120,40)];
    label.text = @"config view";
    label.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:label];
    
    UIButton *preView = [UIButton buttonWithType:UIButtonTypeSystem];
    preView.frame = CGRectMake(100, 150, 120, 40);
    preView.backgroundColor = [UIColor whiteColor];
    [preView.layer setMasksToBounds:YES];
    [preView.layer setCornerRadius:10];
    [preView setTitle:@"back" forState:UIControlStateNormal  ];
    [self.view addSubview:preView];
    [preView addTarget:self
                action:@selector(backToMain)
      forControlEvents:UIControlEventTouchUpInside];
}


-(void)backToMain{
    NSLog(@"do back to login view");
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
