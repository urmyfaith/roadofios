//
//  main.m
//  week5_day1_signalInstance
//
//  Created by zx on 12/1/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayButton.h"
#import "BuyCurrencyButton.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        PlayButton *pb = [[PlayButton alloc]init];
        
        [pb onClickPlayButton];
     
         BuyCurrencyButton *bcb = [[BuyCurrencyButton alloc]init];
        [bcb onClickBuyCurrencyButton];
        
        [[SetupManager sharedManger] freeSetupManager];
        
        NSLog(@"%d",[SetupManager sharedManger].num);
    }
    return 0;
}
