//
//  main.m
//  week5_day3_protocol_other
//
//  Created by zx on 12/3/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
#import "Cat.h"



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Dog *dog1 = [[Dog alloc]init];
        Cat *cat1 = [[Cat alloc]init];
        
#if 0
        [dog1 eat];
        [cat1 eat];
#endif
        //多态的应用很普遍.
        //一个遵守了BaseProtocol的任意对象(指针);
        //要求指向的对象也要遵循该协议.
        id<BaseProtocol>obj= nil;
#if 1
        if (dog1) {
            obj = dog1;
        }else{
            obj = cat1;
        }
        [obj eat];
        
        //遵守了协议的obj,(对象指针),只能调用协议里的方法,
        //一个遵守了BaseProtocol的任意对象(指针);(协议列表没有该方法);
        //[obj bark];
        
#endif
        
        
        //匿名对象,作用不是很大==>节省代码
        [[Dog alloc]init];//匿名对象,没有对象指针指向对象;
        [[[Dog alloc]init] eat];
        
        //方法的参数在传递时候可以传递匿名对象.
        
        Dog *dog2 = [[Dog alloc]init];  //实名对象,有对象指针指向该对象.
        
        
    }
    return 0;
}
