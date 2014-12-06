//
//  PlayButton.m
//  1201_week5_day1
//
//  Created by zx on 12/1/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "PlayButton.h"
#import "SetupManager.h"


@implementation PlayButton

-(void)onClickPlayButton{
    [[SetupManager sharedManger]setBackgroudColor:YES];
    [SetupManager sharedManger].num = 3;
}

@end
