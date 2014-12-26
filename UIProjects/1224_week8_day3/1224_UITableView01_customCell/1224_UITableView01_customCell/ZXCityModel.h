//
//  ZXCityModel.h
//  1224_UITableView01_customCell
//
//  Created by zx on 12/24/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXCityModel : NSObject

@property(nonatomic,copy)NSString *myName;
@property(nonatomic,copy)NSString *myDetail;
@property(nonatomic,copy)NSString *myImageName;

+(ZXCityModel *)cityWithDic:(NSDictionary *)dic;
-(id )initWithDic:(NSDictionary *)dic;
@end
