//
//  Calculator.m
//  1203_week5_day3
//
//  Created by zx on 12/3/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

-(int)addNumberA:(int)numberA andNumberB:(int)numberB{
    
    return numberA + numberB;
}

-(id) sumWithOther:(id)obj{
    self.num += [obj num];
    return self;
}

-(int)subNumberA:(int)numberA withNumberB:(int)numberB{
   
    return numberA - numberB;
}

-(id)subtractionWithOther:(id)obj{
    self.num -= [obj num];
    return self;
}

-(int)mulitplyNumberA:(int)numberA withNumberB:(int)numberB{
    
    return numberA * numberB;
}

-(id)multiplyWithOther:(id)obj{
    self.num *= [obj num];
    return self;
}

@end
