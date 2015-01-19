//
//  ZXOuterModel.h
//  VistaLookTheWorld
//
//  Created by zx on 1/19/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 *
 {
 "cat_name": "时政",
 "list": [
 {
 "id": "4030",
 "title": "瑞士公投，准备给全民发工资"
 }
 ]
 },
 
 */
@interface ZXOuterModel : NSObject

@property(nonatomic,copy)NSString *cat_name;
@property(nonatomic,copy)NSMutableArray *innerModel_array;


+(ZXOuterModel *)modelWithDic:(NSDictionary *)dic;

-(id)initWithDic:(NSDictionary *)dic;


@end
