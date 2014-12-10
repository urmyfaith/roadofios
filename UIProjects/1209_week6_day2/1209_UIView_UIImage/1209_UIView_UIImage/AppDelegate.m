//
//  AppDelegate.m
//  1209_UIView_UIImage
//
//  Created by zx on 12/9/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


/*
 background_2
 bomb
 bullet1
 bullet2
 enemy1_blowup_1
 enemy1_blowup_2
 enemy1_blowup_3
 enemy1_blowup_4
 enemy1_fly_1
 enemy2_blowup_1
 enemy2_blowup_2
 enemy2_blowup_3
 enemy2_blowup_4
 enemy2_blowup_5
 enemy2_blowup_6
 enemy2_blowup_7
 enemy2_fly_1
 enemy2_fly_2
 enemy2_hit_1
 enemy3_blowup_1
 enemy3_blowup_2
 enemy3_blowup_3
 enemy3_blowup_4
 enemy3_fly_1
 enemy3_hit_1
 enemy3_hit_2
 enemy4_fly_1
 enemy5_fly_1
 game_pause
 game_pause_hl
 hero_blowup_1
 hero_blowup_2
 hero_blowup_3
 hero_blowup_4
 hero_fly_1
 hero_fly_2
 loading0
 loading1
 loading2
 loading3
 */
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    
    //1. backgroud image.--->UIImageVeiw
    UIImageView *backgroud = [[UIImageView alloc]initWithFrame:[[UIScreen mainScreen] bounds] ];
    backgroud.image = [UIImage imageNamed:@"background_2"];
    [self.window addSubview:backgroud];
    
    
    //2. add  enemy --->UIImageView
    UIImage *enemy1_image = [UIImage imageNamed:@"enemy1_fly_1"];
//    UIImageView *enemy1_view = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, enemy1_image.size.width, enemy1_image.size.height)];
    
    UIImageView *enemy1_view = [[UIImageView alloc]initWithImage:enemy1_image];
    enemy1_view.tag = 1;
    enemy1_view.frame =CGRectMake(145, 240-120, enemy1_image.size.width, enemy1_image.size.height);
    
    NSTimer *timerOfEnemy1 = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(myMove:) userInfo:nil repeats:YES];
    [self.window addSubview:enemy1_view];
    
    // add hero
    UIImage *hero_image = [UIImage imageNamed:@"hero_fly_1"];
    UIImage *hero_image2 = [UIImage imageNamed:@"hero_fly_2"];
    UIImageView *hero_view = [[UIImageView alloc]initWithImage:hero_image];
    hero_view.tag = 2;
    hero_view.frame = CGRectMake(0, 0,hero_image.size.width, hero_image.size.height);
    hero_view.center = CGPointMake(160, 430);
    [self.window addSubview:hero_view];
    
    [hero_view setAnimationImages:
                    @[hero_image,hero_image2]];
    [hero_view setAnimationDuration:0.1];
    [hero_view setAnimationRepeatCount:0];
    [hero_view startAnimating];
    
    
    // add bullet
    UIImage *bullet_image = [UIImage imageNamed:@"bullet3"];
    UIImageView *bullet_view = [[UIImageView alloc]initWithImage:bullet_image];
    bullet_view.center = CGPointMake(160 + hero_image.size.width/2 -25,430 - hero_image.size.height / 2 - 10);
   // NSLog(@"%f",430 - hero_image.size.height / 2 - 10);
    bullet_view.tag = 3;
    [self.window addSubview:bullet_view];

    
    // guesture
    UIPanGestureRecognizer *pan =[[UIPanGestureRecognizer alloc]
                                  initWithTarget:self
                                  action:@selector(moveHeroPan:)];
    [hero_view addGestureRecognizer:pan];
    hero_view.userInteractionEnabled = YES;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)moveHeroPan:(UIPanGestureRecognizer *)pan{
    UIImageView *hero_view = (UIImageView *)[self.window viewWithTag:2];
    CGPoint point = [pan locationInView:self.window];//目标所在的父视图
    hero_view.center = point;
}

-(void)myMove:(NSTimer *)timer{
    UIImageView *enemyVeiw = (UIImageView *)[self.window viewWithTag:1];
    CGRect frame = enemyVeiw.frame;
    frame.origin.y += 1;
    if (frame.origin.y >= 480) {
        frame.origin.y = -frame.size.width;
    }
    enemyVeiw.frame = frame;
    
    UIImageView *bulletView = (UIImageView *)[self.window viewWithTag:3];
    CGRect bulletFrame = bulletView.frame;
    bulletFrame.origin.y -= 2;
    if (bulletFrame.origin.y <= 0) {
        bulletFrame.origin.y =379;
        
    }
    bulletView.frame = bulletFrame;
    if (bulletView.frame.origin.y == enemyVeiw.frame.origin.y) {
        bulletView.hidden = YES;
        NSMutableArray *mutArray = [NSMutableArray array];
        for (int i = 1; i < 5; i++) {
            UIImage *eachImage = [UIImage imageNamed:
                                  [NSString stringWithFormat:@"enemy1_blowup_%i",i]];
            [mutArray addObject:eachImage];
        }
        [enemyVeiw setAnimationImages:mutArray];//在一定的时间内需要播放的图片的张数.
        [enemyVeiw setAnimationDuration:0.5];//动画持续的时间.
        [enemyVeiw setAnimationRepeatCount:0];//0代表无限制
        [enemyVeiw startAnimating];
        [self performSelector:@selector(hiddenEnemyViewAfterDelay) withObject:nil afterDelay:0.5];
        [self performSelector:@selector(hiddenHeroViewAfterDelay) withObject:nil afterDelay:1];
    }
}


-(void)hiddenEnemyViewAfterDelay{
    UIImageView *enemyVeiw = (UIImageView *)[self.window viewWithTag:1];
    [enemyVeiw stopAnimating ];
    [enemyVeiw removeFromSuperview];
}

-(void)hiddenHeroViewAfterDelay{
    UIImageView *hero_view = (UIImageView *)[self.window viewWithTag:2];
    [hero_view stopAnimating];
    [hero_view removeFromSuperview];
    UIAlertView *alert =[ [UIAlertView alloc]initWithTitle:@""
                                                   message:@"Game Over!"
                                                  delegate:self
                                         cancelButtonTitle:@"OK"
                                         otherButtonTitles:nil];
    [alert show];
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
