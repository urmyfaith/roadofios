//
//  ZXBookDataModel.h
//  1224_custom-cell-by-xib
//
//  Created by zx on 12/24/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXBookDataModel : NSObject
@property(nonatomic,copy) NSString    * bookTitle;
@property(nonatomic,copy) NSString    * bookPrice;
@property(nonatomic,copy) NSString    * bookDetail;
@property(nonatomic,copy) NSString    * bookImageString;

+(ZXBookDataModel *)bookDataWithDictionary:(NSDictionary *)dic;

@end
