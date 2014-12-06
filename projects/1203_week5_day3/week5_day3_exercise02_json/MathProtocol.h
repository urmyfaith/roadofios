//
//  MathProtocol.h
//  1203_week5_day3
//
//  Created by zx on 12/3/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DoHomeworkProtocol.h"
@protocol MathProtocol <DoHomeworkProtocol>

-(void)doMath;
-(void)geometricPainting;

@end
