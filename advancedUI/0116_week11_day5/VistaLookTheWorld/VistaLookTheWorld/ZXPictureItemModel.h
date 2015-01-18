//
//  ZXPictureItemModel.h
//  VistaLookTheWorld
//
//  Created by zx on 1/18/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 {
 "gid": "4905",
 "title": "穿着校服上学去",
 "icon": "http://img2.ifenghui.com/ktx_t//wallpaper/380/280/1/2014/10/27/1414376927657.jpg",
 "timestamp": "1414404006"
 },
 */

@interface ZXPictureItemModel : NSObject

@property(nonatomic,copy)NSString *gid;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *timestamp;

+(ZXPictureItemModel *)modeleWithDictionary:(NSDictionary *)dic;

-(id) initWithDictionary:(NSDictionary *)dic;

@end
