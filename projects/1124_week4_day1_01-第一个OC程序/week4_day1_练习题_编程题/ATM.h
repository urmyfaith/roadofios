//
//  ATM.h
//  week4_day1_01-第一个OC程序
//
//  Created by zx on 11/26/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ATM : NSObject
{
    int _balance;//ATM里面总的钱数
}
-(void)setBlance:(int)money;
-(int)balance:(int)money;
+(BOOL)isFackMoney:(int)money;

@end
