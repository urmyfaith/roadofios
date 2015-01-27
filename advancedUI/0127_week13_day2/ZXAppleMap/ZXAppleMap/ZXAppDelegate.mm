//
//  ZXAppDelegate.m
//  ZXAppleMap
//
//  Created by zx on 1/27/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXAppDelegate.h"
#import "BMapKit.h"


@implementation ZXAppDelegate
{
    BMKMapManager *_mapManager;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    
    // Override point for customization after application launch.
    _mapManager  = [[BMKMapManager alloc]    init];
    BOOL res = [_mapManager start:@"a9bDDgkdsrXf14qFMVd8F09p" generalDelegate:nil];
    if (res) {
        NSLog(@"start success");
    }
    else{
        NSLog(@"start failed.");
    }
    
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}
@end
