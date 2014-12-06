//
//  main.m
//  week5_day6_memory_retainCount
//
//  Created by zx on 12/6/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {

    Person *person = [[Person alloc]init];
    NSLog(@"%lu",  person.retainCount);
    
    
#if 1
    [person retain];
    NSLog(@"%lu",  person.retainCount);
    
#endif
    
    [person release];

#if 1
    NSLog(@"%lu",  person.retainCount);
    NSLog(@"%lu",  person.retainCount);//打印不出零来.
    [person eat];
#endif
    [person release];

    return 0;

}
