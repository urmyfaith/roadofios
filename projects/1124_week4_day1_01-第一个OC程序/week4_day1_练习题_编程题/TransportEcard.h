//
//  TransportEcard.h
//  week4_day1_01-第一个OC程序
//
//  Created by zx on 11/26/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
    MoneyWith20 = 20,
    MoneyWith50 = 50,
    MoneyWith100 = 100
}Money;

@interface TransportEcard : NSObject
{
    int _balance;
}
-(void)setBalance:(Money)balance;//充值

-(int)balance;//显示余额

-(void)buyTicket;//买票


@end
