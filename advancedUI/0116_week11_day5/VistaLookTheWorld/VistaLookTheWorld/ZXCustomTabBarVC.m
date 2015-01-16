//
//  ZXCustomTabBarVC.m
//  VistaLookTheWorld
//
//  Created by zx on 1/16/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXCustomTabBarVC.h"

@interface ZXCustomTabBarVC ()

@end



 /**
 *  个性化设置tabBarController(针对的是某个具体的项目
 方法:
 1.新建一个视图控制器,继承自UITabBarController
 2.将原来的标签控制器的标签栏隐藏
 3.新建的视图控制器内部,创建自定义的标签栏(按钮,图片,文字)
 a)创建button
 b)创建label
 c)点击button,切换标签-->切换视图控制器/切换导航控制器
 4.用定义的标签控制器,替换系统的标签控制器.
 */

@implementation ZXCustomTabBarVC
{
    NSArray *_unSelectedImages;
    NSArray *_selectedImages;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tabBar.hidden = YES;
    
    UIView *customTabBar = [[UIView alloc]initWithFrame:CGRectMake(0,
                                                                   self.view.frame.size.height-49,
                                                                   self.view.frame.size.width,
                                                                   49)];
    
    _unSelectedImages = @[@"资讯_1",@"杂志_1",@"微言_1",@"酷图_1"];
    _selectedImages = @[@"资讯_2",@"杂志_2",@"微言_2",@"酷图_2"];
    
    int  tabBarCount = (int)[_unSelectedImages count];
    
    for (int index = 0 ; index < tabBarCount; index++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        CGFloat width = self.view.frame.size.width/tabBarCount;
        CGFloat height = 49;
        CGFloat xPos = width *index;
        CGFloat yPos = 0;
        
        button.frame = CGRectMake(xPos, yPos, width, height);
        

        [button setImage:[UIImage imageNamed:_unSelectedImages[index]]
                forState:UIControlStateNormal];
        
        button.tag = index + 10;
        
        [button addTarget:self
                   action:@selector(buttonClicked:)
         forControlEvents:UIControlEventTouchUpInside];
        [customTabBar addSubview:button];
        
    }
    [self.view addSubview:customTabBar];
}

-(void)buttonClicked:(UIButton *)button{
    
    self.selectedIndex = button.tag - 10;
//    NSLog(@"%s [LINE:%d] self.selectedIndex =%i", __func__, __LINE__,self.selectedIndex);
    for (int i = 0 ; i < [_unSelectedImages count]; i ++) {
        UIButton *tempButton = (UIButton *)[self.view viewWithTag:(i+10)];
        if (i == self.selectedIndex) {
            [tempButton setImage:[UIImage imageNamed:_selectedImages[i]] forState:UIControlStateNormal];
        }
        else{
            [tempButton setImage:[UIImage imageNamed:_unSelectedImages[i]] forState:UIControlStateNormal];
        }
    }
    
    
    [[NSUserDefaults standardUserDefaults]setInteger:self.selectedIndex forKey:@"selected"];
}

@end
