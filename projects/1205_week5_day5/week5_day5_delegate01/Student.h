//
//  Student.h
//  1205_week5_day5
//
//  Created by zx on 12/5/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Student : NSObject{
    //Agency *_agency;
    id _delegate;
}



//-(void)setAgency:(Agency *)agency;
//-(Agency *)agency;


-(void)setDelegate:(id)delegate;
-(id)delegate;

-(void)findHelp;


@end
