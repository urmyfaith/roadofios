//
//  ZXCar.m
//  1229_week9_day1_kvc_kvo
//
//  Created by zx on 12/29/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXCar.h"

@implementation ZXCar
-(id)init{
    if (self = [super init]) {
        self.mySpeed = 0.0;
        [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(increaseSpeed:) userInfo:self repeats:YES];
    }
    return self;
}

-(void)increaseSpeed:(NSTimer *)timer{
    self.mySpeed +=0.01 *(arc4random()%10);
    if (self.mySpeed >1.0) {
        [timer invalidate];
    }
}

-(ZXEngine *)engine{
    if (_engine ==  nil) {
        _engine = [[ZXEngine alloc]init];
    }
    return _engine;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"%s [LINE:%d] unfound:%@,%@", __func__, __LINE__,key,value);
}

-(void)mySetValue:(id)value forKey:(NSString *)key{
    NSString *setMethodString = [NSString stringWithFormat:@"set%@:",[key capitalizedString]];
    NSLog(@"%s [LINE:%d] setMethodString=%@", __func__, __LINE__,setMethodString);
    SEL set_selector = NSSelectorFromString(setMethodString);
    if ([self respondsToSelector:set_selector]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self performSelector:set_selector withObject:value];
#pragma clang diagnostic pop
    }
    
}
@end
