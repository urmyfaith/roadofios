//
//  main.m
//  block_memoryManage
//
//  Created by zx on 1/29/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import <Foundation/Foundation.h>


void foo(){
    __block int i = 1024;
    int j = 1;
    void (^blk)(void);
    void (^blkInHeap)(void);
    blk = ^{
        i = i+1;
        printf("%d,%d\n",i,j);
    };
    blk();
}

//-(void)fooBar{
//    _oi = 1;
//    OBJ1 *oj = self;
//    void(^oblk)(void) = ^{print("%d\n",oj.oi)};
//    void(^oblkInHeap)(void) = [oblk copy];
//    
//}

int main(int argc, const char * argv[])
{
    foo();
    @autoreleasepool {
        int i = 1024;
        void (^block1)(void) = ^{
            printf("%d\n", i);
        };
        block1();
        NSLog(@"%@", block1);
    }
    
    return 0;
}

