//
//  Student.h
//  1205_week5_day5
//
//  Created by zx on 12/5/14.
//  Copyright (c) 2014 zx. All rights reserved.
//
#import <Foundation/Foundation.h>


@protocol BaseProtocol <NSObject>
-(void)findHouse;
@end
@interface Student : NSObject


@property id<BaseProtocol> delegate;
-(void)findHelp;

@end

    
