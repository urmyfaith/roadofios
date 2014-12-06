//
//  Phone.m
//  1202_week5_day2
//
//  Created by zx on 12/2/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "Phone.h"

@implementation Phone


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

-(NSString *)description{
    NSArray *ColorArray = @[@"红色",@"黑色",@"土豪金"];
    NSString *phoneColor = [[NSString alloc]init];
    switch (self.color) {
        case 1:
            phoneColor = ColorArray[0];
            break;
        case 2:
            phoneColor = ColorArray[1];
            break;
        case 3:
            phoneColor = ColorArray[2];
            break;
        default:
            phoneColor = @"blank";
            break;
    }
    
    NSString *string = [NSString stringWithFormat:@"\nphoneName=%@ \nphoneColor=%@ \nmodelName=%@",self.phoneName,phoneColor,self.modleName];
    return string;
}

-(id)initPhoneWithName:(NSString *)phoneName
              andColor:(Color)color
              andModle:(NSString *)modleName{
    if (self = [super init]) {
        _phoneName = phoneName;
        _color = color;
        _modleName = modleName;
    }
    return  self;
}
@end
