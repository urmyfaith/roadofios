//
//  Person.h
//  1203_week5_day3
//
//  Created by zx on 12/3/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayProtocol.h"
#import "RunProtocol.h"
#import "EatProtocol.h"


@interface Person : NSObject<PlayProtocol,RunProtocol,EatProtocol>

@end
