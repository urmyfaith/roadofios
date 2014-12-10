//
//  AppDelegate.m
//  1209_UIImageView
//
//  Created by zx on 12/9/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    //UIImage显示图片的视图
    
    CGRect rect = [[UIScreen mainScreen] bounds];
    NSLog(@"%f,%f,%f,%f",rect.origin.x,rect.origin.y,rect.size.height,rect.size.width);
    
    // 1.加载背景图片
    UIImageView *background = [[UIImageView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    // jpg格式的图片需要写完整的文件名(也就说带后缀名),png的可以省略后缀名
    background.image = [UIImage imageNamed:@"back2.jpg"];
    [self.window addSubview:background];
    
    // 2.创建小鸟
    UIImage *image = [UIImage imageNamed:@"DOVE 1"];
    UIImageView *brid = [[UIImageView alloc]initWithFrame:CGRectMake(10,100,image.size.width,image.size.height)];
    brid.tag = 100;
    [self.window addSubview:brid];
    
    //动画:实际上是在一定的时间内播放指定的张数.
    //每秒最少要播放24帧.
    NSMutableArray *mutArray = [NSMutableArray array];
    for (int i = 1; i < 18; i++) {
        UIImage *eachImage = [UIImage imageNamed:[NSString stringWithFormat:@"DOVE %i",i]];
        [mutArray addObject:eachImage];
    }
    
    [brid setAnimationImages:mutArray];//在一定的时间内需要播放的图片的张数.
    [brid setAnimationDuration:0.5];//动画持续的时间.
    [brid setAnimationRepeatCount:0];//0代表无限制
    [brid startAnimating];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0/60 target:self selector:@selector(bridMove:) userInfo:nil repeats:YES];
    
    //设置玩家
    UIImage *imagePlayer = [UIImage imageNamed:@"player"];
    
    UIImageView *player = [[UIImageView alloc]initWithImage:imagePlayer];
    player.tag = 111;
    player.frame = CGRectMake(100,350,imagePlayer.size.width,imagePlayer.size.height);

    player.center = CGPointMake(160,350);
    

    //手势,捏合,放大,轻扫,移动pan,长按,旋转,
    //添加移动手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self  action:@selector(panPlayer:)];
    
    //将手势添加到目标对象上去(player)
    [player addGestureRecognizer:pan];
    
    //设置交互:YES.
#if 1
    [self.window addSubview:player];
    player.userInteractionEnabled = YES;
#endif
    
#if 0
    [background addSubview:player];
    background.userInteractionEnabled = YES;
#endif
    //self.window.userInteractionEnabled = YES;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)panPlayer:(UIPanGestureRecognizer *)pan{
    UIImageView *player = (UIImageView *)[self.window viewWithTag:111];
    CGPoint point = [pan locationInView:self.window];//目标所在的父视图
    
    player.center = point;
}


/**
 *  让鸟移动
 *  当鸟飞到最右边的时候,重新从左边飞.
 *  @param timer 定时器
 */
-(void)bridMove:(NSTimer *)timer{
    //addSubview:可以使父视图拥有子视图的所有权.
    //从window里面取出brid这个子视图
    UIImageView *imageView  = (UIImageView *)[self.window viewWithTag:100];
    CGRect frame = imageView.frame;
    frame.origin.x += 1;
    if (frame.origin.x >= 320) {
        frame.origin.x = -frame.size.width;
    }
    imageView.frame = frame;
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
