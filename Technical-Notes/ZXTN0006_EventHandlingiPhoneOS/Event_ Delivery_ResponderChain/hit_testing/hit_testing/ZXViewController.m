//
//  ZXViewController.m
//  hit_testing
//
//  Created by zx on 1/30/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXViewController.h"
#import "CustomView.h"

@interface ZXViewController ()

@end

@implementation ZXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    CustomView *cv = [[CustomView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:cv];

}

@end
