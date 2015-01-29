//
//  InfoViewController.h
//  xCarDemo
//
//  Created by zx on 1/29/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "RootViewController.h"
#import "ALRadialMenu.h"

@interface InfoViewController : RootViewController<ALRadialMenuDelegate>

@property (nonatomic,strong) NSString    *infoLink;

@end
