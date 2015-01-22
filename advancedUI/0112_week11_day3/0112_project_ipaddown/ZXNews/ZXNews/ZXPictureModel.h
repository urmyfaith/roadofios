//
//  ZXPictureModel.h
//  ZXNews
//
//  Created by qianfeng on 15/1/12.
//  Copyright (c) 2015年 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXPictureModel : NSObject
/*
 "ID": "508",
 "cid": "1",
 "title": "漂亮眼镜美眉手机壁纸",
 "thumb": "http://pic1.ipadown.com/thumb285/3/13933231587216.jpg",
 "tags": "眼镜,大美女",
 "desc": "",
 "imgs": "[\"http://pic1.ipadown.com/imgs/201103261319373409.jpg\",\"http://pic1.ipadown.com/imgs/201103261319373408.jpg\",\"http://pic1.ipadown.com/imgs/201103261319373411.jpg\",\"http://pic1.ipadown.com/imgs/201103261319373410.jpg\",\"http://pic1.ipadown.com/imgs/201103261319373413.jpg\",\"http://pic1.ipadown.com/imgs/201103261319373412.jpg\"]",
 "nums": "6",
 "size": "320x480",
 "add_time": "1303026796",
 "edit_time": "1303026796",
 "views": "4775",
 "good": "19",
 "bad": "5",
 "commend": "0",
 "status": "1"
 */
@property (copy,nonatomic) NSString *ID;
@property (copy,nonatomic) NSString *cid;
@property (copy,nonatomic) NSString *title;
@property (copy,nonatomic) NSString *thumb;
@property (copy,nonatomic) NSString *tags;
@property (copy,nonatomic) NSString *desc;
@property (copy,nonatomic) NSString *imgs;
@property (copy,nonatomic) NSString *nums;
@property (copy,nonatomic) NSString *size;
@property (copy,nonatomic) NSString *add_time;
@property (copy,nonatomic) NSString *edit_time;
@property (copy,nonatomic) NSString *views;
@property (copy,nonatomic) NSString *good;
@property (copy,nonatomic) NSString *bad;
@property (copy,nonatomic) NSString *commend;
@property (copy,nonatomic) NSString *status;


+(ZXPictureModel *)modelWithDic:(NSDictionary *)dic;
-(id)initWithDic:(NSDictionary *)dic;

@end
