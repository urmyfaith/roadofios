//
//  main.m
//  week4_day3_04构造方法
//
//  Created by zx on 11/26/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
       // Person *person1 = [Person new];
        
        Person *person1 = [[Person alloc] init];
        NSLog(@"%i",person1.age);
        
        //Dog *dog1 = [[dog alloc] init];
        
        Person *person2 = [[Person alloc] initWithAge:10];
        NSLog(@"%i",person2.age);
    }
    return 0;
}
