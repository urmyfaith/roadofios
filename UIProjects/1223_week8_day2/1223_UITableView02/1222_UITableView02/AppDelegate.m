//
//  AppDelegate.m
//  1222_UITableView02
//
//  Created by zx on 12/23/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "AppDelegate.h"
#import "ZXTableViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window      = [[UIWindow alloc] initWithFrame: [[UIScreen mainScreen] bounds]];
    ZXTableViewController *tableViewController = [[ZXTableViewController alloc] initWithStyle:UITableViewStylePlain];
    self.window.rootViewController = tableViewController;
    
    [self.window makeKeyAndVisible];

    return YES;
}
@end
