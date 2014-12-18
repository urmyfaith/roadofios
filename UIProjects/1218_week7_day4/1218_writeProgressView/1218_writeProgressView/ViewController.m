//
//  ViewController.m
//  1218_writeProgressView
//
//  Created by zx on 12/18/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ViewController.h"
#import "ZXCustomProgressView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor       = [UIColor grayColor];
    ZXCustomProgressView *progressView = [[ZXCustomProgressView alloc]initWithFrame:CGRectMake(60,240,200,40)];
    [progressView setBackgroundImage:[UIImage imageNamed:@"track.png"]];
    [progressView setForheadImage:[UIImage imageNamed:@"progress.png"]];
    progressView.progress           = 0.2;
    [progressView setProgress:1.0 animated:YES];
    
    [self.view addSubview:progressView];
}

@end
