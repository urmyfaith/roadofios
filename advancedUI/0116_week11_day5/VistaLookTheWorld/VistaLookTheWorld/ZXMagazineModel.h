//
//  ZXMagazineModel.h
//  VistaLookTheWorld
//
//  Created by zx on 1/17/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 "id": "137",
 "title": "军训怎么了",
 "desc": "【军训怎么了】很多人都参加过军训，但这个系统到底是怎么运转的？56万教官怎样训1700万学生？20年前，北大复旦的学生（其中包括冯唐、张泉灵、范美忠、方三文等人）参加过长达一年的军训，又到底是怎么回事？国外又是怎么军训的？",
 "cover": "http://img2.ifenghui.com/ktx_t//article/src/2014/10/27/1414375424655.jpg",
 "pub_time": "2014-10-27",
 "year": "2014",
 "vol_year": "24",
 "update_time": "2014-10-27"
 */
@interface ZXMagazineModel : NSObject

@property(nonatomic,copy) NSString *id;
@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSString *desc;
@property(nonatomic,copy) NSString *cover;
@property(nonatomic,copy) NSString *pub_time;
@property(nonatomic,copy) NSString *year;
@property(nonatomic,copy) NSString *vol_year;
@property(nonatomic,copy) NSString *update_time;

+(ZXMagazineModel *)modelWithDictionary:(NSDictionary *)dic;
-(id)initWithDictionary:(NSDictionary *)dic;

@end
