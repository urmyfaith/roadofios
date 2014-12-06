//
//  ipad.m
//  week4_day1_01-第一个OC程序
//
//  Created by zx on 11/24/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "ipad.h"

@implementation ipad

-(void)installSoftware:(char *)softwareName{
    NSLog(@"do install %s",softwareName);
}

-(void)uninstallSoftware:(char *)softwareName{
    NSLog(@"do unstall %s",softwareName);
}

-(void)playGame{
    NSLog(@"do play game here...");
}

-(void)playMusic{
    NSLog(@"do play music here...");
}

-(void)searchMessage:(char *)stringToSearch{
    NSLog(@"do search %s here ...",stringToSearch);
}

-(void)sendEmail{
    NSLog(@"do send email here...");
}

-(void)editWord{
    NSLog(@"do edit word here...");
}

@end
