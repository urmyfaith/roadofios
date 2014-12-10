//
//  AppDelegate.m
//  1209_UIView01
//
//  Created by zx on 12/9/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "AppDelegate.h"
#import "ZXBlock.h"

@interface AppDelegate ()

@property (nonatomic,strong)NSMutableArray *blocks;

@end




@implementation AppDelegate


-(NSMutableArray *)blocks{
    if(_blocks == nil)
    {
        _blocks = [[NSMutableArray alloc]init];
    }
    return _blocks;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    //======UIView======
    // 1)Creat View
    UIView *view = [[UIView alloc]init];
    view.frame = CGRectMake(10, 40, 100, 200);
    [self.window addSubview:view];
    view.backgroundColor = [UIColor blueColor];
    
    // 5)Set Center Point
    //  when CenterPoint is Changed,the view will change its positon.
    // size will not change.
    //view.center = CGPointMake(200,200);
    
    
    /* 6)set View position
        a. frame  ===>window's zeroPoint as zeroPoint. relative-coordinate
                    referance to father-view.
        b. bounds ===>local coordinate,referance is self. self' zeroPoint as zeroPoint.
                the Center Point will be (0,0);
     note: if only assign bounds to view,the centerPoint will be at (0,0).
     note: bouds will use the orignal centerPoint as centerPoint ,then resize view to bounds.
     note: bounds's (x,y) will be (0,0) even thouth you try to change it.
     */
    view.bounds = CGRectMake(30,300,80,40);
 //   CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
    NSLog(@"%lf,%lf",view.center.x,view.center.y);
    
    
    /**
     * 7) interactive
     *    some subView is interactive by default,and some is non-interactive.
     */
    view.userInteractionEnabled = YES;
    
    /*
        8) alpha view
     if alpha is zero ,the view will be hidden.
     */
    view.alpha = 0.5;
    
    /*
        9) hidden view
     */
    view.hidden = YES;
   
    
    
    //=======================
    //随机函数可以获得随机的数
    //arc4random();
    //NSTimer通过它可以控制一个时间发生的时间.
    NSTimer *timer = [ NSTimer scheduledTimerWithTimeInterval:0.08 target:self selector:@selector(createBlock:) userInfo:nil repeats:YES];
    //
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}


-(void)createBlock:(NSTimer *)timer{


    if ([self.blocks count] <= 15) {
        ZXBlock *view1 = [[ZXBlock alloc]initWithFrame:CGRectMake(
                                                                arc4random()%320,
                                                                arc4random()%480,
                                                                arc4random()%100,
                                                                arc4random()%100
                                                                )];
        view1.backgroundColor = [UIColor colorWithRed:(double)(arc4random()%255)/255.
                                                green:(double)(arc4random()%255)/255.
                                                 blue:(double)(arc4random()%255)/255.
                                                alpha:(double)(arc4random()%10)/10.];
        view1.xSpeed += 10 - (double)(arc4random()%20)+ 0.1;
        view1.ySpeed += 10 - (double)(arc4random()%20)+ 0.1;
        [self.window addSubview:view1];
        [self.blocks addObject:view1];
    }
    for (ZXBlock * eachView in self.blocks) {
        //语法错误,不能直接赋值===>单独赋值不行,整体赋值可以.
        CGRect frame = eachView.frame;
        frame.origin.x += eachView.xSpeed;
        frame.origin.y += eachView.ySpeed;
        if (frame.origin.x <= 0|| frame.origin.x >=320 - frame.size.width) {
            eachView.xSpeed = -eachView.xSpeed;
        }
        if (frame.origin.y <= 0|| frame.origin.y >=480 - frame.size.height) {
            eachView.ySpeed = -eachView.ySpeed;
        }
        eachView.frame = frame;
    }
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
