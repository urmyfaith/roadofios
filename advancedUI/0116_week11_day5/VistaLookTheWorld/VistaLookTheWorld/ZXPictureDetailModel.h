//
//  ZXPictureDetailModel.h
//  VistaLookTheWorld
//
//  Created by zx on 1/19/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
{
 "code": 1,
 "msg": "OK",
 "list": [
 {
 "id": "",
 "title": "穿着校服上学去",
 "icon": "http://img2.ifenghui.com/ktx_t//wallpaper/src/2014/10/27/1414376927657.jpg",
 "small_icon": "http://img2.ifenghui.com/ktx_t//wallpaper/380/280/1/2014/10/27/1414376927657.jpg",
 "des": "又是一年开学季，世界各地的校服都是什么样子？作为在校学生统一的服装，校服已经成为学生时代不可或缺的一部分，一起看看具有民族特色的校服吧！ （IC图）图为博茨瓦纳中国印度马来西亚不丹",
 "author": "",
 "adddate": "2014-10-27"
 }
 ]
 }
 */
@interface ZXPictureDetailModel : NSObject

@property(nonatomic,copy)NSString *id;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *small_icon;
@property(nonatomic,copy)NSString *des;
@property(nonatomic,copy)NSString *author;
@property(nonatomic,copy)NSString *adddate;

+(ZXPictureDetailModel *)modelWithDic:(NSDictionary *)dic;

-(id)initWithDic:(NSDictionary *)dic;

@end
