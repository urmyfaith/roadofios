//
//  ZXPictureModel.h
//  VistaLookTheWorld
//
//  Created by zx on 1/18/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXPictureModel : NSObject

@property(nonatomic,copy)NSMutableArray *pictureItems_array;


+(ZXPictureModel *)modelWithArray:(NSArray *)array;

-(id)initWithArray:(NSArray *)array;

@end
