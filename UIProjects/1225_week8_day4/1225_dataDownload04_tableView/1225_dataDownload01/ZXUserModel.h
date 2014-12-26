//
//  ZXUserModel.h
//  1225_dataDownload01
//
//  Created by zx on 12/25/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ZXUserModel : NSObject

@property(nonatomic,copy) NSString    * myUserName;
@property(nonatomic,copy) NSString    * myUserID;
@property(nonatomic,copy) NSString    * myUserImage;

+(ZXUserModel *)userModelWith:(NSDictionary *)dic;
-(id)initWithDictionary:(NSDictionary *)dic;

@end
