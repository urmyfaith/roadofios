//
//  Student.h
//  1205_week5_day5
//
//  Created by zx on 12/5/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Agency;

@interface Student : NSObject{
    Agency *_agency;
}

//-(void)findHouse;

-(void)setAgency:(Agency *)agency;

-(Agency *)agency;

-(void)findHelp;


@end
