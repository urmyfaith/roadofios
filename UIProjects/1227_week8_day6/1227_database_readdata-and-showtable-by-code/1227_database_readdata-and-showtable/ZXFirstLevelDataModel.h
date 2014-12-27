//
//  ZXFirstLevelDataModel.h
//  1227_database_readdata-and-showtable
//
//  Created by zx on 12/27/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FMResultSet;


@interface ZXFirstLevelDataModel : NSObject

@property (nonatomic,assign)   NSInteger        pid;
@property (nonatomic,copy)     NSString         *pname;
@property (nonatomic,assign)   NSInteger        pcount;

+(ZXFirstLevelDataModel *)modelWithOneRow:(FMResultSet *)resultSet;
@end
