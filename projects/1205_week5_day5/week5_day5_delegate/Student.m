//
//  Student.m
//  1205_week5_day5
//
//  Created by zx on 12/5/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "Student.h"
#import "Agency.h"

@implementation Student

//-(void)findHouse{
//    NSLog(@"find hourse method");
//}

-(void)findHelp{
    [_agency findHouse];
}

-(void)setAgency:(Agency *)agency{
    _agency = agency;
}

-(Agency *)agency{
    return _agency;
}
@end