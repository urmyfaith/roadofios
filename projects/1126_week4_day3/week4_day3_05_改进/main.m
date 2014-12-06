//
//  main.m
//  week4_day3_05人枪射击子弹BiuBiuBiu~~~
//
//  Created by zx on 11/26/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //
        //        Person *person1 = [Person new];
        //        person1.gun = [Gun new];
        //        person1.gun.bullet = [Bullet new];
        //        [person1.gun.bullet setBulletCount:4 ];
        //
        //        [person1 fire];
        //        [person1 fire];
        //        [person1 fire];
        //        [person1 fire];
        //        [person1 fire];
        
        Person *person1 = [[Person alloc] initWithGun:[[Gun alloc] initWithBullet:[[Bullet alloc] initWithBulletCount:-1]]];
        
        [person1 fire];
        [person1 fire];
        [person1 fire];
        [person1 fire];
        [person1 fire];
    }
    return 0;
}
