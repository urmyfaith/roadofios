//
//  ZXArticleModel.h
//  Reveiew_database
//
//  Created by zx on 1/16/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXArticleModel : NSObject

@property(nonatomic,strong)NSString *articleId;
@property(nonatomic,strong)NSString *articleTitle;

@property(nonatomic,assign)int articleIndex;

@end
