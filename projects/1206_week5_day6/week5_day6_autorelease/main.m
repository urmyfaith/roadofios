//
//  main.m
//  week5_day6_autorelease
//
//  Created by zx on 12/6/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    
    //新版本的自动释放池
    @autoreleasepool {
        Person *person = [[Person alloc]init];
        //给一个对象发送autorelease消息
        //会将对象放入@autoreleasepool的一个数组中,
        //在@autoreleasepool结束的时候,给数组中的每一个对象发送release消息.
        [person autorelease];
    }
    
    
    //旧版本的自动释放池
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc]init];
    
    
    [pool drain];//或者是[pool release];
    return 0;
}
