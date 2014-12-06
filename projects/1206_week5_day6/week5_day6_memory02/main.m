//
//  main.m
//  week5_day6_memory02
//
//  Created by zx on 12/6/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

/**
 *  多对象的手动内存管理
 *
 */
int main(int argc, const char * argv[]) {
    
#if 1
    //=====情况1=====两个对象拥有一个对象的所有权.(包含关系)
    
    Person *p = [[Person alloc]init];
    
    Room *myRoom = [[Room alloc] init];
    //myRoom.retainCount==1 属于main
    
    p.room = myRoom;//myRoom.retainCount+1=2属于person.
    
    NSLog(@"%lu",myRoom.retainCount);
    
    [p release];//myRoom.retainCount-1=1 属于main
    [myRoom release];
#endif
    
    return 0;
}
