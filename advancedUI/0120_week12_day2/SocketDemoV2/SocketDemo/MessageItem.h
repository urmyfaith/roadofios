//
//  MessageItem.h
//  SocketDemo
//
//  Created by zx on 1/20/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 *  数据模型
 *  模型===>二进制数据
 *  从二进制数据转换成模型属性.
 */
@interface MessageItem : NSObject

@property(nonatomic,strong) NSString *messageContent;
@property(nonatomic,strong) NSString *messageHost;
@property(nonatomic,strong) NSString *messageType;
@property(nonatomic,strong) NSMutableDictionary *messageDict;

-(NSData *)parseToData;
-(void )parseFromData:(NSData *)data;

@end
