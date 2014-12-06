//
//  Ecoupon.m
//  week4_day1_01-第一个OC程序
//
//  Created by zx on 11/26/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "Ecoupon.h"

@implementation Ecoupon
-(void)setName:(NSString *)name{
    _name = name;
}
-(NSString *)name{
    return _name;
}

-(void)setWhenToUse:(NSString *)whenToUse{
    _whenToUse = whenToUse;
}
-(NSString *)whenToUse{
    return _whenToUse;
}

-(void)setValue:(int)value{
    _value = value;
}
-(int)value{
    return _value;
}

-(void)setExpiryDate:(NSString *)expiryDate{
    _expiryDate = expiryDate;
}
-(NSString *)expiryDate{
    return _expiryDate;
}

-(NSString *)description{
    NSString *str = [NSString stringWithFormat:@"%@,¥%i,本优惠券%@使用,有效期%@",_name,_value,_whenToUse,_expiryDate];
    return str;
}
@end
