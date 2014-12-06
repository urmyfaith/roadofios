
//
//  Dog.m
//  week4_day5_SEL01
//
//  Created by zx on 11/28/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "Dog.h"

@implementation Dog
-(void)bark{
    NSLog(@"dog is barking.");
}

-(void)eat:(NSString *)string{
    NSLog(@"dog is eat %@",string);
}
@end
