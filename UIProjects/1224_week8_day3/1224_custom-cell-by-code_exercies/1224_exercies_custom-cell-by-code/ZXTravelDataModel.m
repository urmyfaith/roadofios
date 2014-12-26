//
//  ZXTravelDataModel.m
//  1224_exercies_custom-cell-by-code
//
//  Created by zx on 12/25/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXTravelDataModel.h"

@implementation ZXTravelDataModel
+(ZXTravelDataModel *)traveDataModleWithDictionary:(NSDictionary *)dic{
    return [[ZXTravelDataModel alloc]initWithDictionary:dic];
}

-(id)initWithDictionary:(NSDictionary *)dic{
    if (self = [super init]) {
        self.placeImage = dic[@"wsdimg"];
        self.placeMutipageTitle = dic[@"multipagetitle"];
        self.placePrice = dic[@"price"];
        self.placePriceOff = dic[@"priceoff"];
        self.placeBookedNumber = dic[@"currentdealcount"];
        self.placeDistrict = dic[@"district"];
    }
    return self;
}
@end
