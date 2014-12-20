//
//  ZXTableData.m
//  1219_exercise_v1
//
//  Created by zx on 12/20/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXTableData.h"

@implementation ZXTableData

-(NSMutableArray *)cityNames{
    if ( _cityNames == nil) {
        _cityNames = [NSMutableArray array];
    }
    return _cityNames;
}
-(NSMutableArray *)cityImages{
    if ( _cityImages == nil) {
        _cityImages = [NSMutableArray array];
    }
    return _cityImages;
}
-(NSMutableArray *)cityDetails{
    if ( _cityDetails == nil) {
        _cityDetails = [NSMutableArray array];
    }
    return _cityDetails;
}

-(void)loadTableDataWithFileName:(NSString *)fileName
                     andFileType:(NSString *)fileType{
    NSString *path =  [[NSBundle mainBundle] pathForResource:fileName ofType:fileType];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    
    for (NSInteger index = 0 ; index < [array count]; index++) {
        NSDictionary *eachCityDic = array[index];
        [self.cityNames addObject:eachCityDic[@"cityName"]];
        [self.cityImages addObject:eachCityDic[@"cityImage"]];
        [self.cityDetails addObject:eachCityDic[@"cityDetail"]];
    }
}
@end
