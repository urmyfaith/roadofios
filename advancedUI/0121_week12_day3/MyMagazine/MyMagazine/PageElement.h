//
//  PageElement.h
//  MyMagazine
//
//  Created by zx on 1/21/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  每一个页中每一资源的属性
 */
@interface PageElement : NSObject


//a)节点名,b)节点所有的属性(存储PageAttribute对象).

@property(nonatomic,strong)NSString *pageElementName;
@property(nonatomic,strong)NSMutableArray *pageElementAttribute;

@end
