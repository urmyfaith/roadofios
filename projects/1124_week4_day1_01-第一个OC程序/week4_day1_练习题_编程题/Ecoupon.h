//
//  Ecoupon.h
//  week4_day1_01-第一个OC程序
//
//  Created by zx on 11/26/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ecoupon : NSObject
{
    NSString *_name;//优惠券名称
    int _value;//优惠券的面值
    NSString *_whenToUse;//优惠券的使用时间
    NSString *_expiryDate;//过期时间范围
}

-(void)setName:(NSString *)name;
-(NSString *)name;

-(void)setValue:(int)value;
-(int)value;

-(void)setWhenToUse:(NSString *)whenToUse;
-(NSString *)whenToUse;

-(void)setExpiryDate:(NSString *)expiryDate;
-(NSString *)expiryDate;


@end
