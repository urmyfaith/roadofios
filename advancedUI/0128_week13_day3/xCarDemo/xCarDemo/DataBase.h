//
//  DataBase.h
//  xCarDemo
//
//  Created by zx on 1/30/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FocusListItem.h"
#import "NewListItem.h"


@interface DataBase : NSObject


+(DataBase *)sharedDateBase;

-(void)createDataBase;
-(void)createTable;
-(void)insertFocusItem:(FocusListItem *)focusItem;
-(void)insertNewsItem:(NewListItem *)newsItem;

-(NSMutableArray *)selectFocusItem;

-(NSMutableArray *)selectNewItemWithIndex:(NSString *)index;

-(BOOL)selectFocusItemCount;

-(BOOL)selectNewItemCount;

-(void)deleteAllData;

@end
