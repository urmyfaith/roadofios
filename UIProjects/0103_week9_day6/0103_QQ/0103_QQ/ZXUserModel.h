//
//  ZXUserModel.h
//  0103_QQ
//
//  Created by zx on 1/3/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FMResultSet;

@interface ZXUserModel : NSObject

@property (nonatomic,assign) NSInteger     userId;
@property (nonatomic,strong) NSString      *userHeadImage;


+(ZXUserModel *)modelWithUserResult:(FMResultSet *)resultSet;


@end
