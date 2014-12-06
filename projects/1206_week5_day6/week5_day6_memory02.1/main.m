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
    //====第二种情况====人一个房间出来,进入另外一个房间.
    
    Person *p = [[Person alloc]init];
    //人进入一个房间
    Room *myRoom = [[Room alloc] init];
    myRoom.num =3;
    p.room = myRoom;
    
    NSLog(@"%lu",myRoom.retainCount);
    
    //人进入另外一个房间.
    Room *myRoom2 = [[Room alloc] init];
    myRoom2.num = 5;
    p.room = myRoom2;

    [p release];
    [myRoom2 release];
    [myRoom release];
#endif
    
    return 0;
}
