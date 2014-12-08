//
//  AppDelegate.m
//  1208_UIButton
//
//  Created by zx on 12/8/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (UIAlertViewDelegate)


@end

typedef enum{
    ButtonWithOK = 1,
    ButtonWithCancel
} ButtonTag;

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    //===创建按钮
    /**
     *  =a)按钮样式
     *  UIButtonTypeSystem是iOS7.0之后的,代表提供的样式.
     *  UIButtonTypRoundedRect(圆角矩形),iOS7.0以前一直使用的样式.
     */
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    
    /**
     * b)设置显示的文字
     * 注意,在给设置文字的时候,最好使用set方法,而不是点语法.
     */
    [button1 setSelected:NO];
    [button1 setTitle:@"Clikc Me" forState:UIControlStateNormal];
    [button1 setTitle:@"Tapped Me" forState:UIControlStateHighlighted];
    [button1 setTitle:@"Selected me" forState:UIControlStateSelected];
    //
    [button1 setShowsTouchWhenHighlighted:YES];
    
    /**
     *  c)设置位置
     */
    button1.frame = CGRectMake(10,40,100,40);
    
    /**
     *  d)显示
     */
    [self.window addSubview:button1];
    
    /**
     *  e)执行方法
     */
    [button1 addTarget:self
                action:@selector(clickedButton:)
      forControlEvents:UIControlEventTouchUpInside];
    
    /**
     *  f)tag: use tag to identify diffent tag;
     */
    button1.tag = ButtonWithOK;
    
    //===按钮的属性设置
   // UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
     UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = CGRectMake(10,100,100,40);
#if 1
    [button2 setTitle:@"b2" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];//设置颜色;
    [button2.titleLabel setFont:[UIFont systemFontOfSize:20]];//设置字体大小.
    
    [button2 setTitle:@"tap" forState:UIControlStateHighlighted];//设置高亮
    
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(1,5,5,5);
    [button2 setTitleEdgeInsets:edgeInsets];//文字上下左右的距离.
    
    [button2 setBackgroundColor:[UIColor yellowColor]];//设置背景颜色.
    
    [button2 setTitle:@"sel" forState:UIControlStateSelected];
#endif
    
    /**
     *  layser Rounded Corner Button.
     */
    [button2.layer setMasksToBounds:YES];
    [button2.layer setCornerRadius:10];//radius of circle
    [button2.layer setBorderWidth:5];
    
    
    //background => full the button.
    button2.backgroundColor = [UIColor grayColor];
    UIImage *image = [UIImage imageNamed:@"back"];
    [button2 setBackgroundImage:image forState:UIControlStateNormal];
    
    UIImage *image1 = [UIImage imageNamed:@"google"];
    [button2 setImage:image1 forState:UIControlStateNormal];
    
    // target:  whichView
    //action:   whichMethod
    //event:    whichEvents
    // UIControlEventTouchUpInside tapped down then up.
    // delegate part.
    [button2 addTarget:self action:@selector(clickedButton:) forControlEvents:UIControlEventTouchUpInside];
    [button2 addTarget:self action:@selector(clickedButton2:) forControlEvents:UIControlEventTouchUpOutside];

    button2.tag = ButtonWithCancel;
    
    [self.window addSubview:button2];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

/**
 *  use one button to delegate multiply buttons.
 *
 *  @param button currentObj.
 */
-(void)clickedButton:(UIButton *)button{
    if (button.tag  == ButtonWithOK) {
        
        NSLog(@"ButtonWithOK");
        
        /**
         aan alertView
         1. create an object
         2. show it.
         */
        UIAlertView *alert =[ [UIAlertView alloc]initWithTitle:@"tips"
                                                       message:@"you have clicked OK"
                                                      delegate:self
                                             cancelButtonTitle:@"cancel"
                                             otherButtonTitles:@"confirm", nil];
        [alert show];
    }
    else{
            NSLog(@"ButtonWithCancel");
    }
    [button setSelected:YES];//讲按钮的状态改变为选中状态.

}

-(void)alertView:(UIAlertView *)alerView clickedButtonAtIndex:(NSInteger )buttonIndex{
    if (buttonIndex == 0) {
        NSLog(@"ButtonWithCancel:button cancel");
    }
    else{
        NSLog(@"ButtonWithCancel:button OK");
    }
}

-(void)clickedButton2:(UIButton *)button{
    [button setSelected:YES];//讲按钮的状态改变为选中状态.
    NSLog(@"in click method:UIControlEventTouchUpOutside");
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
