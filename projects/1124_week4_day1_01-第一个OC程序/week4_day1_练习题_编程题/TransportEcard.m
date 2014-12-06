//
//  TransportEcard.m
//  week4_day1_01-第一个OC程序
//
//  Created by zx on 11/26/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "TransportEcard.h"

@implementation TransportEcard

-(void)setBalance:(Money)balance{
    _balance = _balance + balance;
}
-(int)balance{
    return _balance;
}

-(void)buyTicket{
    NSLog(@"do buy Tickect here");
    
    _balance  = _balance - 2;//2元一次.
}
@end
