//
//  main.m
//  week4_day1_02-第一个OC类
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

@implementation Person
-(void)run{
    NSLog(@"run run run!");
}
-(float)getHeight{
    return _weight-1;
}
-(void)eatFood:(char *)apple{
    NSLog(@"eating %s",apple);
}
-(void)eatFood:(char *)apple andAnotherFood:(char *)orange{
    NSLog(@"eating %s---%s",apple,orange);
}
@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //Person *p = [[Person alloc]init];
        Person *person = [Person new];
        person->_height = 166.3;
        person->_weight = 45 ;
        NSLog(@"%.2f",person->_height);
        NSLog(@"%.2f",person->_weight);
        
        [person run];
        NSLog(@"%.2f",[person getHeight]);
        [person eatFood:"apple"];
        [person eatFood:"apple" andAnotherFood:"orange"];

    }
    return 0;
}
