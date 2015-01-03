//
//  ZXViewController.m
//  1229_FactoryMethod_demo
//
//  Created by zx on 12/29/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXViewController.h"
#import "ZXView.h"

@interface ZXViewController ()

@end

@implementation ZXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    ZXView *view = [ZXView viewWithType:ZXViewTypeWithBlue];
    view.frame = CGRectMake(10, 40, 100, 100);
    [self.view addSubview:view];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
