//
//  ZXUserInfoModel.m
//  1217_UIActionSheet_UITextView_etc
//
//  Created by zx on 12/29/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXUserInfoModel.h"

@implementation ZXUserInfoModel

-(NSString *)description{
    return  [NSString stringWithFormat:@"\nkeyname:%@\nkeyvalue:%@",self.keyname,self.keyvalue];
}
@end
