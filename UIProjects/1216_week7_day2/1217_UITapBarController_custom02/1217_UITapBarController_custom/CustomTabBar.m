//
//  ZXUITabBarViewController.m
//  1217_UITapBarController_custom
//
//  Created by zx on 12/17/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "CustomTabBar.h"
#import "CustomTabBar.h"

@implementation CustomTabBar

@synthesize currentSelectedIndex;
@synthesize buttons;

- (void)viewDidAppear:(BOOL)animated{
    slideBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"header_bg.png"]];
    [self hideRealTabBar];
    [self customTabBar];
}

- (void)hideRealTabBar{
    for(UIView *view in self.view.subviews){
        if([view isKindOfClass:[UITabBar class]]){
            view.hidden = YES;
            break;
        }
    }
}

- (void)customTabBar{
    UIImageView *imgView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"tab_0.png"]];
    imgView.frame = CGRectMake(0, 425, imgView.image.size.width, imgView.image.size.height);
    [self.view addSubview:imgView];
    slideBg.frame = CGRectMake(-30, self.tabBar.frame.origin.y, slideBg.image.size.width, slideBg.image.size.height);
    
    //创建按钮
    int viewCount = self.viewControllers.count > 5 ? 5 : self.viewControllers.count;
    self.buttons = [NSMutableArray arrayWithCapacity:viewCount];
    double _width = 320 / viewCount;
    double _height = self.tabBar.frame.size.height;
    for (int i = 0; i < viewCount; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(i*_width,self.tabBar.frame.origin.y, _width, _height);
        [btn addTarget:self action:@selector(selectedTab:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i;
        [self.buttons addObject:btn];
        [self.view  addSubview:btn];

    }
    [self.view addSubview:slideBg];
    UIImageView *imgFront = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tab_1.png"]];
    imgFront.frame = imgView.frame;
    [self.view addSubview:imgFront];

    [self selectedTab:[self.buttons objectAtIndex:0]];
    
}

- (void)selectedTab:(UIButton *)button{
    if (self.currentSelectedIndex == button.tag) {
        
    }
    self.currentSelectedIndex = button.tag;
    self.selectedIndex = self.currentSelectedIndex;
    [self performSelector:@selector(slideTabBg:) withObject:button];
}

- (void)slideTabBg:(UIButton *)btn{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.20];
    [UIView setAnimationDelegate:self];
    slideBg.frame = CGRectMake(btn.frame.origin.x - 30, btn.frame.origin.y, slideBg.image.size.width, slideBg.image.size.height);
    [UIView commitAnimations];
}


@end
