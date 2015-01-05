//
//  ZXMessageModel.h
//  0103_QQ
//
//  Created by zx on 1/3/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FMResultSet;

@interface ZXMessageModel : NSObject
@property (nonatomic,assign) NSInteger     messageId;
@property (nonatomic,assign) NSInteger     userId;
@property (nonatomic,strong) NSString      *messageContent;
@property (nonatomic,assign) BOOL          isTimeMessage;
@property (nonatomic,strong) NSString      *userHeadImage;

+(ZXMessageModel *)modelWithOneRowResult:(FMResultSet *)resultSet;

@end
