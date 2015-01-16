//
//  ZXDatabaseManager.h
//  Reveiew_database
//
//  Created by zx on 1/16/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZXArticleModel.h"


@interface ZXDatabaseManager : NSObject



+(ZXDatabaseManager *)sharedDatabaseManager;

/**
 *  创建数据库
 */
-(void)createDataBase;

/**
 *  创建表
 */
-(void)createTable;

-(void)insertDataWithArticle:(ZXArticleModel *)articleModel;

-(NSMutableArray *)selectDataWithArticleIndex:(int)articleIndex;

-(BOOL)selectAticleCount;

@end
