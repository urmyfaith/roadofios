//
//  Person.m
//  1203_week5_day3
//
//  Created by zx on 12/3/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "Person.h"

//在没有实现.h文件中的方法的时候,会有警告
//在没有实现protocol中的方法的时候,会有警告

@implementation Person

//potocol中optional的方法-->可以实现,可以不实现
//-(void)baseMethod{
//    NSLog(@"Person class impletment protocol:BaseProtocol");
//}

-(void)play{
    NSLog(@"person paly");
}


//potocol中required的方法-->必须实现.
-(void)run{
    NSLog(@"Peron run");
}
@end
