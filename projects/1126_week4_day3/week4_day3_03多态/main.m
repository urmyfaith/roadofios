//
//  main.m
//  week4_day3_03多态
//
//  Created by zx on 11/26/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
#import "Cat.h"
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Animal *animal1 = [Animal new];
        [animal1 eat];
        
        Dog *dog1 = [Dog new];
        [dog1 eat];
        
        Cat *cat1 = [Cat new];
        [cat1 eat];
        
        Animal *animal2 = [Dog new];
        [animal2 eat];

        
        Person *p = [Person new];
        [p feedAnimal:dog1];
        [p feedAnimal:cat1];
        [p feedAnimal:animal1];
        
        Animal *animal3 = [Dog new];
        Dog *dog5 = (Dog *)animal3;
        [dog5 bark];
    }
    return 0;
}
