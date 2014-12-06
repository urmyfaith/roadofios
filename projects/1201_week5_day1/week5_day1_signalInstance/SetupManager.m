//
//  SetupManager.m
//  1201_week5_day1
//
//  Created by zx on 12/1/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "SetupManager.h"



@implementation SetupManager

static SetupManager *manager = nil;

+(SetupManager *)sharedManger{
    @synchronized(self){//同步设置,保证线程安全.
     if( manager == nil){
          manager = [[SetupManager alloc]init];
     }
    }
    return manager;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    if (manager == nil) {
        manager = [super allocWithZone:zone];
    }
    return manager;
}


-(void)setBackgroudColor:(BOOL)isSet{
    if(isSet)
        NSLog(@"backgroud color is red");
    else
        NSLog(@"backgourd color is default(black)");
}


//释放单例的对象

-(void)freeSetupManager{
    if (manager != nil) {
        manager = nil;
    }
}


@end
