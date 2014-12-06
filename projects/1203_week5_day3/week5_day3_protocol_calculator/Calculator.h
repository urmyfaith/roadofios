//
//  Calculator.h
//  1203_week5_day3
//
//  Created by zx on 12/3/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddProtocol.h"
#import "SubProtocol.h"
#import "MultiplyProtocol.h"


@interface Calculator : NSObject<AddProtocol,SubProtocol,MultiplyProtocol>

@property (assign,nonatomic) int num;

//@property (nonatomic,assign) Calculator * cal;

@end
