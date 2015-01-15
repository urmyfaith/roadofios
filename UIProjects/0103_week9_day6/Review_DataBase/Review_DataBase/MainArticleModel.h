//
//  MainArticleModel.h
//  Review_DataBase
//
//  Created by zx on 1/15/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainArticleModel : NSObject

@property(nonatomic,copy)NSString *author;
@property(nonatomic,copy)NSString *categoryname;
@property(nonatomic,copy)NSString *colid;
@property(nonatomic,copy)NSString *content;
@property(nonatomic,copy)NSString *createtime;
@property(nonatomic,copy)NSString *id;
@property(nonatomic,copy)NSString *relateids;
@property(nonatomic,copy)NSString *relatetitles;
@property(nonatomic,copy)NSString *subtitle;
@property(nonatomic,copy)NSString *thumb;
@property(nonatomic,copy)NSString *title;

+(MainArticleModel *)modelWithDic:(NSDictionary *)dic;
-(id)initWithDic:(NSDictionary *)dic;

@end


/*
 author = "<null>";
 categoryname = "\U884c\U4e1a\U65b0\U95fb";
 colid = 2;
 content = "+556eR5a2m5oql6YGT5raJ5Yy75LqL5Lu277yM5ZCI55CG6K6k6K+G5Yy75a2m5bGA6ZmQ5oCn77yM5rex5YWl5YWo6Z2i5LqG6Kej5Yy755aX5Y2r55Sf5bel5L2c55qE5oCd6ICD44CCDQogDQogDQo=";
 createtime = 1421253081;
 id = 7711;
 relateids =         (
 1,
 2,
 3
 );
 relatetitles =         (
 "\U5173\U8054\U6587\U7ae0\U6807\U98980",
 "\U5173\U8054\U6587\U7ae0\U6807\U98981",
 "\U5173\U8054\U6587\U7ae0\U6807\U98982"
 );
 subtitle = "<null>";
 thumb = "<null>";
 title = "2014\U5e74\U4e2d\U56fd\U536b\U751f\U8ba1\U751f\U5341\U5927\U65b0\U95fb\U8bc4\U51fa ";
 */