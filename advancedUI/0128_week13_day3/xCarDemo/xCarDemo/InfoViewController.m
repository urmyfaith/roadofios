//
//  InfoViewController.m
//  xCarDemo
//
//  Created by zx on 1/29/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "InfoViewController.h"


@interface InfoViewController ()

@end

@implementation InfoViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self createNavigationBar];

}

#pragma makr 重写导航条

-(void)createNavigationBar{
    [self createMyNavigationBarWithTitle:nil
                              andLeftBtn:@[@"News_Details_Btn_Back.png"]
                             andRightBtn:@[@"News_Details_Btn_Comment.png",@"News_Details_Btn_Share.png"]];
}

-(void)buttonClick:(UIButton *)button{
    NSLog(@"butont.tag=%d",button.tag);
}

@end
