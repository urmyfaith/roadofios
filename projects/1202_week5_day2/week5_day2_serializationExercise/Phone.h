//
//  Phone.h
//  1202_week5_day2
//
//  Created by zx on 12/2/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

/*
 1有一个红色的苹果手机,型号为:220
 请创建类,并进行归档保存
 */

#import <Foundation/Foundation.h>
typedef enum {
    ColorWithRed = 1,
    ColorWithBlack,
    ColorWithGolden
}Color;

@interface Phone : NSObject<NSCoding>

@property (nonatomic,copy)NSString *phoneName;
@property (nonatomic,assign)Color color;
@property (nonatomic,copy)NSString *modleName;

-(id)initPhoneWithName:(NSString *)phoneName
              andColor:(Color)color
              andModle:(NSString *)modleName;
@end
