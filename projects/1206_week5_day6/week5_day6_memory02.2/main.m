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
    //====第三种情况====人重复进入同一房间.
    
    Person *p = [[Person alloc]init];
    //人进入一个房间
    Room *myRoom = [[Room alloc] init];
    myRoom.num =3;
    p.room = myRoom;
    
    NSLog(@"%lu",myRoom.retainCount);
    
    
    [myRoom release];
    p.room = myRoom;
    [p release];
#endif
    

    
    return 0;
}
