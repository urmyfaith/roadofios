//
//  MultiplyProtocol.h
//  1203_week5_day3
//
//  Created by zx on 12/3/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MultiplyProtocol <NSObject>

-(int)mulitplyNumberA:(int)numberA withNumberB:(int)numberB;
-(id)multiplyWithOther:(id)obj;
@end
