//
//  ATM.m
//  week4_day1_01-第一个OC程序
//
//  Created by zx on 11/26/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "ATM.h"

@implementation ATM

//存钱
-(void)setBlance:(int)money{
    _balance +=money;
}


//取钱,输入取钱金额,返回成功取得的金额,
-(int)balance:(int)money{
    _balance -=money;
    return money;
}

//判断是否是假币

+(BOOL)isFackMoney:(int)money{
    NSLog(@"do fack money here...");
    BOOL isFack =  TRUE;
    if (isFack) {
        return FALSE;
    }
    else{
        return TRUE;
    }
}

@end
