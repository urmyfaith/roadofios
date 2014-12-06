//
//  Person.h
//  1206_week5_day6
//
//  Created by zx on 12/6/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Room.h"
@interface Person : NSObject
{
    Room *_room;
}
-(void)setRoom:(Room *)room;
-(Room *)room;
@end
