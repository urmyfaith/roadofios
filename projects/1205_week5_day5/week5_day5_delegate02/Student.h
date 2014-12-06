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
    //Agency *_agency;
    //代表任意类型的对象,但是要有找房子的能力==>遵循一个协议;
    //id  _delegate;
    //遵守这个协议任意对象;
    id<BaseProtocol>  _delegate;
}



//-(void)setAgency:(Agency *)agency;
//-(Agency *)agency;


-(void)setDelegate:(id<BaseProtocol>)delegate;
-(id<BaseProtocol>)delegate;

-(void)findHelp;


@end
