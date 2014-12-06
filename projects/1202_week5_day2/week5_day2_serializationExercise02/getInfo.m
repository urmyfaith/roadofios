//
//  getInfo.m
//  1202_week5_day2
//
//  Created by zx on 12/2/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "getInfo.h"

@implementation getInfo
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.phoneName
                  forKey:@"phoneName"];
    [aCoder encodeObject:[NSNumber numberWithInt:self.color]
                  forKey:@"color"];
    [aCoder encodeObject:self.modleName
                  forKey:@"modelName"];

}
-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.phoneName = [aDecoder decodeObjectForKey:@"phoneName"];
        self.color = (int)[[aDecoder decodeObjectForKey:@"color"] integerValue];
        self.modleName = [aDecoder decodeObjectForKey:@"modelName"];
    }
    return self;
}

@end

/*
#if 0

 从序列化的文件中,可以读取到

classname --->Phone
三个属性:
phoneName  -->Y---->字符类型
modelName
color      -->U  --->整数NSNumber

 
 然后创建类,类名一样,创建属性,属性一样.
 
 猜测协议;
 
#endif
*/