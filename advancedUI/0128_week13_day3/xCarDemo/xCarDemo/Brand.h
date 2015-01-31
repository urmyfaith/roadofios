//
//  Brand.h
//  xCarDemo
//
//  Created by zx on 1/31/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  车品牌
 */
@interface Brand : NSObject

@property (nonatomic,strong) NSString    *brandName;//品牌名称
@property (nonatomic,strong) NSString    *brandIcon;//品牌图标
@property (nonatomic,strong) NSMutableArray    *brandSubBrandsArray;//品牌对应的所有厂商

@end
