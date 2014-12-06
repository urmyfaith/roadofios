//
//  main.m
//  week5_day6_autorelease02
//
//  Created by zx on 12/6/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //在没有使用alloc,new,copy,retain的时候,不能使用release.
        //因为要保持retainCount的时候.
        Person *person = [Person createPerson];
        
        NSString *str = [NSString stringWithFormat:@"%i",2];
        
        NSArray *array = [NSArray arrayWithObjects:@"22", nil];
    }
    return 0;
}
