//
//  ZXMainViewController.m
//  1210_ UIViewController
//
//  Created by zx on 12/10/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "ZXMainViewController.h"
#import "ZXLoginViewController.h"
#import "ZXConfigViewController.h"

@interface ZXMainViewController ()

@end

@implementation ZXMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100,100,120,40)];
    label.text = @"the mian view";
    label.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:label];
   
    
    //返回到上一个视图
    UIButton *preView = [UIButton buttonWithType:UIButtonTypeSystem];
    preView.frame = CGRectMake(100, 150, 120, 40);
    preView.backgroundColor = [UIColor whiteColor];
    [preView.layer setMasksToBounds:YES];
    [preView.layer setCornerRadius:10];
    [preView setTitle:@"back" forState:UIControlStateNormal  ];
    [self.view addSubview:preView];
    
    [preView addTarget:self
                 action:@selector(backToLogin)
       forControlEvents:UIControlEventTouchUpInside];
    
    //到ConfigView
    UIButton *nextView = [UIButton buttonWithType:UIButtonTypeSystem];
    nextView.frame = CGRectMake(100,200, 120, 40);
    nextView.backgroundColor = [UIColor whiteColor];
    [nextView.layer setMasksToBounds:YES];
    [nextView.layer setCornerRadius:10];
    [nextView setTitle:@"next" forState:UIControlStateNormal  ];
    [self.view addSubview:nextView];
    
    [nextView addTarget:self
                action:@selector(jumpIntoConfigView)
      forControlEvents:UIControlEventTouchUpInside];
    
    // Do any additional setup after loading the view.
}

-(void)backToLogin{
    NSLog(@"do back to login view");
    /**
     *  退栈,返回到上一个界面.
     dismiss 与present要结合使用
     */
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)jumpIntoConfigView{
    NSLog(@"do jump into config view");
    
    
    ZXConfigViewController *configView = [[ZXConfigViewController alloc]init];
    configView.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    [self presentViewController:configView animated:YES completion:nil];
    
    
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
