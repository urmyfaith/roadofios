//
//  SubProtocol.h
//  1203_week5_day3
//
//  Created by zx on 12/3/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SubProtocol <NSObject>
-(int)subNumberA:(int)numberA withNumberB:(int)numberB;

-(id)subtractionWithOther:(id)obj;
@end
