//
//  main.m
//  week5_day3_protocol_calculator
//
//  Created by zx on 12/3/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Calculator.h"

/**
 *  计算器
 * 计算器,可以相加,相减,相乘
 *
 */

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
#if 0
        //面向过程的思想
        Calculator *c = [[Calculator alloc]init];
        
        NSLog(@"%i",[c addNumberA:3 andNumberB:4]);
        NSLog(@"%i",[c subNumberA:3 withNumberB:4]);
        NSLog(@"%i",[c mulitplyNumberA:3 withNumberB:4]);
#endif
        
#if 1
        //面向对象的思想
        Calculator *c1 = [[Calculator alloc]init];
        [c1 setNum:3];
        Calculator *c2 = [[Calculator alloc]init];
        [c2 setNum:4];
        Calculator  *c3 = [c1 sumWithOther:c2];
        NSLog(@"%i",[c3 num]);
        
        
        Calculator *c4 = [[Calculator alloc]init];
        [c4 setNum:3];
        Calculator *c5 = [[Calculator alloc]init];
        [c5 setNum:4];
        Calculator  *c6 = [c4 subtractionWithOther:c5];
        NSLog(@"%i",[c6 num]);
        
        Calculator *c7 = [[Calculator alloc]init];
        [c7 setNum:3];
        Calculator *c8 = [[Calculator alloc]init];
        [c8 setNum:4];
        Calculator  *c9 = [c7 multiplyWithOther:c8];
        NSLog(@"%i",[c9 num]);
        
        
#endif
        
        
    }
    return 0;
}
