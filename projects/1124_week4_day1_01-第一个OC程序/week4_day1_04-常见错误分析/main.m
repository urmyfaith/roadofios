//
//  main.m
//  week4_day1_04-常见错误分析
//
//  Created by zx on 11/24/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject{
    
}
-(void) run;
@end

@implementation Person

@end

@implementation Car{
    int _num;
}
-(void) run{
    
}
@end
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Person *p = [Person new];
        [p run];
    }
    return 0;
}
