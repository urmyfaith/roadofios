//
//  main.m
//  1125_week4_day2
//
//  Created by zx on 11/25/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject{
    int _age;
    int _model;
}
-(void)run;
-(void)setAge:(int)age;
-(int)age;

-(void)carWithAge:(int)age andModel:(int)model;
@end

@implementation Car

-(void) run{
    NSLog(@"running!!!");
}

-(void)setAge:(int)age{
    _age = age;
}

-(int)age{
    return _age;
}
-(void)carWithAge:(int)age andModel:(int)model{
    NSLog(@"%i,%i",age,model);
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {

    }
    return 0;
}
