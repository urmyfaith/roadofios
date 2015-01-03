//
//  ZXCar.h
//  1229_week9_day1_kvc_kvo
//
//  Created by zx on 12/29/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZXEngine.h"
@interface ZXCar : NSObject
{
    int _speed;
}
@property (nonatomic,strong) NSString    *type;
@property (nonatomic,strong) ZXEngine    *engine;

@property (nonatomic,assign) CGFloat     mySpeed;

-(void)mySetValue:(id)value forKey:(NSString *)key;
@end
