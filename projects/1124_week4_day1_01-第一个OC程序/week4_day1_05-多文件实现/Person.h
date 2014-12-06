//
//  Person.h
//  week4_day1_01-第一个OC程序
//
//  Created by zx on 11/24/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject{
@public
    float _height;
    float _weight;
}
-(void)run;
-(float)getHeight;
-(void)eatFood:(char *)apple;
-(void)eatFood:(char *)apple andAnotherFood:(char *)orange;
@end

