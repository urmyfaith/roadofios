//
//  ZXTravelDataModel.h
//  1224_exercies_custom-cell-by-code
//
//  Created by zx on 12/25/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXTravelDataModel : NSObject

@property(nonatomic,copy) NSString    * placeImage;
@property(nonatomic,copy) NSString    * placeMutipageTitle;
@property(nonatomic,copy) NSString    * placePrice;
@property(nonatomic,copy) NSString    * placePriceOff;
@property(nonatomic,copy) NSString    * placeBookedNumber;
@property(nonatomic,copy) NSString    * placeDistrict;

+(ZXTravelDataModel *)traveDataModleWithDictionary:(NSDictionary *)dic;
@end
