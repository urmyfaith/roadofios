//
//  AppDelegate.m
//  1209_UIView_UIImage
//
//  Created by zx on 12/9/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "AppDelegate.h"
#import "MoveableUIImageView.h"

@interface AppDelegate ()

@end

typedef enum {
    viewTagWithEnemySmall = 10,
    viewTagWithEnemyBig,
    viewTagWithEnemyMid,
    viewTagWithHero = 20,
    viewTagWithBullet1 = 101,
    viewTagWithBullet2,
    viewTagWithBullet3,
    viewTagWithBullet4,
    viewTagWithBullet5
}viewTag;

@implementation AppDelegate

#pragma mark 加载各个对象
-(void)loadBackground{
    _backgroud = [[UIImageView alloc]initWithFrame:[[UIScreen mainScreen] bounds] ];
    _backgroud.image = [UIImage imageNamed:@"background_2"];
}

-(NSMutableArray *)enemyViewArray{

    if (_enemyViewArray == nil) {
        _enemyViewArray = [[NSMutableArray alloc]initWithCapacity:3];
        NSArray *enemyImageArray = @[@"enemy1_fly_1",@"enemy3_fly_1",@"enemy2_fly_1"];
        for (int i = 0; i < [enemyImageArray count];  i++) {
            UIImage *enemyImage = [UIImage imageNamed:enemyImageArray[i]];
            MoveableUIImageView *enemyView = [[MoveableUIImageView alloc] initWithImage:enemyImage ];
            enemyView.tag = i + 10;
            enemyView.center = CGPointMake(arc4random()%300 + 10, 40);
            enemyView.speed = 3 - i;
            [_enemyViewArray addObject:enemyView];
        }
    }
    return _enemyViewArray;
}

-(UIImageView *)hero{
    if (_hero == nil) {
		UIImage *hero_image = [UIImage imageNamed:@"hero_fly_1"];
		UIImage *hero_image2 = [UIImage imageNamed:@"hero_fly_2"];
		_hero = [[UIImageView alloc]initWithImage:hero_image];
		_hero.tag = viewTagWithHero;
		_hero.center = CGPointMake(160, 430);
        
        //飞机动起来
        [self.hero setAnimationImages:
         @[hero_image,hero_image2]];
        [self.hero setAnimationDuration:0.1];
        [self.hero setAnimationRepeatCount:0];
        [self.hero startAnimating];
	}
	return _hero;

}

-(NSMutableArray *)bulletViewArray{
	if (_bulletViewArray == nil) {
		_bulletViewArray = [[NSMutableArray alloc]initWithCapacity:5];
		UIImage *bulletImage = [UIImage imageNamed:@"bullet3"];
		for (int i = 1 ; i <=5 ; i++) {
			MoveableUIImageView *bulletView = [[MoveableUIImageView alloc]initWithImage:bulletImage];
			bulletView.center = CGPointMake(170 ,400);
            bulletView.speed = 4;
			bulletView.tag = 100+i;
			[_bulletViewArray addObject:bulletView];
		}
	}
    return _bulletViewArray;
}


#pragma mark 程序次入口
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    //加载背景图片
    [self loadBackground];
    [self.window addSubview:_backgroud];
    
    //加载敌方飞机
    [self enemyViewArray];
    for (MoveableUIImageView *enemyView in self.enemyViewArray) {
        [self.window addSubview: enemyView];
    }
    //让地方飞机动起来
    [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(myMove:) userInfo:nil repeats:YES];
    
    //加载Hero飞机
    [self hero];
    [self.window addSubview:self.hero];

    //加载子弹
    [self bulletViewArray];
    for (MoveableUIImageView *eachBulletView in self.bulletViewArray) {
        [self.window addSubview:eachBulletView];
    }
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark 逻辑处理
-(void)myMove:(NSTimer *)timer{
    for (MoveableUIImageView *eachEnemyView in self.enemyViewArray) {
        CGRect frame = eachEnemyView.frame;
        frame.origin.y +=  eachEnemyView.speed ;
        if (frame.origin.y >= 420) {
            frame.origin.y = -frame.size.width;
            frame.origin.x =((int)frame.origin.x +(int) (arc4random()%320) ) % 320;
            eachEnemyView.hidden = NO;
            [eachEnemyView stopAnimating];
        }
        eachEnemyView.frame = frame;
    }
    //间隔一段时间发射一个子弹:
        for (int i = 0; i < [self.bulletViewArray count]; i++) {
            [self performSelector:@selector(shootBullet:)
                       withObject:[self bulletViewArray][i]
                       afterDelay:(i+1)*0.2];
    }
    [self hiddenEnemyAndBullet];
}

-(void)shootBullet:(MoveableUIImageView *)bulletView{
    CGRect frame = bulletView.frame;
    frame.origin.y -=  bulletView.speed ;
    if (frame.origin.y <= 0) {
        frame.origin.y = 400;
        bulletView.hidden = NO;
    }
    bulletView.frame = frame;
}


-(void)hiddenEnemyAndBullet{
    NSMutableArray *mutArraySmall = [NSMutableArray array];
    for (int i = 1; i <=4; i++) {
        UIImage *eachImage = [UIImage imageNamed:
                              [NSString stringWithFormat:@"enemy1_blowup_%i",i]];
        [mutArraySmall addObject:eachImage];
    }
    NSMutableArray *mutArrayBig = [NSMutableArray array];
    for (int i = 1; i <=7; i++) {
        UIImage *eachImage = [UIImage imageNamed:
                              [NSString stringWithFormat:@"enemy2_blowup_%i",i]];
        [mutArrayBig addObject:eachImage];
    }
    NSMutableArray *mutArrayMid = [NSMutableArray array];
    for (int i = 1; i <=4; i++) {
        UIImage *eachImage = [UIImage imageNamed:
                              [NSString stringWithFormat:@"enemy1_blowup_%i",i]];
        [mutArrayMid addObject:eachImage];
    }
    for (int i = 0; i < [self.enemyViewArray count]; i++) {
        MoveableUIImageView *currentEnemy = self.enemyViewArray[i];
        for (int j = 0 ; j < [self.bulletViewArray count]; j++) {
             MoveableUIImageView *currentBullet= self.bulletViewArray[i];
            if (currentBullet.frame.origin.x >= currentEnemy.frame.origin.x &&
                currentBullet.frame.origin.x <= currentEnemy.frame.origin.x + CGRectGetMaxX(currentEnemy.frame) &&
                currentBullet.frame.origin.y == CGRectGetMaxY(currentEnemy.frame)
                ) {
                NSLog(@"currentEnemy:%i -->currentBullet%i",currentEnemy.tag,currentBullet.tag);
                switch (currentEnemy.tag) {
                    case viewTagWithEnemySmall:
                        [currentEnemy setAnimationImages:mutArraySmall];
                        break;
                    case viewTagWithEnemyBig:
                        [currentEnemy setAnimationImages:mutArrayBig];
                        break;
                    case viewTagWithEnemyMid:
                        [currentEnemy setAnimationImages:mutArrayMid];
                        break;
                    default:
                        break;
                }
                [currentEnemy setAnimationDuration:0.5];//动画持续的时间.
                [currentEnemy setAnimationRepeatCount:0];//0代表无限制
                [currentEnemy startAnimating];
                [self performSelector:@selector(hiddenBulletAfterDelay:) withObject:currentBullet afterDelay:0.005];
                [self performSelector:@selector(hiddenEnemyAfterDelay:) withObject:currentBullet afterDelay:0.008];
            }
        }
    }
}
-(void)hiddenBulletAfterDelay:(MoveableUIImageView *)bulletView{
    bulletView.hidden = YES;
}

-(void)hiddenEnemyAfterDelay:(MoveableUIImageView *)enemyView{
    [enemyView stopAnimating];
     enemyView.hidden = YES;
}




#pragma mark 代理类方法
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
