//
//  SetupManager.h
//  1201_week5_day1
//
//  Created by zx on 12/1/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SetupManager.h"

@interface SetupManager : NSObject

@property (nonatomic,assign)int num;
+(SetupManager *)sharedManger;

-(void)setBackgroudColor:(BOOL)isSet;

-(void)freeSetupManager;
@end
