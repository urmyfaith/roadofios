//
//  ZXInnerModel.h
//  VistaLookTheWorld
//
//  Created by zx on 1/19/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXInnerModel : NSObject

@property(nonatomic,strong)NSString *id;
@property(nonatomic,strong)NSString *title;


+(ZXInnerModel *)modelWithDic:(NSDictionary *)dic;

-(id)initWithDic:(NSDictionary *)dic;

@end
