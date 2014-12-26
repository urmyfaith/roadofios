//
//  ZXCityModel.m
//  1224_UITableView01_customCell
//
//  Created by zx on 12/24/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXCityModel.h"

@implementation ZXCityModel

+(ZXCityModel *)cityWithDic:(NSDictionary *)dic{
    
#if 0  
    //ZXCityModel *cityModel = [[ZXCityModel alloc]init];
    ZXCityModel *cityModel = [[ZXCityModel alloc]initWithDic:dic];
    
    return cityModel;
#endif
    
    
#if 1
    return [[ZXCityModel alloc]initWithDic:dic];
#endif
    
}
//构造方法的都需要这样进行判断,显示父类初始化.
-(id )initWithDic:(NSDictionary *)dic{
    self  = [super init];
    if (self) {
        self.myName = dic[@"name"];
        self.myDetail = dic[@"detail"];
        self.myImageName = dic[@"image01"];
    
    }
    return self;
}
@end
