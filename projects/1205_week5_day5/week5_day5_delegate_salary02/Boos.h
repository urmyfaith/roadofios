//
//  Boos.h
//  1205_week5_day5
//
//  Created by zx on 12/5/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Worker.h"

@interface Boos : NSObject<BaseProtocol>
    @property Worker * worker;
    -(void)doBoosJob;
@end
