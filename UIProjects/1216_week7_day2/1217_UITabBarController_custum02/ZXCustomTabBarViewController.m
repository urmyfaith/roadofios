//
//  ZXCustumTabBarViewController.m
//  1217_UITabBarController_custum02
//
//  Created by zx on 12/17/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXCustomTabBarViewController.h"

@interface ZXCustomTabBarViewController ()

@end

@implementation ZXCustomTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.hidden = YES;
    
    UIView *customTabBar = [[UIView alloc]initWithFrame:CGRectMake(0,
                                                                   self.view.frame.size.height-49,
                                                                   self.view.frame.size.width,
                                                                   49)];
    
    NSArray *titles = @[@"first",@"second"];
    NSArray *images = @[@"tab_0.png",@"tab_1.png"];
    
    for (NSInteger index  = 0 ; index < 2; index++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        CGFloat width   = self.view.frame.size.width / 2;
        CGFloat height = 49;
        CGFloat xPos =  width *index;
        CGFloat yPos = 0;
        button.frame = CGRectMake(xPos,yPos,width,height);
        
        button.center = CGPointMake(width/2 + width *index,
                                    yPos   + height/2
                                    );
        //[button setBackgroundImage:[UIImage imageNamed:images[index] ] forState:UIControlStateNormal];
#if 1
        UIImage *image  = [UIImage imageNamed:images[index]];
        [button setImage:image forState:UIControlStateNormal];
        [button setImageEdgeInsets:UIEdgeInsetsMake(-5, 0, 5, 0) ];
#endif
        
#if 0
        UIImage *image  = [UIImage imageNamed:images[index]];
        UIImageView *myImageView = [[UIImageView alloc]initWithImage:image];
        myImageView.frame = CGRectMake(0,0,image.size.width,image.size.height);
#endif
        button.tag = index + 10;
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [customTabBar addSubview:button];
           
#if 0
        [button setTitle:titles[index] forState:UIControlStateNormal];
        [button setTitleEdgeInsets:UIEdgeInsetsMake(10,-10,-10,10)];
#endif
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(xPos,32,width,49-32)];
        label.text = titles[index];
        label.font = [UIFont systemFontOfSize:12];
        label.textAlignment = NSTextAlignmentCenter;
        //[button addSubview:label];
        [customTabBar addSubview:label];
    }
   
    customTabBar.backgroundColor = [UIColor grayColor];
    [self.view addSubview:customTabBar];
    
}
/**
 *  实现单击标签:视图控制器跳转
 *
 *  @param button
 */
-(void)buttonClicked:(UIButton *)button{
    self.selectedIndex = button.tag - 10 ;// 索引值设置为多少--->选中对应的标签-->跳转到对应的视图
    NSLog(@"%s [LINE:%d] selectedIndex = %i", __func__, __LINE__,self.selectedIndex);

    [[NSUserDefaults standardUserDefaults] setInteger:self.selectedIndex forKey:@"selected"];
}


@end

