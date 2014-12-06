//
//  Student.m
//  1205_week5_day5
//
//  Created by zx on 12/5/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "Student.h"


//#import "Agency.h" -->在遵守协议之后,这里就不需要了.

@implementation Student


//-(void)findHelp{
//    [_agency findHouse];
//}

//-(void)setAgency:(Agency *)agency{
//    _agency = agency;
//}

//-(Agency *)agency{
//    return _agency;
//}


-(void)findHelp{
  [_delegate findHouse];
}

-(void)setDelegate:(id<BaseProtocol>)delegate{
    _delegate = delegate;
}
-(id<BaseProtocol>)delegate{
    return _delegate;
}


@end
