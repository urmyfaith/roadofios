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
@end

@implementation Person{

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
        
        Person *p = [Person new];
        
    }
    return 0;
}
