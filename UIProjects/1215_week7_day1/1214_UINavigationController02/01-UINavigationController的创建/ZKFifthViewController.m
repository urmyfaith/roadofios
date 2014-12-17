//
//  ZKFifthViewController.m
//  01-UINavigationController的创建
//
//  Created by zx on 12/15/14.
//  Copyright (c) 2014 zhaokai. All rights reserved.
//

#import "ZKFifthViewController.h"
#import "ZXAllMethod.h"

@interface ZKFifthViewController ()

@end

@implementation ZKFifthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    UILabel *pageLable = [UILabel labelWithFrame:CGRectMake(35,320,250,40)
                                        withText:@"this is the fifth page"
                                         withTag:101
                             withBackgroundColor:[UIColor whiteColor]];
    pageLable.textAlignment = NSTextAlignmentCenter;
    [pageLable.layer setMasksToBounds:YES];
    [pageLable.layer setCornerRadius:10];
    [self.view addSubview:pageLable];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
