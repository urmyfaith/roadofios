//
//  Student.h
//  1205_week5_day5
//
//  Created by zx on 12/5/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseProtocol.h"

@interface Student : NSObject{
    id<BaseProtocol>  _delegate;
}


-(void)setDelegate:(id<BaseProtocol>)delegate;
-(id<BaseProtocol>)delegate;

-(void)findHelp;


@end
