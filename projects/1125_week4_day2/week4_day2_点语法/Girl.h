//
//  Girl.h
//  1125_week4_day2
//
//  Created by zx on 11/25/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Girl : NSObject{
    @public
    int _age;
    int _weight;
}

-(void)setAge:(int)age;
-(int)age;

-(void)setWeight:(int)weight;
-(int)weight;

@end
