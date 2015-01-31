//
//  Letter.h
//  xCarDemo
//
//  Created by zx on 1/31/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 *  分类首字母
 */
@interface Letter : NSObject

@property (nonatomic,strong) NSString    *letterName; //字母

@property (nonatomic,strong) NSMutableArray    *letterBrandsArray; //字母对应的所有品牌

@end
